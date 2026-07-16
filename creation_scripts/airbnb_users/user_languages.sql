/**
*
* The creation script for the Languages table
*
*/

DROP TABLE IF EXISTS users.Languages;

CREATE TABLE users.Languages (

    /* Info
    ===================================== */

    -- ? IDENTITY so that this column auto-populates as new languages are added
    LangId   smallint IDENTITY (1, 1) NOT NULL,
    LangName nvarchar(30) NOT NULL UNIQUE,

    /* Constraints
    ===================================== */

    -- * The primary key constraint for the language ID
    CONSTRAINT PK_LangId PRIMARY KEY CLUSTERED (LangId)
);

PRINT 'Created Languages LUT.';

GO

/**
*
* The creation script for the user-to-languages relationship table, implementing the m:n relationship
*
*/

DROP TABLE IF EXISTS users.UserLanguages;

CREATE TABLE users.UserLanguages (

    /* User & Language IDs
    ===================================== */

    UserId bigint NOT NULL,
    LangId smallint NOT NULL,

    /* Constraints
    ===================================== */

    -- * The composite primary key using both IDs
    CONSTRAINT PK_UserLang PRIMARY KEY CLUSTERED (UserId, LangId),

    -- * The foreign key constraints for both IDs
    CONSTRAINT FK_UserLang_User FOREIGN KEY (UserId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_UserLang_Lang FOREIGN KEY (LangId) REFERENCES users.Languages (LangId),

    -- * The Unique constraint that ensures each each user-language combination only occurs once
    CONSTRAINT UQ_User_Lang UNIQUE (UserId, LangId)
);

PRINT 'Created User-Language Relationship table.';
