DROP TABLE IF EXISTS users.UserProfile;

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
    CreatedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
    ModifiedAt datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT PK_ProfileId PRIMARY KEY CLUSTERED (ProfileId),
    CONSTRAINT FK_UserId FOREIGN KEY (UserId) REFERENCES users.UserAccount (Uuid) ON DELETE CASCADE,
    CONSTRAINT Chk_ValidURL_ProfilePictureUrl CHECK (dbo.fn_IsValidURL(ProfilePictureUrl) = 1),
    CONSTRAINT Chk_ValidURL_FacebookLink CHECK (dbo.fn_IsValidURL(FacebookLink) = 1),
    CONSTRAINT Chk_ValidURL_InstagramLink CHECK (dbo.fn_IsValidURL(InstagramLink) = 1),
    CONSTRAINT Chk_ValidURL_LinkedinLink CHECK (dbo.fn_IsValidURL(LinkedinLink) = 1),
    CONSTRAINT Chk_ModifiedDate_Validity CHECK (ModifiedAt >= CreatedAt)
);
