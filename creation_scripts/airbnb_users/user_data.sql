DROP TABLE IF EXISTS users.UserAccount;

GO
CREATE TABLE
users.UserAccount (
    Uuid uniqueidentifier NOT NULL PRIMARY KEY,
);

GO
DROP TABLE IF EXISTS users.UserProfile;

GO
CREATE TABLE
users.UserProfile (
    ProfileId int NOT NULL UNIQUE,
    UserId uniqueidentifier NOT NULL UNIQUE,
    FirstName varchar NOT NULL,
    LastName varchar NOT NULL,
    ProfilePictureUrl varchar,
    FacebookLink varchar,
    InstagramLink varchar,
    LinkedinLink varchar,
    ModifiedAt timestamp NOT NULL,
    CONSTRAINT FK_UserId
    FOREIGN KEY (UserId) REFERENCES users.UserAccount (uuid) ON DELETE CASCADE,
    CONSTRAINT PK_ProfileId
    PRIMARY KEY CLUSTERED (ProfileId),
    CONSTRAINT ValidURL_ProfilePictureUrl
    CHECK (dbo.fn_IsValidURL(ProfilePictureUrl) = 1),
    CONSTRAINT ValidURL_FacebookLink
    CHECK (dbo.fn_IsValidURL(FacebookLink) = 1),
    CONSTRAINT ValidURL_InstagramLink
    CHECK (dbo.fn_IsValidURL(InstagramLink) = 1),
    CONSTRAINT ValidURL_LinkedinLink
    CHECK (dbo.fn_IsValidURL(LinkedinLink) = 1),
);
