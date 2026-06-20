IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'users'
)EXEC ('CREATE SCHEMA users;');

IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'properties'
)EXEC ('CREATE SCHEMA properties;');

IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'reviews'
)EXEC ('CREATE SCHEMA reviews;');

IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'locations'
)EXEC ('CREATE SCHEMA locations;');

IF NOT EXISTS (
    SELECT name
    FROM
        sys.schemas
    WHERE
        name = N'bookings'
)EXEC ('CREATE SCHEMA bookings;');
