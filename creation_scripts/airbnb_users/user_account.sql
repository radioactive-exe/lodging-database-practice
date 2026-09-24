/* =====================================
=          User Account Table          =
===================================== */

DROP TABLE IF EXISTS users.UserAccount;

CREATE TABLE
users.UserAccount (

    /* Credentials and IDs
    ===================================== */

    -- * The optimised integer internal ID to be used throughout the database
    -- * Instead of being a UUID, which I discovered is very non-optimised for JOINs
    -- * and other database FK uses. The UUID is now stored in the public user
    -- * profile table.  Being an Identity item, it starts at 1 and auto increments
    UserId         bigint IDENTITY (1, 1) NOT NULL UNIQUE,
    UserTier       tinyint NOT NULL,
    Email          varchar(50) NOT NULL UNIQUE,

    -- ? Password is a keyword in SQL Server, and so an alternative name was used,
    -- ? also indicating the fact that the stored password is hashed and not raw.

    -- * The hashing and strength requirements are assumed to be handled by the
    -- * frontend/application scope (aka beyond the database)
    HashedPassword varchar(255) NOT NULL,
    PhoneNumber    varchar(30) NOT NULL,

    /* Dates and Tracking
    ===================================== */

    -- ! This was originally not in the plan, but as I was writing the test case
    -- ! regarding checking cross-country bookings, I realised that there is no way
    -- ! to reliably determine a user's country of origin/residence given the current
    -- ! implementation. You have to join across the billing address table and then the
    -- ! payment methods table to get the country of the user, inflating joins and also
    -- ! being problematic with the fact that users can have multiple billing addresses
    -- ! and payment methods, without a single "primary" one to derive a user's
    -- ! potential address from.
    -- * The user's country of residence
    UserCountry    smallint NOT NULL,
    -- * Can be null, as the user may have never hosted
    HostingSince   date,
    -- * Creation and Updating dates are automatically populated
    -- * on row creation, ensuring they are not null
    CreatedAt      datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,
    ModifiedAt     datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,

    /* Constraints
    ===================================== */

    -- * The Primary Key Constraint for the user account
    CONSTRAINT PK_UserId PRIMARY KEY CLUSTERED (UserId),

    -- * The Foreign Key Constraint for the user tier id and user Country
    CONSTRAINT FK_UserAccount_UserTier FOREIGN KEY (UserTier)
    REFERENCES users.UserTier (TierId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_UserAccount_Country FOREIGN KEY (UserCountry)
    REFERENCES locations.Country (CountryId),

    -- ? Checks that the phone number is a valid international number
    CONSTRAINT CHK_Valid_PhoneNumber CHECK (dbo.FN_IsValidPhoneNumber(PhoneNumber) = 1),
    -- ? Checks that the email is valid
    CONSTRAINT CHK_Valid_Email CHECK (dbo.FN_IsValidEmail(Email) = 1),
    -- ? Checks that the modified date is after/at the created date
    CONSTRAINT CHK_Valid_AccountModifiedAt CHECK (ModifiedAt >= CreatedAt)
);

PRINT 'Created User Account table.';

GO

-- * The trigger to automatically update the ModifiedAt in the User Account table
CREATE TRIGGER users.TR_UserAccount_UpdateModifiedAt
ON users.UserAccount
AFTER UPDATE
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the updated time into the newly updated row
    UPDATE users.UserAccount
    -- ? ModifiedAt automatically gets populated with the current time (in UTC, like
    -- ? CreatedAt)
    SET ModifiedAt = SYSUTCDATETIME()
    FROM users.UserAccount
    INNER JOIN inserted ON (UserAccount.UserId = inserted.UserId);
END;

GO

PRINT 'Created User Account `ModifiedAt` updating trigger.';
