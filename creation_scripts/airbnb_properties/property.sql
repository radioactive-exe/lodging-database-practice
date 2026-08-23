/**
*
* The creation script for the Property table
*
*/

DROP TABLE IF EXISTS properties.Property;

CREATE TABLE properties.Property (

    /* Property Identification
    ===================================== */

    PropertyId          bigint IDENTITY (1, 1) NOT NULL,
    -- * The type of property, from a LUT
    PropertyTypeId      smallint NOT NULL,
    -- * The user hosting this property
    HostId              bigint NOT NULL,

    /* Property Information
    ===================================== */

    PropertyName        varchar(64) NOT NULL UNIQUE,
    PropertyDescription varchar(256),

    -- * The number of sectors/places this property is divided into
    -- * 1 sector means the whole property can be rented out to 1 party only
    -- * 3 sectors, for example, can mean first floor, ground floor, and guest house,
    -- * which can be rented separately
    NumOfSectors        tinyint DEFAULT (1) NOT NULL,

    -- * The nightly cost to rent this property
    PerNightCost        decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * The nightly fees for this property
    CleaningFeePerNight decimal(14, 2) DEFAULT (0) NOT NULL,
    ServiceFeePerNight  decimal(14, 2) DEFAULT (0) NOT NULL,

    /* Property Location
    ===================================== */

    -- ? Initially planned to be 2 separate fields for Latitude and Longitude,
    -- ? SQL Server 2025's built-in Geography data type was more efficient
    Coordinates         geography,

    -- * The location ID this property is in
    LocationId          int NOT NULL,

    -- * Address lines used to identify it in a user-friendly way
    AddressLine1        varchar(128) NOT NULL,
    AddressLine2        varchar(128) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property ID
    CONSTRAINT PK_PropertyId PRIMARY KEY CLUSTERED (PropertyId),

    -- * Foreign key constraints for the property location, type, and host
    CONSTRAINT FK_Property_Location FOREIGN KEY (LocationId) REFERENCES locations.Location (LocationId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_Property_Type FOREIGN KEY (PropertyTypeId) REFERENCES properties.PropertyType (TypeId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_Property_Host FOREIGN KEY (HostId) REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE,

    -- * Nonnegative constraints on fees and prices
    CONSTRAINT CHK_NonNegative_Property_BasePriceNight CHECK (PerNightCost >= 0),
    CONSTRAINT CHK_NonNegative_Property_CleaningFeeNight CHECK (CleaningFeePerNight >= 0),
    CONSTRAINT CHK_NonNegative_Property_ServiceFeeNight CHECK (ServiceFeePerNight >= 0),
);

PRINT 'Created Property table.';
