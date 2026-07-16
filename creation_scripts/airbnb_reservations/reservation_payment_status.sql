/**
*
* The creation script for the Payment status table
*
*/

DROP TABLE IF EXISTS reservations.PaymentStatus;

CREATE TABLE reservations.PaymentStatus (

    /* Status Info
    ===================================== */

    StatusId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Refunded", "Rolled back", "Delivered", "On Hold"
    StatusName        varchar(64) NOT NULL UNIQUE,
    StatusDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the payment status ID
    CONSTRAINT PK_PaymentStatus PRIMARY KEY CLUSTERED (StatusId)
);

PRINT 'Created Payment Status LUT.';
