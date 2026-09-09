/* =====================================
=            Property table            =
===================================== */

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

GO

/* ======================================
= Property Host tier validation trigger =
====================================== */

CREATE TRIGGER properties.TR_Property_ValidateHostTier
ON properties.Property
AFTER INSERT, UPDATE
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Update the host's tier to the host counterpart one level lower than their
    -- ! current tier, to a minimum of the standard host tier. This is to account for
    -- ! the host-related milestones that the user has yet to achieve, but still does
    -- ! not completely disregard their loyalty to the platform as a customer.
    -- ? This update happens if and only if a row is returned from this query.
    -- ? This assignment is also one line because we are copying the value from one
    -- ? column into another based on the filtering at the end of this query
    -- ? Additionally, populate their HostingSince date
    UPDATE UserAccount
    SET
        UserAccount.UserTier = GREATEST(1, HostTierCounterpart.TierId - 1),
        UserAccount.HostingSince = SYSUTCDATETIME()
    FROM users.UserAccount
    -- ? Join on the (tentative) host user ID
    INNER JOIN inserted ON UserAccount.UserId = inserted.HostId
    -- ? Then, join based on the user tier of the current (tentative) host
    INNER JOIN users.UserTier AS InsertedUserTier ON UserAccount.UserTier = InsertedUserTier.TierId
    -- ? Join again to bring the host tier with the one level lower than the customer tier's
    -- ? level
    INNER JOIN users.UserTier AS HostTierCounterpart ON InsertedUserTier.TierLevel = GREATEST(HostTierCounterpart.TierLevel)
    -- ? To be able to assign the host tier in the top assignment, filter down ONLY
    -- ? to rows:
    -- ? (1) Where the current user is NOT a host
    WHERE InsertedUserTier.IsHostTier = 0
    -- ? (2) And filtering down to the corresponding host tier so that we can
    -- ?     directly assign the user the new tier that is the Host counterpart tier
    -- ?     for their current one
    AND HostTierCounterpart.IsHostTier = 1;

    -- ? If the above query returns no rows, then there is no host from the inserted
    -- ? property(ies) who does not have a host tier, and so the update will never
    -- ? have to happen.

END;

GO

PRINT 'Created Property Host tier validation/conversion trigger.';
