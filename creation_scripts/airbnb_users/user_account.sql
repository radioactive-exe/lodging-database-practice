/**
*
* The creation script for the User Accounts table.
*
*/
DROP TABLE IF EXISTS users.UserAccount;

CREATE TABLE
users.UserAccount (
    -- * Automatically-populated UUID
    Uuid uniqueidentifier NOT NULL UNIQUE DEFAULT NEWID(),
    UserTier int NOT NULL,
    Email varchar(50) NOT NULL UNIQUE,
    -- ? Password is a keyword in SQL Server, and so
    -- ? an alternative name was used, also indicating the fact that the
    -- ? stored password is hashed and not raw.
    HashedPassword varchar(255) NOT NULL,
    PhoneNumber varchar(30) NOT NULL,
    HostingSinceDate date,
    -- Creation and Updating dates are automatically populated 
    -- on row creation, ensuring they are not null
    CreatedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
    ModifiedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
    -- * The Primary Key Constraint for the user account
    CONSTRAINT PK_Uuid PRIMARY KEY CLUSTERED (Uuid),
    CONSTRAINT Chk_Valid_PhoneNumber CHECK (dbo.fn_IsValidPhoneNumber(PhoneNumber) = 1)
);
