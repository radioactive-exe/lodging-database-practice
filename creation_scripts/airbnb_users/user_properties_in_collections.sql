/**
*
* The creation script for the User Collection Properties table
*
*/

DROP TABLE IF EXISTS users.PropertiesInCollections;

CREATE TABLE users.PropertiesInCollections (

    /* Collection and Property IDs
    ===================================== */

    CollectionId bigint NOT NULL,
    PropertyId   bigint DEFAULT (0) NOT NULL,

    /* Added Info
    ===================================== */

    AddedBy      bigint DEFAULT (0) NOT NULL,
    AddedOn      datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the three main columns (Collection, User, and Property IDs)
    CONSTRAINT PK_PropertiesInUserCollections PRIMARY KEY CLUSTERED (CollectionId, AddedBy, PropertyId),

    -- * Foreign key constraints for the three main columns
    CONSTRAINT FK_PropertyInCollection_Collection FOREIGN KEY (CollectionId) REFERENCES users.UserCollections (CollectionId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_PropertyInCollection_User FOREIGN KEY (AddedBy) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_PropertyInCollection_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON DELETE CASCADE
);

PRINT 'Created Assigned Property-Collection Relationship table.';
