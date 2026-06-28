USE [master];
GO

IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = N'Airbnb'
    )
    BEGIN
        ALTER DATABASE Airbnb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

        DROP DATABASE Airbnb;
    END
GO

CREATE DATABASE Airbnb;
GO
