/**
*
* The creation script for the Property Attribute type table
*
*/

DROP TABLE IF EXISTS properties.AttributeType;

CREATE TABLE properties.AttributeType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Amenity", "Surrounding Area Trait", "Service Trait"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the attribute type ID
    CONSTRAINT PK_AttributeType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Property Attribute Type LUT.';

GO

/**
*
* The creation script for the Property attribute table
*
*/

DROP TABLE IF EXISTS properties.PropertyAttribute;

CREATE TABLE properties.PropertyAttribute (

    /* Attribute Info
    ===================================== */

    AttributeId          smallint IDENTITY (1, 1) NOT NULL,

    -- * The attribute type (amenity, area trait, etc.)
    AttributeTypeId      tinyint NOT NULL,

    -- * I.e. "Free Wifi", "Great View"
    AttributeName        varchar(64) NOT NULL UNIQUE,
    AttributeDescription varchar(256),

    -- ? Whether this attribute depends on users, like being a Guest Favourite vs Free Wifi
    IsUserBased          bit DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property attribute ID
    CONSTRAINT PK_PropertyAttribute PRIMARY KEY CLUSTERED (AttributeId),

    -- * Foreign key constraint for the attribute type
    CONSTRAINT FK_PropertyAttribute_Type FOREIGN KEY (AttributeTypeId) REFERENCES properties.AttributeType (TypeId)
    ON UPDATE CASCADE
);

PRINT 'Created Property Attribute LUT.';

GO

/**
*
* The creation script for the Property-Attribute relationship table
*
*/

DROP TABLE IF EXISTS properties.AssignedPropertyAttributes;

CREATE TABLE properties.AssignedPropertyAttributes (

    /* Property and Attribute
    ===================================== */

    -- * The property being assigned a attribute
    PropertyId  bigint NOT NULL,

    -- * The attribute being assigned to the property
    AttributeId smallint NOT NULL,

    -- ? Whether the attribute is notable for this property and so should be outlined/emphasised,
    -- ? such as being the only property in the area to have Free Parking, etc.
    IsNotable   bit DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property-attribute combination
    CONSTRAINT PK_AssignedPropAttr PRIMARY KEY CLUSTERED (PropertyId, AttributeId),

    -- * Foreign key constraints for both the property and attribute IDs
    CONSTRAINT FK_AssignedPropAttr_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_AssignedPropAttr_Attribute FOREIGN KEY (AttributeId) REFERENCES properties.PropertyAttribute (AttributeId)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

PRINT 'Created Assigned Property-Attribute Relationship table.';
