/**
*
* The creation script for the Property type table
*
*/

DROP TABLE IF EXISTS properties.PropertyType;

CREATE TABLE properties.PropertyType (

    /* Type Info
    ===================================== */

    TypeId          smallint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Apartment", "House", "Duplex"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property type ID
    CONSTRAINT PK_PropertyType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Property Type LUT.';
