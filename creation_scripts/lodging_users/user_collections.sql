/* =====================================
=        User Collections table        =
===================================== */

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
    CollectionDesc nvarchar(256),

    -- * Collection Classification
    IsFavourites   bit DEFAULT (0) NOT NULL,
    IsPublic       bit DEFAULT (0) NOT NULL

    /* Constraints
    ===================================== */

    -- * The primary key for this table
    CONSTRAINT PK_CollectionId PRIMARY KEY CLUSTERED (CollectionId),

    -- * The foreign key constraint for the User/Creator ID of the collection
    CONSTRAINT FK_Collection_User FOREIGN KEY (CreatorId)
    REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * The Unique constraint that ensures each user has uniquely-named collections
    CONSTRAINT UQ_User_CollectionName UNIQUE (CreatorId, CollectionName)
);

PRINT 'Created User Collection table.';

CREATE UNIQUE NONCLUSTERED INDEX
UX_UserCollections_CreatorId_SingleFavourites
    ON users.UserCollections (CreatorId)
    WHERE IsFavourites = 1;

PRINT 'Created One-Favourites-Collection-Per-User User Collections Table Validating Index.';

GO

/* ============================================
= User Favourites Collection creation trigger =
============================================ */

-- ? The trigger inserts a favourites collection into the collections table when a
-- ? new user joins

CREATE TRIGGER users.TR_UserCollection_InsertFavouritesOnUserJoin
ON users.UserAccount
AFTER INSERT
AS
BEGIN
-- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    INSERT INTO
    users.UserCollections (
        CreatorId,
        CollectionName,
        CollectionDesc,
        IsFavourites,
        IsPublic
    )
    SELECT
        inserted.UserId,
        'Favourites'                          AS CollectionName,
        'Your default Favourites collection.' AS CollectionDesc,
        1                                     AS IsFavourites,
        1                                     AS IsPublic
    FROM inserted
    ORDER BY inserted.UserId ASC;
END;
