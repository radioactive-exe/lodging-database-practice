/* =====================================
=       Property Category table        =
===================================== */

DROP TABLE IF EXISTS properties.PropertyCategory;

CREATE TABLE properties.PropertyCategory (

    /* Category Info
    ===================================== */

    CategoryId          int IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Beach House", "Mountain Home"
    CategoryName        varchar(64) NOT NULL UNIQUE,
    CategoryDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property category ID
    CONSTRAINT PK_PropertyCategory PRIMARY KEY CLUSTERED (CategoryId)
);

PRINT 'Created Property Category LUT.';

GO

/* =====================================
=   Assigned Property Category table   =
===================================== */

DROP TABLE IF EXISTS properties.AssignedPropertyCategories;

CREATE TABLE properties.AssignedPropertyCategories (

    /* Property and Category
    ===================================== */

    -- * The property being assigned a category
    PropertyId bigint NOT NULL,

    -- * The category being assigned to the property
    CategoryId int NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property-category combination
    CONSTRAINT PK_AssignedPropCat PRIMARY KEY CLUSTERED (PropertyId, CategoryId),

    -- * Foreign key constraints for both the property and category IDs
    CONSTRAINT FK_AssignedPropCat_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_AssignedPropCat_Category FOREIGN KEY (CategoryId) REFERENCES properties.PropertyCategory (CategoryId)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

PRINT 'Created Assigned Property-Category Relationship table.';
