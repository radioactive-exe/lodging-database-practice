/**
*
* The creation script for the Payment Method Type table
*
*/

DROP TABLE IF EXISTS reservations.PaymentMethodType;

CREATE TABLE reservations.PaymentMethodType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Credit Card", "Paypal", "Online Wallet"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the payment method type ID
    CONSTRAINT PK_PaymentMethodTypeId PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Payment Method Type LUT.';
