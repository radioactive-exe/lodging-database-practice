/**
*
* The creation script for the Payment purpose table
*
*/

DROP TABLE IF EXISTS reservations.PaymentPurpose;

CREATE TABLE reservations.PaymentPurpose (

    /* Purpose Info
    ===================================== */

    PurposeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Refund", "Instalment", "Payout"
    PurposeName        varchar(64) NOT NULL UNIQUE,
    PurposeDescription varchar(256) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the payment purpose ID
    CONSTRAINT PK_PaymentPurpose PRIMARY KEY CLUSTERED (PurposeId)
);

PRINT 'Created Payment Purpose LUT.';
