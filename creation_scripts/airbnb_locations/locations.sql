/**
*
* The creation scripts for all 4 location info tables (location, area, country, and region)
*
*/

-- * Drop them in reverse order of their FK relationships, if needed
-- * This technically never matters if you are running the PS script, but ordered nonetheless
DROP TABLE IF EXISTS locations.Location;
DROP TABLE IF EXISTS locations.Area;
DROP TABLE IF EXISTS locations.Country;
DROP TABLE IF EXISTS locations.Region;

/**
*
* The Region table
*
*/

CREATE TABLE locations.Region (

    /* Region Info
    ===================================== */

    RegionId   smallint IDENTITY (1, 1) NOT NULL,
    RegionName nvarchar(128) NOT NULL UNIQUE,
    RegionDesc nvarchar(512),

    /* Constraints
    ===================================== */

    -- * The primary key constraint for the RegionId column
    CONSTRAINT PK_RegionId PRIMARY KEY CLUSTERED (RegionId),
);

PRINT 'Created Region table.';

/**
*
* The Country table, one step more specific from the Region table
*
*/

CREATE TABLE locations.Country (

    /* Country Info
    ===================================== */

    CountryId   smallint IDENTITY (1, 1) NOT NULL,
    CountryName varchar(128) NOT NULL UNIQUE,

    -- * The Region this country is classified in
    RegionId    smallint NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the CountryId column
    CONSTRAINT PK_CountryId PRIMARY KEY CLUSTERED (CountryId),

    -- * Foreign key constraint for the Region ID this country belongs to
    CONSTRAINT FK_Country_Region FOREIGN KEY (RegionId) REFERENCES locations.Region (RegionId)
);

PRINT 'Created Country table.';

/**
*
* The area table, narrowed within countries
*
*/

CREATE TABLE locations.Area (

    /* Area Info
    ===================================== */

    AreaId    int IDENTITY (1, 1) NOT NULL,

    -- * The country this area is in
    CountryId smallint NOT NULL,

    -- * Area name and description
    AreaName  varchar(128) NOT NULL UNIQUE,
    AreaDesc  varchar(512),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the AreaId column
    CONSTRAINT PK_AreaId PRIMARY KEY CLUSTERED (AreaId),

    -- * Foreign key constraint for the Country ID this area belongs to
    CONSTRAINT FK_Area_Country FOREIGN KEY (CountryId) REFERENCES locations.Country (CountryId)
);

PRINT 'Created Area table.';

/**
*
* The location table, for specific streets, blocks, or more within the areas
*
*/

CREATE TABLE locations.Location (

    /* Location Info
    ===================================== */

    LocationId   int IDENTITY (1, 1) NOT NULL,

    -- * The area this location is in
    AreaId       int NOT NULL,

    -- * The location name and description
    LocationName varchar(128) NOT NULL UNIQUE,
    LocationDesc varchar(512),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the LocationId column
    CONSTRAINT PK_LocationId PRIMARY KEY CLUSTERED (LocationId),

    -- * Foreign key constraint for the Area ID this location belongs to
    CONSTRAINT FK_Location_Area FOREIGN KEY (AreaId) REFERENCES locations.Area (AreaId)
);

PRINT 'Created Location table.';
