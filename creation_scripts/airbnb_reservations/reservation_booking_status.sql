/**
*
* The creation script for the Booking status table
*
*/

DROP TABLE IF EXISTS reservations.BookingStatus;

CREATE TABLE reservations.BookingStatus (

    /* Status Info
    ===================================== */

    StatusId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Reserved", "Complete", "On Hold"
    StatusName        varchar(64) NOT NULL UNIQUE,
    StatusDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the booking status ID
    CONSTRAINT PK_BookingStatus PRIMARY KEY CLUSTERED (StatusId)
);

PRINT 'Created Booking Status LUT.';
