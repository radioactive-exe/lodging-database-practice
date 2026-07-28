/**
*
* The creation script for the User Accounts table.
*
*/

DROP TABLE IF EXISTS users.UserAccount;

CREATE TABLE
users.UserAccount (

    /* Credentials and IDs
    ===================================== */

    -- * The optimised integer internal ID to be used throughout the database
    -- * Instead of being a UUID, which I discovered is very non-optimised for JOINs
    -- * and other database FK uses. The UUID is now stored in the public user profile table.
    -- * Being an Identity item, it starts at 1 and auto increments
    UserId         bigint IDENTITY (1, 1) NOT NULL UNIQUE,
    UserTier       tinyint NOT NULL,
    Email          varchar(50) NOT NULL UNIQUE,
    -- ? Password is a keyword in SQL Server, and so
    -- ? an alternative name was used, also indicating the fact that the
    -- ? stored password is hashed and not raw.
    -- * The hashing is supposed to be handled by the application layer, so out of this project scope
    -- * Also, the strength requirements are enforced by the frontend
    HashedPassword varchar(255) NOT NULL,
    PhoneNumber    varchar(30) NOT NULL,

    /* Dates and Tracking
    ===================================== */

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

    -- * The Foreign Key Constraint for the user tier id
    CONSTRAINT FK_UserAccount_UserTier FOREIGN KEY (UserTier) REFERENCES users.UserTier (TierId),

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
    -- ? ModifiedAt automatically gets populated with the current time (in UTC, like CreatedAt)
    SET ModifiedAt = SYSUTCDATETIME()
    FROM users.UserAccount
    INNER JOIN inserted ON (UserAccount.UserId = inserted.UserId);
END;

GO

PRINT 'Created User Account `ModifiedAt` updating trigger.';
