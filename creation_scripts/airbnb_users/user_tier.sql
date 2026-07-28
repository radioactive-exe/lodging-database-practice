/**
*
* The creation script for the User Tiers table.
*
*/

DROP TABLE IF EXISTS users.UserTier;

CREATE TABLE
users.UserTier (
    /* Tier Info
    ===================================== */

    -- * The internal Tier ID. The initial plan was 1+ for customer IDs
    -- * and -1 and lower for host IDs, and then using something like 1+ for customer IDs and
    -- * 51+ for host IDs. However, I have decided to make the tier ID simply an internal identity,
    -- * and instead have 2 separate variables storing the tier variant (customer vs host) and tier level
    -- ! This allows for queries checking host tiers, or customer tiers, or tiers above/below a certain level, etc.
    TierId                tinyint IDENTITY (1, 1) NOT NULL,

    -- ? Whether or not this tier is a host tier
    IsHostTier            bit DEFAULT (0) NOT NULL,
    -- ? The tier level, starting at 1 and escalating for importance
    TierLevel             tinyint DEFAULT (1) NOT NULL,

    -- ? Tier info
    TierName              varchar(50) NOT NULL UNIQUE,
    TierDesc              varchar(256) NOT NULL,

    -- ? Tier formal differences and applied modifiers
    TierQueuePriority     int NOT NULL DEFAULT (1),
    -- * 3 total digits with 2 after the decimal place allows values to factor in the ones place,
    -- * such as 1.3, 1.75, and 0.80
    TierFinancialModifier decimal(3, 2) NOT NULL DEFAULT (1.00),

    -- ? The specific criteria for the tier now split up into columns so that the table helps:
    -- ! (1) Comply with normal forms more
    -- ! (2) Get specific tier requirements per category when querying or calculating
    -- ! /!\ This was not in the original plan, but made more sense after further learning and research
    TierReqTimeConstraint tinyint NOT NULL DEFAULT (0),
    TierMinBookings       tinyint NOT NULL DEFAULT (0),
    TierMinRating         decimal(2, 1) NOT NULL DEFAULT (0.0),

    -- ? This is the tier's eligibility criteria in natural language
    TierCriteriaUI        varchar(300) NOT NULL,

    /* Constraints
    ===================================== */

    -- * The primary key constraint for the tier ID
    CONSTRAINT PK_TierId PRIMARY KEY CLUSTERED (TierId),

    -- ? Ensuring the ID is -1 or greater (-1 and 0 may be used for technical/admin tiers, for example)
    CONSTRAINT CHK_TierId_Range CHECK (TierId >= -1),

    -- ? Ensuring the necessary columns are non-negative
    CONSTRAINT CHK_NonNegative_UserTierQueuePriority CHECK (TierQueuePriority >= 0),
    CONSTRAINT CHK_NonNegative_UserTierMinBookings CHECK (TierMinBookings >= 0),
    CONSTRAINT CHK_NonNegative_UserTierReqTimeConstraint CHECK (TierReqTimeConstraint >= 0),

    -- ? Ensuring the minimum rating is in the correct range
    CONSTRAINT CHK_Valid_UserTierMinRating CHECK (TierMinRating >= 0 AND TierMinRating <= 5),

    -- ? Ensuring there is only one tier of each level for each user type
    CONSTRAINT UQ_UserTier_PerType UNIQUE (IsHostTier, TierLevel)
);

PRINT 'Created the User Tier LUT.';
