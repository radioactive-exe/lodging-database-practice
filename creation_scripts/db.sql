-- ? Just to make sure we are executing these steps starting from the master database
USE [master];

-- ? If the Lodging database already exists, then
IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = N'Lodging'
    )
    BEGIN
        -- ? Force close all connections and current uses, such as open windows etc.
        ALTER DATABASE Lodging SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

        -- ? Drop it completely
        DROP DATABASE Lodging;
    END

PRINT 'Dropped Lodging database (if it existed).';

GO

-- ? And then recreate it from scratch
CREATE DATABASE Lodging;

PRINT 'Created Lodging database.';
