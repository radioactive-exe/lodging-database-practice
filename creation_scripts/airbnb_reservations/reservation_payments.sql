/**
*
* The creation script for the Payments table, tracking all payments for bookings, installments, refunds, etc.
*
*/

DROP TABLE IF EXISTS reservations.Payments;

CREATE TABLE reservations.Payments (

    /* Payment Identification & Association
    ===================================== */

    PaymentId        bigint IDENTITY (1, 1) NOT NULL,
    -- * The booking this payment is connected with
    AssocBookingId   bigint NOT NULL,
    -- * The payment method used for this payment
    PaymentMethodId  bigint NOT NULL,

    /* Payment Classification
    ===================================== */

    -- * What this payment was for - a refund, a host payout, an instalment, etc.
    PaymentPurposeId tinyint NOT NULL,
    -- * The current status of the payment - on hold, delivered, etc.
    PaymentStatusId  tinyint NOT NULL,

    /* Payment information
    ===================================== */

    -- * The user paying the money
    PayerId          bigint NOT NULL,
    -- * The user receiving this payment
    PayeeId          bigint NOT NULL,

    -- * The amount paid in this transaction
    PaidAmount       decimal(14, 2) NOT NULL,

    -- ! The columns below were initially not in the plan, but while developing this database's
    -- ! tables it seemed completely logical to add them

    -- * The date and time this payment was made on
    PaidOn           datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    -- * Any optional comment attached to the payment
    PaymentComment   nvarchar(500),

    -- * The remaining amount/balance for the booking after this payment is accumulated
    AmountRemaining  decimal(14, 2) DEFAULT (0.0) NOT NULL,

    /* Constraints
    ===================================== */

    -- ? The primary key constraint for the payment ID
    CONSTRAINT PK_Payments PRIMARY KEY CLUSTERED (PaymentId),

    -- ? The foreign key constraint for the associated booking
    CONSTRAINT FK_Payments_AssociatedBooking FOREIGN KEY (AssocBookingId) REFERENCES reservations.PropertyBookings (BookingId),

    -- ? The foreign key constraints for the payment classification (method, purpose, and status)
    CONSTRAINT FK_Payments_PaymentMethod FOREIGN KEY (PaymentMethodId) REFERENCES users.PaymentMethod (MethodId),
    CONSTRAINT FK_Payments_PaymentPurpose FOREIGN KEY (PaymentPurposeId) REFERENCES reservations.PaymentPurpose (PurposeId),
    CONSTRAINT FK_Payments_PaymentStatus FOREIGN KEY (PaymentStatusId) REFERENCES reservations.PaymentStatus (StatusId),

    -- ? The foreign key constraints for the involved users/parties
    CONSTRAINT FK_Payments_Payer FOREIGN KEY (PayerId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_Payments_Payee FOREIGN KEY (PayeeId) REFERENCES users.UserAccount (UserId),

    -- ? Validates that the payment amount is non-negative
    CONSTRAINT CHK_NonNegative_PaymentAmount CHECK (PaidAmount >= 0),

    -- ? Checks that the payer and payee are not the same user (no money laundering in this database on my watch)
    CONSTRAINT CHK_Payments_DiffParties CHECK (PayerId != PayeeId)
);

PRINT 'Created Payments table.';

GO

/**
*
* The function that calculates the remaining balance to be paid after a newly inputted payment/refund,
* accounting for the payment type and booking status
*
*/

CREATE FUNCTION reservations.FN_GetRemainingBalance(
    -- * The associated booking to get the payment information for
    @BookingID bigint,

    -- * The last/newest payment info
    @NewPaymentId bigint,
    @NewPaidAmount decimal(14, 2),
    @NewPaymentPurpose tinyint
)
RETURNS decimal(14, 2)
AS
BEGIN
    -- * The variable to store the cumulative payment/balance sum for the booking
    DECLARE @CumulativeSum decimal(14, 2);

    -- ? Declaring and populating the associated booking's cost and status (to check if it's cancelled later on)
    DECLARE @FullCost decimal(14, 2);
    DECLARE @AssociatedBookingStatus tinyint;
    -- 1. Fetch original cost and status
    SELECT
        @FullCost = PropertyBookings.TotalBookingCost,
        @AssociatedBookingStatus = PropertyBookings.BookingStatusId
    FROM reservations.PropertyBookings
    WHERE PropertyBookings.BookingId = @BookingID;

    -- ? Get and store the defined ID for a Cancelled booking Status
    DECLARE @CancelledStatusID tinyint;
    SELECT @CancelledStatusID = StatusId FROM reservations.BookingStatus
    WHERE StatusName = 'Cancelled';

    -- ? Get and store the defined ID for a Refund payment Purpose
    DECLARE @RefundPurposeID tinyint;
    SELECT @RefundPurposeID = PurposeId FROM reservations.PaymentPurpose
    WHERE PurposeName = 'Refund';

    -- ? If the booking we are tracking has been cancelled, then the full cost starting point is now nothing
    -- ! If there were a cancellation fee implemented in the hypothetical airbnb system we are making, then it would simply be that number
    -- ! instead of 0 here, or even that percentage * the total cost, etc. But, the same logic applies,
    -- ? We do this so that if a booking is cancelled and the customer has already paid, the system tracks how much they are owed in refunds
    IF (@AssociatedBookingStatus = @CancelledStatusID)
        SET @FullCost = 0;

    -- ? Now, we sum up all previous payments (before this new/last one)
    SELECT
        @CumulativeSum = SUM(
            -- ? Add either the paid amount or subtract it/add its negative if it was a refund
            Payments.PaidAmount * IIF(Payments.PaymentPurposeId = @RefundPurposeId, -1, 1)
        )
    FROM reservations.Payments
    WHERE
        -- ? Make sure to check this booking's records, and those previous to the new one whose trigger is calling this function
        Payments.AssocBookingId = @BookingID
        AND Payments.PaymentId < @NewPaymentId;

    -- ? Now, to return, take the full cost (1/3)
    RETURN @FullCost - (
        -- ? Subtract the cumulative paid balance so far (2/3)
        ISNULL(@CumulativeSum, 0)
        + (
            -- ? And then add (or subtract/add the negative of) the newest payment, and voila
            @NewPaidAmount
            * IIF(@NewPaymentPurpose = @RefundPurposeId, -1, 1)
        )
    );
END;

GO

PRINT 'Created Remaining Booking Balance Calculation function.';

GO

/**
*
* The trigger that calculates and populates the remaining balance column in the Payments table on inserting a new payment
* ! This was originally planned to be a computed column, but unfortunately because I am using a defined function, I could not set it
* ! as PERSISTED, which meant that this would have to be dynamically calculated on each SELECT. That is definitely not well optimised
* ! Also, that is why this trigger merely calls the function itself instead of housing the logic - I reused the function above in the trigger
* ! without having to refactor the whole function to work in a trigger. Also, this allows me to properly/clearly document everything in the function above
*
*/

CREATE TRIGGER reservations.TR_Payments_PopulateRemainingBalance
ON reservations.Payments
AFTER INSERT
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the calculated remaining balance into the newly updated row
    UPDATE Payments
    SET
        -- ? Calls the above function to set its value to the AmountRemaining column
        Payments.AmountRemaining = reservations.FN_GetRemainingBalance(
            NewPayment.AssocBookingId,
            NewPayment.PaymentId,
            NewPayment.PaidAmount,
            NewPayment.PaymentPurposeId
        )
    FROM reservations.Payments
    INNER JOIN inserted AS NewPayment ON Payments.PaymentId = NewPayment.PaymentId;
END;

GO

PRINT 'Created Booking Payment `AmountRemaining` population function.';
