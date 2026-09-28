-- ? Switch to the Lodging database if not already switched
USE [Lodging];

/* =====================================
=         Creating the schemas         =
===================================== */

-- * The User data schema with accounts, profiles, collections, and more
IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'users'
)EXEC ('CREATE SCHEMA users;');

PRINT 'Created User Data Schema.';

-- * The Property data schema with properties, attributes, amenities, and more
IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'properties'
)EXEC ('CREATE SCHEMA properties;');

PRINT 'Created Property Data Schema.';

-- * The Reviews schema with ratings and both user and property reviews
IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'reviews'
)EXEC ('CREATE SCHEMA reviews;');

PRINT 'Created Reviews Schema';

-- * The Locations data schema, with locations, countries, regions, and more
IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'locations'
)EXEC ('CREATE SCHEMA locations;');

PRINT 'Created Location Data Schema.';

-- * The Reservations schema, with invoices, payments, and property bookings
IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'reservations'
)EXEC ('CREATE SCHEMA reservations;');

PRINT 'Created Reservations Schema.';
