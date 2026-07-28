/**
*
* The creation script for the users' Payment Methods table
*
*/

DROP TABLE IF EXISTS users.PaymentMethod;

CREATE TABLE users.PaymentMethod (

    /* Method Classification
    ===================================== */

    MethodId                   bigint IDENTITY (1, 1) NOT NULL,
    -- * From the table under the reservations schema
    MethodType                 tinyint NOT NULL,
    -- * The associated billing address with this payment method
    BillingAddress             bigint NOT NULL,

    /* User-side Info
    ===================================== */

    OwnerId                    bigint NOT NULL,
    -- * What this payment method is saved as, such as "My Credit Card"
    MethodName                 nvarchar(50) NOT NULL,

    /* Billing Fields
    ===================================== */

    -- * Originally, I planned to just include the Cardholder name as one of the fields in
    -- * credit cards or other types that needed names, and instead take the name based on the OwnerId.
    -- ! However, I realised that the payment method name can very commonly be different than the account's owner
    -- ! For example, using a shared credit card with a spouse's name, using a parent's bank account, using a shared
    -- ! crypto wallet, etc. This was thus split off into a dedicated billing-related name for this purpose.
    BillingName                nvarchar(100) NOT NULL,

    -- * Neutral/multi-purpose fields, the values of which are enforced based on the method type using constraints
    Field1                     varchar(100),
    Field2                     varchar(100),
    Field3                     varchar(100),
    Field4                     varchar(100),
    Field5                     varchar(100),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the Payment Method ID
    CONSTRAINT PK_PaymentMethodId PRIMARY KEY CLUSTERED (MethodId),

    -- * Foreign key constraint for the payment method type ID
    CONSTRAINT FK_PaymentMethod_MethodType FOREIGN KEY (MethodType) REFERENCES reservations.PaymentMethodType (TypeId),
    -- * Foreign key constraint for the payment method's associated billing address
    CONSTRAINT FK_PaymentMethod_BillingAddress FOREIGN KEY (BillingAddress) REFERENCES users.BillingAddress (AddressId),
    -- * Foreign key constraint for the user who saved/added the payment method
    CONSTRAINT FK_PaymentMethod_User FOREIGN KEY (OwnerId) REFERENCES users.UserAccount (UserId),

    -- * Constraint to validate the billing name for any payment type
    CONSTRAINT CHK_Valid_BillingName CHECK (dbo.FN_IsValidName(BillingName) = 1),

    /* Type-specific Constraints
    ===================================== */

    -- ? The payment method types will be populated manually, with the following order:
    -- ?    1 - Card
    -- ?    2 - Digital Wallet (Google/Apple pay)
    -- ?    3 - Paypal/Venmo
    -- ?    4 - Buy now & Pay Later (BNPL)
    -- ?    5 - Bank Transfer

    -- * Validates if the method is a card, or skips
    CONSTRAINT CHK_Valid_CardPaymentMethod CHECK (
        -- ? If the method is not a card, skip
        MethodType != 1
        -- ? Otherwise, check card fields
        OR (
            -- ? Checking the card number
            dbo.FN_IsValidCardNumber(Field1) = 1

            -- ! The month and year are separate both for normal forms and for easier checks
            -- ! and validation (see trigger below)
            -- ? Checking the month, 2 digits between 1 and 12 in value (01 = 1, etc.)
            AND REGEXP_LIKE(Field2, '^[0-9]{2}$')
            AND CAST(Field2 AS int) BETWEEN 1 AND 12

            -- ? Checking the year, either 2 or 4 digits
            AND REGEXP_LIKE(Field3, '^([0-9]{2}|[0-9]{4})$')

            -- ? Checking the CVV/CVC, ensuring it is 3 or 4 digits
            AND REGEXP_LIKE(Field4, '^[0-9]{3,4}$')

            -- ? Checking that the last field is empty
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is a digital wallet, or skips
    CONSTRAINT CHK_Valid_DigitalWalletPaymentMethod CHECK (
        -- ? If the method is not a card, skip
        MethodType != 2
        -- ? Otherwise, check digital wallet fields
        OR (
            -- ? Checks the full merchant/payment token (Letters, numbers, underscores, hyphens),
            -- ? assuming this is handled by the frontend through stripe
            -- ? (https://gist.github.com/fnky/76f533366f75cf75802c8052b577e2a5?permalink_comment_id=4346671#gistcomment-4346671)
            REGEXP_LIKE(Field1, '^[a-z]{2,5}_[0-9A-Za-z]{8,58}$')

            -- ? Checks the month and year, same as above
            AND REGEXP_LIKE(Field2, '^[0-9]{2}$')
            AND CAST(Field2 AS int) BETWEEN 1 AND 12
            AND REGEXP_LIKE(Field3, '^([0-9]{2}|[0-9]{4})$')

            -- ? Checks if the Payment provider is valid
            AND Field4 IN ('APPLE_PAY', 'GOOGLE_PAY')

            -- ? Checking that the last field is empty
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is Paypal/Venmo, or skips
    CONSTRAINT CHK_Valid_PayPalVenmoPaymentMethod CHECK (
        -- ? If the method is not Paypal/Venmo, skip
        MethodType != 3
        OR (
            (
            -- ? If it is PayPal, Field1 is the payer ID or a vault ID
            -- ? (https://developer.paypal.com/docs/api/payment-tokens/v3/)
                Field4 = 'PAYPAL'
                AND REGEXP_LIKE(Field1, '^[A-Z0-9]{13,36}$')
            )
            OR
            (
            -- ? If it is Venmo, Field1 stores the username (starts with @, allows letters/numbers/hyphens/underscores)
                Field4 = 'VENMO'
                AND dbo.FN_IsValidUsername(Field1) = 1
            )

            -- ? Checking that the other 3 fields are empty
            AND Field2 IS NULL
            AND Field3 IS NULL
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is a BNPL method, or skips
    CONSTRAINT CHK_Valid_BNPLPaymentMethod CHECK (
        -- ? If the method is not a BNPL system, skip
        MethodType != 4
        OR (
            -- ? Check the stored/saved token, usually between 30-60 characters with numbers, letters,
            -- ? hyphens, underscores, and sometimes slashes. Length limits are with padding
            -- ? eg: (https://documentation.lemonway.com/reference/moneyins_cardwebinitpost)
            REGEXP_LIKE(Field1, '^[A-Za-z0-9_/-]{10,100}$')
            AND

            -- ? Check the provider/system
            Field4 IN ('KLARNA', 'AFFIRM', 'AFTERPAY', 'SPLITIT')

            -- ? Check that the remaining fields are empty
            AND Field2 IS NULL
            AND Field3 IS NULL
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is a Bank account, or skips
    CONSTRAINT CHK_Valid_BankPaymentMethod CHECK (
        -- ? If the method is not a Bank account/transfer location, skip
        MethodType != 5
        OR (
            -- ! NOTE: While there are many other bank transfer types in the real world,
            -- ! I will keep this Bank transfer to a simple IBAN system. Otherwise, there
            -- ! can be easy checks similar to the Paypal/Venmo options shown above
            -- ? Checks the IBAN  (https://www.iban.com/structure)
            REGEXP_LIKE(Field1, '^[A-Z]{2}[0-9]{2}[A-Z0-9]{10,30}$')

            -- ? Checks the BIC/SWIFT Code (https://wise.com/gb/swift-codes/)
            AND REGEXP_LIKE(Field2, '^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$')

            -- ? Checks the account type
            AND Field4 IN ('CHECKING', 'SAVINGS')

            -- ? Checks that the remaining 2 fields are null
            AND Field3 IS NULL
            AND Field5 IS NULL
        )
    )
);

PRINT 'Created the Payment Methods table.';

GO

/**
*
* The creation script for the card date validation trigger
*
*/

CREATE TRIGGER users.TR_PaymentMethod_ValidateCardExpiryDate
ON users.PaymentMethod
AFTER INSERT, UPDATE
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? The current month & year
    DECLARE @CurrentMonth int = MONTH(GETDATE());
    DECLARE @CurrentYear int = YEAR(GETDATE());
    DECLARE @Flag bit = 0;

    -- ? Normalise the year for reuse, and also keep the method type and month
    WITH
        NormalisedDates AS (
            SELECT
                MethodType,
                CAST(Field2 AS int) AS ExpiryMonth,
                IIF(
                    LEN(Field3) = 2,
                    2000 + CAST(Field3 AS int),
                    CAST(Field3 AS int)
                )                   AS ExpiryYear
            FROM inserted
        )

    -- ? If a row is returned, then the flag updates to 1
    -- ? (https://learn.microsoft.com/en-us/sql/t-sql/language-elements/select-local-variable-transact-sql?view=sql-server-ver17)
    SELECT TOP 1 @Flag = 1
    FROM NormalisedDates
    WHERE
        -- ? If it's a credit card or digital wallet entry
        MethodType IN (1, 2)
        AND (
            -- ? If the year is before the current one
            ExpiryYear < @CurrentYear
            -- ? If the year is more than the approximate max year based on the method type
            OR ExpiryYear > (
                @CurrentYear + CASE MethodType
                    -- * If it is a card, then usually 3-5 years
                    WHEN 1 THEN 5
                    -- * If it is a digital wallet, then up to 10 years
                    WHEN 2 THEN 10
                    ELSE 5
                END
            )
            -- ? If the year is the current year, but the month is a previous month
            OR
            (
                ExpiryYear = @CurrentYear
                AND ExpiryMonth < @CurrentMonth
            )
        )

    IF @Flag = 1
        BEGIN
            -- ? If the card inserted/updated is expired
            RAISERROR ('Inserted credit card is expired! Please verify the card details.', 16, 1);
            -- * Rewind
            ROLLBACK TRANSACTION;
        END
END;

GO

PRINT 'Created Card Date Validation trigger.';
