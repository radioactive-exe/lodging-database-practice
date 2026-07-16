/**
*
* The creation script for the User Collections table
*
*/

DROP TABLE IF EXISTS users.UserCollections;

CREATE TABLE users.UserCollections (

    /* Collection and Creator/Owner IDs
    ===================================== */

    CollectionId   bigint IDENTITY (1, 1) NOT NULL,
    CreatorId      bigint NOT NULL,

    /* Collection Info
    ===================================== */

    -- * Basic Collection info
    CollectionName nvarchar(30) NOT NULL,
    CollectionDesc nvarchar(200),

    -- * Collection Classification
    IsFavourites   bit DEFAULT (0) NOT NULL,
    IsPublic       bit DEFAULT (0) NOT NULL

    /* Constraints
    ===================================== */

    -- * The primary key for this table
    CONSTRAINT PK_CollectionId PRIMARY KEY CLUSTERED (CollectionId),

    -- * The foreign key constraint for the User/Creator ID of the collection
    CONSTRAINT FK_Collection_User FOREIGN KEY (CreatorId) REFERENCES users.UserAccount (UserId),

    -- * The Unique constraint that ensures each user has uniquely-named collections
    CONSTRAINT UQ_User_CollectionName UNIQUE (CreatorId, CollectionName)
);

PRINT 'Created User Collection table.';
