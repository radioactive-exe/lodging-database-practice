/* =====================================
=       Property Bookings table        =
===================================== */

DROP TABLE IF EXISTS reservations.PropertyBookings;

CREATE TABLE reservations.PropertyBookings (

    /* Booking Identification
    ===================================== */

    BookingId                bigint IDENTITY (1, 1) NOT NULL,
    -- * The property being booked
    PropertyId               bigint NOT NULL,
    -- * The user/customer that booked the property
    BookerId                 bigint NOT NULL,

    /* Booking Info
    ===================================== */

    -- * The current status of the booking
    BookingStatusId          tinyint NOT NULL,

    -- * The booking check-in and check-out dates
    StartDate                date NOT NULL,
    EndDate                  date NOT NULL,

    /* Booking Finances
    ===================================== */

    -- ! This was broken down into the 3 separate parts after realising relying on
    -- ! the frontend for appropriate record keeping, as well as continuous FK
    -- ! relationships might not be good for records. For example, getting the
    -- ! financial modifier from the UserId > TierId > Mod is unreliable as the user
    -- ! might have changed tiers between the booking date and query date
    -- * The base price per night
    BasePricePerNight        decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * The financial modifier applied to this booking
    AppliedFinancialModifier decimal(3, 2) DEFAULT (0) NOT NULL,

    -- * The computed price per night
    FinalPricePerNight       decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * Fees per night
    ServiceFeePerNight       decimal(14, 2) DEFAULT (0) NOT NULL,
    CleaningFeePerNight      decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * The total price per night, with fees
    TotalPricePerNight       decimal(15, 2) DEFAULT (0) NOT NULL,

    -- * The total booking cost, computed from all nightly costs multiplied by the
    -- * number of nights
    TotalBookingCost         decimal(16, 2) DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property type ID
    CONSTRAINT PK_PropertyBookings PRIMARY KEY CLUSTERED (BookingId),

    -- * Foreign key constraints for the Property and Booker IDs
    CONSTRAINT FK_PropertyBooking_User FOREIGN KEY (BookerId)
    REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_PropertyBooking_Property FOREIGN KEY (PropertyId)
    REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE,

    -- * Non-negative validations
    CONSTRAINT CHK_NonNegative_BasePriceNight CHECK (BasePricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_FinalPriceNight CHECK (FinalPricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_ServiceFeeNight CHECK (ServiceFeePerNight >= 0),
    CONSTRAINT CHK_NonNegative_CleaningFeeNight CHECK (CleaningFeePerNight >= 0),
    CONSTRAINT CHK_NonNegative_TotalNightCost CHECK (TotalPricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_TotalCost CHECK (TotalBookingCost >= 0),

    -- * Date validation
    CONSTRAINT CHK_Valid_BookingEndDate CHECK (EndDate >= StartDate),

    -- ? Limits the modifier between 0 and 2
    -- ? Allows numbers above 1 in case they are needed for whatever reason
    -- ? for example, an "on probation" or "penalty" tier? Maybe
    CONSTRAINT CHK_Valid_BookingFinancialModifier CHECK (
        AppliedFinancialModifier <= 2 AND AppliedFinancialModifier >= 0
    )
);

PRINT 'Created Property Bookings table.';

GO

/* ========================================
=  Booking Price info Population trigger  =
======================================== */

-- ? The trigger calculates and populates the price info for a booking based on the
-- ? property pricing

CREATE TRIGGER reservations.TR_Bookings_PopulatePriceInfo
ON reservations.PropertyBookings
AFTER INSERT
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the calculated and populated booking price info into the newly updated row
    UPDATE PropertyBookings
    SET
        -- * The base price per night
        PropertyBookings.BasePricePerNight = Prop.PerNightCost,

        -- * The fees per night
        PropertyBookings.CleaningFeePerNight = Prop.CleaningFeePerNight,
        PropertyBookings.ServiceFeePerNight = Prop.ServiceFeePerNight,

        -- * The financial modifier applied to this booking
        PropertyBookings.AppliedFinancialModifier = UsrTr.TierFinancialModifier,

        -- * The modified price per night
        PropertyBookings.FinalPricePerNight = Prop.PerNightCost * UsrTr.TierFinancialModifier,

        -- * The total booking cost per night, including the fees
        PropertyBookings.TotalPricePerNight = Prop.PerNightCost * UsrTr.TierFinancialModifier + Prop.CleaningFeePerNight + Prop.ServiceFeePerNight,

        -- * And lastly, the total booking cost for the entire reservation/booking
        PropertyBookings.TotalBookingCost = (
            Prop.PerNightCost * UsrTr.TierFinancialModifier
            + Prop.CleaningFeePerNight + Prop.ServiceFeePerNight
        ) * DATEDIFF(DAY, Ins.StartDate, Ins.EndDate)

    FROM reservations.PropertyBookings AS Bks
    -- ? And join the tables for the relevant data

    -- * The inserted row for the new data
    INNER JOIN
        inserted AS Ins
        ON Bks.BookingId = Ins.BookingId

    -- * The property table for base property info
    INNER JOIN
        properties.Property AS Prop
        ON Ins.PropertyId = Prop.PropertyId

    -- * The user account table to get the user's tier
    INNER JOIN
        users.UserAccount AS UsrAc
        ON Ins.BookerId = UsrAc.UserId

    -- * The user tier table to get the tier financial modifier
    INNER JOIN
        users.UserTier AS UsrTr
        ON UsrAc.UserTier = UsrTr.TierId;
END;

GO

PRINT 'Created Booking Price Info population function.';
