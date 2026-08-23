/**
*
* The creation script for the Guest type table
*
*/

DROP TABLE IF EXISTS reservations.GuestType;

CREATE TABLE reservations.GuestType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Adult", "Child", "Pet"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the guest type ID
    CONSTRAINT PK_GuestType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Guest Type LUT.';

GO

/**
*
* The creation script for the Booking-Guest relationship table
*
*/

DROP TABLE IF EXISTS reservations.BookingGuests

CREATE TABLE reservations.BookingGuests (

    /* Guest booking info
    ===================================== */

    -- * The booking this record is for
    BookingId   bigint NOT NULL,

    -- * Guest type and quantity
    GuestTypeId tinyint NOT NULL,
    Quantity    tinyint DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key for the booking ID and guest types
    CONSTRAINT PK_BookingGuests PRIMARY KEY CLUSTERED (BookingId, GuestTypeId),

    -- * Foreign key constraints for the booking ID and guest types
    CONSTRAINT FK_BookingGuests_Booking FOREIGN KEY (BookingId) REFERENCES reservations.PropertyBookings (BookingId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_BookingGuests_GuestType FOREIGN KEY (GuestTypeId) REFERENCES reservations.GuestType (TypeId)
    ON UPDATE CASCADE,

    CONSTRAINT CHK_NonNegative_GuestQuantity CHECK (Quantity >= 0)
);

PRINT 'Created Booking-Guests Relationship table.';
