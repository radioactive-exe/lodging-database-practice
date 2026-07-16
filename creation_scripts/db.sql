-- ? Just to make sure we are executing these steps starting from the master database
USE [master];

-- ? If the Airbnb database already exists, then
IF
    EXISTS (
        SELECT name FROM sys.databases
        WHERE name = N'Airbnb'
    )
    BEGIN
        -- ? Force close all connections and current uses, such as open windows etc.
        ALTER DATABASE Airbnb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

        -- ? Drop it completely
        DROP DATABASE Airbnb;
    END

GO

-- ? And then recreate it from scratch
CREATE DATABASE Airbnb;

GO

/**
*
* TODO:
*  Variable case change
*  Changing the UUID and the internal ID etc
*  Bigint and smallint etc
*  varchar vs nvarchar
*  Making names more specific/clear
*
*/
