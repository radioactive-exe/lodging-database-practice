/**
*
* The creation script for the Billing Addresses table
*
*/

DROP TABLE IF EXISTS users.BillingAddress;

CREATE TABLE users.BillingAddress (

    /* Address Identification
    ===================================== */

    AddressId      bigint IDENTITY (1, 1) NOT NULL,
    AddressName    nvarchar(50) NOT NULL,

    /* Address Location info
    ===================================== */

    -- * For example, street/floor/building
    AddressLine1   nvarchar(100) NOT NULL,
    -- * For example, city/state/area
    AddressLine2   nvarchar(100) NOT NULL,
    ZipCode        nvarchar(20) NOT NULL,
    AddressCountry smallint NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the Billing Address's ID
    CONSTRAINT PK_BillingAddressId PRIMARY KEY CLUSTERED (AddressId),

    -- * Foreign key constraint for the Country ID this Billing Address is in
    CONSTRAINT FK_BillingAddress_Country FOREIGN KEY (AddressCountry) REFERENCES locations.Country (CountryId)
);

PRINT 'Created Billing Address table.';
