/**
*
* The creation script for the User Tiers table.
*
*/
DROP TABLE IF EXISTS users.UserTier;

CREATE TABLE
users.UserTier (
    -- * The internal Tier ID. Host IDs can have an established prefix in order to 
    -- * account for both customer and host IDs. The initial plan was 1+ for customer IDs
    -- * and -1 and lower for host IDs, but instead using something like 1+ for customer IDs and
    -- * 101+ for host IDs might be more in line with avoiding unexpected IDs and behaviours
    TierId int NOT NULL,
    TierName varchar(50) NOT NULL UNIQUE,
    TierDesc varchar(150) NOT NULL,
    TierQueuePriority int NOT NULL DEFAULT (0),
    -- * 3 total digits with 2 after the decimal place allows values to factor in the ones place,
    -- * such as 1.3, 1.75, and 0.80
    TierFinancialModifier decimal(3, 2) NOT NULL DEFAULT (1.00),
    -- ? This is the tier's eligibility criteria in natural language
    TierCriteria varchar(300) NOT NULL,
    -- * The primary key constraint for the tier ID
    CONSTRAINT PK_TierId PRIMARY KEY CLUSTERED (TierId),
    -- ? Ensuring the ID is -1 or greater (-1 and 0 may be used for technical/admin tiers, for example)
    CONSTRAINT Chk_TierId_Range CHECK (TierId >= -1),
    -- ? Ensuring the queue priority is non-negative
    CONSTRAINT Chk_QueuePriority_Range CHECK (TierQueuePriority >= 0)
);
