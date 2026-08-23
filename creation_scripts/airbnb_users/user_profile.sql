/**
*
* The creation script for the User Profile table.
*
*/

DROP TABLE IF EXISTS users.UserProfile;

CREATE TABLE
users.UserProfile (
    /* User ID and public UUID
    ===================================== */

    -- * The internal user ID will be used as the foreign and primary key for this table as well,
    -- * which should hopefully result in easier searching and a redundant ensuring of a strict 1-to-1 relationship
    UserId            bigint NOT NULL UNIQUE,
    -- * Automatically-populated UUID, which will be used in profile URLs and other public-facing contexts
    -- ! This was used in place of the original UUID and profile ID setup after more understanding of privacy and UUIDs
    -- ! Also, instead of using Airbnb's numeric IDs for profile URLs etc., using a UUID is easier to generate
    PublicUserUuid    uniqueidentifier DEFAULT NEWID() NOT NULL UNIQUE,

    /* Basic Info
    ===================================== */

    FirstName         nvarchar(100) NOT NULL,
    LastName          nvarchar(100) NOT NULL,
    ProfilePictureUrl varchar(1500),

    /* Linked Accounts
    ===================================== */

    FacebookLink      varchar(1500),
    InstagramLink     varchar(1500),
    LinkedinLink      varchar(1500),

    /* Times and tracking
    ===================================== */

    -- * Creation and Updating dates are automatically populated
    -- * on row creation, ensuring they are not null
    CreatedAt         datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,
    ModifiedAt        datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,

    /* Constraints
    ===================================== */

    -- * The internal User ID is both the primary and a foreign key
    CONSTRAINT PK_Profile_User PRIMARY KEY CLUSTERED (UserId),
    CONSTRAINT FK_Profile_User FOREIGN KEY (UserId) REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * Constraints to validate the URLs for the (1) profile pic. and (2) linked social media accounts
    -- * (1)
    CONSTRAINT CHK_ValidURL_ProfilePictureUrl CHECK (dbo.FN_IsValidURL(ProfilePictureUrl) = 1),
    -- * (2)
    CONSTRAINT CHK_ValidURL_FacebookLink CHECK (dbo.FN_IsValidURL(FacebookLink) = 1),
    CONSTRAINT CHK_ValidURL_InstagramLink CHECK (dbo.FN_IsValidURL(InstagramLink) = 1),
    CONSTRAINT CHK_ValidURL_LinkedinLink CHECK (dbo.FN_IsValidURL(LinkedinLink) = 1),

    -- * Checks that the modified at date is valid
    CONSTRAINT CHK_Valid_ProfileModifiedAt CHECK (ModifiedAt >= CreatedAt)
);

PRINT 'Created User Profile table.';

GO

-- * The trigger to automatically update the ModifiedAt in the User Profile table
CREATE TRIGGER users.TR_UserProfile_UpdateModifiedAt
ON users.UserProfile
AFTER UPDATE
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the updated time into the newly updated row
    UPDATE users.UserProfile
    -- ? ModifiedAt automatically gets populated with the current time (in UTC, like CreatedAt)
    SET ModifiedAt = SYSUTCDATETIME()
    FROM users.UserProfile
    INNER JOIN inserted ON (UserProfile.UserId = inserted.UserId);
END;

GO

PRINT 'Created User Profile `ModifiedAt` updating trigger.';
