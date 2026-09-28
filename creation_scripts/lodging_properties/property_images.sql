/* =====================================
=        Property Images table         =
===================================== */

DROP TABLE IF EXISTS properties.PropertyImages;

CREATE TABLE properties.PropertyImages (

    /* Image info
    ===================================== */

    ImageId    bigint IDENTITY (1, 1) NOT NULL,

    -- * The property this image is of/associated with
    PropertyId bigint NOT NULL,

    -- * The actual URL of the image
    ImageUrl   varchar(1500) NOT NULL,

    -- * The index/order of this image in the gallery/carousel of property images for
    -- * its property
    ImageIndex tinyint DEFAULT (0),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the image id
    CONSTRAINT PK_PropertyImage PRIMARY KEY CLUSTERED (ImageId),

    -- * Foreign key constraint for the property ID
    CONSTRAINT FK_PropertyImage_Property FOREIGN KEY (PropertyId)
    REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * A unique constraint on the property, url, and index columns
    -- ? This was not in the original plan, but this is now added to ensure no
    -- ? duplicate image URL gets uploaded in the same position/index for the same
    -- ? property
    CONSTRAINT UQ_Property_Image_Index UNIQUE (PropertyId, ImageUrl, ImageIndex)
);

PRINT 'Created Property Images table.';
