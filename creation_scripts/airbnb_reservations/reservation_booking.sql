/**
*
* The creation script for the Property Booking table
*
*/

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

    -- * The price per night
    -- ! This was broken down into the 3 separate parts after realising relying on the frontend
    -- ! for appropriate record keeping, as well as continuous FK relationships might not be good
    -- ! for records. For example, getting the financial modifier from the UserId > TierId > Mod is unreliable
    -- ! as the user might have changed tiers between the booking date and query date
    BasePricePerNight        decimal(14, 2) DEFAULT (0) NOT NULL,
    AppliedFinancialModifier decimal(3, 2) DEFAULT (0) NOT NULL,
    -- * The computed column from the base price and financial discount/modifier
    FinalPricePerNight AS (BasePricePerNight * AppliedFinancialModifier) PERSISTED,

    -- * Fees per night
    ServiceFeePerNight       decimal(14, 2) DEFAULT (0) NOT NULL,
    CleaningFeePerNight      decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * The total booking cost, computed from all nightly costs multiplied by the number of nights
    TotalBookingCost AS (
        (
            -- ? FinalPricePerNight needs to be rewritten as you cannot use a Computed col in another
            -- ? computed col in SQL Server 2025
            (BasePricePerNight * AppliedFinancialModifier)
            + ServiceFeePerNight + CleaningFeePerNight
        )
        * DATEDIFF(DAY, StartDate, EndDate)
    ) PERSISTED,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property type ID
    CONSTRAINT PK_PropertyBookings PRIMARY KEY CLUSTERED (BookingId),

    -- * Foreign key constraints for the Property and Booker IDs
    CONSTRAINT FK_PropertyBooking_User FOREIGN KEY (BookerId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_PropertyBooking_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId),

    -- * Non-negative validations
    CONSTRAINT CHK_NonNegative_BasePriceNight CHECK (BasePricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_FinalPriceNight CHECK (FinalPricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_ServiceFeeNight CHECK (ServiceFeePerNight >= 0),
    CONSTRAINT CHK_NonNegative_CleaningFeeNight CHECK (CleaningFeePerNight >= 0),
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
