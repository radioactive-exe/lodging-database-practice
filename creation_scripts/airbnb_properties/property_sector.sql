/**
*
* The creation script for the Sector type table
*
*/

DROP TABLE IF EXISTS properties.SectorType;

CREATE TABLE properties.SectorType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Room", "Guest House", "Floor"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the sector type ID
    CONSTRAINT PK_SectorType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Sector Type LUT.';

GO

/**
*
* The creation script for the Property Sectors relationship table
*
*/

DROP TABLE IF EXISTS properties.PropertySectors;

CREATE TABLE properties.PropertySectors (

    /* Sector Identification
    ===================================== */

    SectorId          bigint IDENTITY (1, 1) NOT NULL,
    -- * The type of sector, from a LUT
    SectorTypeId      tinyint NOT NULL,
    -- * The property this sector belongs to
    PropertyId        bigint NOT NULL,

    /* Sector Information
    ===================================== */

    SectorName        varchar(64) NOT NULL,
    SectorDescription varchar(256),

    /* Sector Specifications
    ===================================== */

    -- * Minimum and maximum occupants per booking
    -- ! A min/max occupants count of 0 means that there is no lower/upper limit
    MinOccupants      tinyint DEFAULT (0) NOT NULL,
    MaxOccupants      tinyint DEFAULT (0) NOT NULL,

    -- * The number of beds, bedrooms, and bathrooms
    NumOfBeds         tinyint DEFAULT (0) NOT NULL,
    NumOfBedrooms     tinyint DEFAULT (0) NOT NULL,
    NumOfBathrooms    tinyint DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the sector ID
    CONSTRAINT PK_SectorId PRIMARY KEY CLUSTERED (SectorId),

    -- * Foreign key constraints for the sector type and containing property
    CONSTRAINT FK_PropertySector_Type FOREIGN KEY (SectorTypeId) REFERENCES properties.SectorType (TypeId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_PropertySector_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- ? Ensuring that no sectors in the same property have the same name
    CONSTRAINT UQ_PropertySector_Name UNIQUE (PropertyId, SectorName),

    -- ? Checking that all spec quantities are non-negative
    CONSTRAINT CHK_NonNegative_MinSectorOccupants CHECK (MinOccupants >= 0),
    CONSTRAINT CHK_NonNegative_MaxSectorOccupants CHECK (MaxOccupants >= 0),
    CONSTRAINT CHK_NonNegative_NumOfBeds CHECK (NumOfBeds >= 0),
    CONSTRAINT CHK_NonNegative_NumOfBedrooms CHECK (NumOfBedrooms >= 0),
    CONSTRAINT CHK_NonNegative_NumOfBathrooms CHECK (NumOfBathrooms >= 0),

    -- ? Checking that the maximum number of occupants is either
    -- ? (1) Greater than or equal to the minimum number of occupants (valid case)
    -- ? (2) Zero, meaning there is no maximum number of occupants (unusual but possible)
    CONSTRAINT CHK_Valid_MaxSectorOccupants CHECK (
        MaxOccupants >= MinOccupants
        OR MaxOccupants = 0
    )
);

PRINT 'Created Property-Sector Relationship table.';
