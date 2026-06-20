IF NOT EXISTS (
    SELECT
        name
    FROM
        sys.databases
    WHERE
        name = N'Airbnb'
) CREATE DATABASE Airbnb
