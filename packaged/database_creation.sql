/* =====================================
=              VALIDATORS              =
===================================== */

/* =====================================
=       URL Validation function        =
===================================== */

-- ? This function checks an input string according to regular expressions to verify its
-- ? validity as a URL.

CREATE
OR ALTER
FUNCTION dbo.FN_IsValidURL(@InputText nvarchar(4000)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN
    -- ? If the input text is null, then it's technically a valid URL.
    -- ? This takes into account when social accounts are not linked for users, for example,
    -- ? thus being able to be used as the only constraint for that column, not requiring an
    -- ? additional `CHECK( x IS NULL OR IsValidUrl(x) = 1)` for each column
    IF @InputText IS NULL
        RETURN 1;

    -- * The input trimmed from whitespace (copying URLs can sometimes end up with trailing or leading spaces)
    DECLARE @TrimmedInput nvarchar(4000) = TRIM(@InputText);

    -- ? If the input is too long. A limit of 1500 was originally set by Internet Explorer (RIP), but we
    -- ? use it as a baseline, but we have to drop under 1700 to account for the constraints containing
    -- ? URLs
    IF LEN(@TrimmedInput) > 1500
        RETURN 0;

    -- * The regular expression that validates urls with either an `http` or an `https` protocol at the beginning
    DECLARE @URLWithProtocol nvarchar(256) = N'^https?://(www\.)?[a-zA-Z0-9][-a-zA-Z0-9.]*\.[a-zA-Z]{2,6}(/[-a-zA-Z0-9()@:%_+.~#?&/=]*)?$';

    -- * The regular expression that validates urls without any protocol at the beginning (such as `google.com`)
    DECLARE @URLWithoutProtocol nvarchar(256) = N'^[a-zA-Z0-9][-a-zA-Z0-9.]*\.[a-zA-Z]{2,6}(/[-a-zA-Z0-9()@:%_+.~#?&/=]*)?$';

    RETURN CASE
        -- ? If either regex successfully matches against the trimmed input, then it is a valid URL
        WHEN
            REGEXP_LIKE(@TrimmedInput, @URLWithProtocol)
            OR REGEXP_LIKE(@TrimmedInput, @URLWithoutProtocol) THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created URL REGEX validation function.';

GO

/* =====================================
=   Phone Number validation function   =
===================================== */

-- ? This function checks an input string to verify its validity as an international
-- ? Phone Number. This includes both numbers with and without country codes (+).

CREATE
OR ALTER
FUNCTION dbo.FN_IsValidPhoneNumber(@InputText nvarchar(50)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Since the phone number must be submitted when signing up, being NULL is NOT valid here

    DECLARE @TrimmedInput nvarchar(50) = TRIM(@InputText);

    -- ? Since there is no definite short-circuiting in SQL, check and immediately return if it's too long
    -- ? The longest phone numbers are 15 (and very rarely 17) numbers long, so this should account
    -- ? for the country code 00/+, parentheses, and/or dashes
    IF LEN(@TrimmedInput) > 22
        RETURN 0;

    -- * The regexp that outlines the format of phone numbers, with or without:
    -- * 1. Country codes
    -- * 2. Single spaces
    -- * 3. Dashes
    -- * 4. Parentheses
    DECLARE @InternationalPhoneNumber nvarchar(200) = N'^(?:\+|00)[1-9]\d{0,2}[-.\s]?(?:\(\d{3}\)|\d{3})[-.\s]?(\d[-.\s]?){6,9}\d$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression, then it's a valid phone number
            REGEXP_LIKE(@TrimmedInput, @InternationalPhoneNumber) THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created phone number REGEX validation function.';

GO

/* =====================================
=      Email Validation function       =
===================================== */

-- ? This function checks an input string to verify its validity as an email address.

CREATE
OR ALTER
FUNCTION dbo.FN_IsValidEmail(@InputText nvarchar(512)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Since the email must be submitted when signing up, being NULL is NOT valid here

    DECLARE @TrimmedInput nvarchar(512) = TRIM(@InputText);

    -- ? Conventions and RFC 3696 often cap emails between 254 and 320 characters, so we will go with the safe`
    -- ? limit of bounding the length under 250
    IF (LEN(@TrimmedInput) > 250)
        RETURN 0;

    -- * The regexp that outlines the format of an email address
    DECLARE @Email nvarchar(200) = N'^[A-Za-z0-9_%+-]+(?:\.[A-Za-z0-9_%+-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression, then it's a valid email address
            REGEXP_LIKE(@TrimmedInput, @Email) THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created email address REGEX validation function.';

GO

/* =====================================
=       Name Validation function       =
===================================== */

-- ? This function checks an input string to verify its validity as a name, either for
-- ? the first/last names or the billing names.

CREATE
OR ALTER
FUNCTION dbo.FN_IsValidName(@InputText nvarchar(100)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Since the name is, well, a name, being NULL is NOT valid here

    DECLARE @TrimmedInput nvarchar(100) = TRIM(@InputText);

    -- ? If the name is too short - we consolidate the checks here as well
    IF (LEN(@TrimmedInput) < 2)
        RETURN 0;

    -- * The regexp that outlines the allowed format/characters in a name/identifier,
    -- * which allows letters, spaces, apostrophes, hyphens, and underscores (in the case of a
    -- * business name or other identifier for online wallets, etc.)
    DECLARE @Name nvarchar(30) = N'^[A-Za-z ''_-]+$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression
            REGEXP_LIKE(@TrimmedInput, @Name)
            -- ? And there are no consecutive spaces
            AND NOT REGEXP_LIKE(@TrimmedInput, '  ')
            -- ? Then we are good
            THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created name REGEX validation function.';

GO

/* =====================================
=     Username Validation function     =
===================================== */

-- ? This function checks an input string to verify its validity as a username, slightly
-- ? different than regular names/identifiers above

CREATE
OR ALTER
FUNCTION dbo.FN_IsValidUsername(@InputText nvarchar(100)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Usernames being null are not valid

    DECLARE @TrimmedInput nvarchar(100) = TRIM(@InputText);

    -- ? If the name is too short/long - we consolidate the checks here as well
    IF (LEN(@TrimmedInput) < 2 OR LEN(@TrimmedInput) > 30)
        RETURN 0;

    -- * The regexp that outlines the allowed format/characters in a technical username,
    -- * which allows letters, numbers, hyphens, and underscores, and starting with an @
    DECLARE @Username nvarchar(30) = N'^@[A-Za-z0-9_-]{1,29}$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression
            REGEXP_LIKE(@TrimmedInput, @Username)
            -- ? Then we are good
            THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created username REGEX validation function.';

GO

/* =====================================
=    Card Number Validation function   =
===================================== */

-- ? This function checks an input string to verify its legitimacy as a credit card
-- ? number It uses both length/regex validations and the Luhn Algorithm
-- ? (https://www.geeksforgeeks.org/dsa/luhn-algorithm/)

CREATE
OR ALTER
FUNCTION dbo.FN_IsValidCardNumber(@InputText varchar(30)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN
    -- * Clears any spaces or hyphens from the inputted sequence (we are still not sure if they are only numeric)
    -- * but these two characters are okay
    DECLARE @TrimmedCardNumber varchar(30) = REPLACE(REPLACE(@InputText, ' ', ''), '-', '');

    -- * Other immediate fail conditions, so we don't have to do the complex Luhn algorithm. return false immediately if:
    IF
        -- ? (1) The input is null, which in this case should not be allowed,
        -- ? as this would be when entering necessary card details
        @TrimmedCardNumber IS NULL
        -- ? (2) There is any non-digit character in the sequence
        OR @TrimmedCardNumber LIKE '%[^0-9]%'
        -- ? (3) The card number is not between 12-19
        -- *    Note: While Visa and MC are 15/16, different providers internationally can span between 12 and 19
        OR LEN(@TrimmedCardNumber) NOT BETWEEN 12 AND 19
        RETURN 0;

    -- ~ Now, we need to set up SQL loop.
    -- ! While in real life this would be handled much easier with a dedicated server written in .NET, Express,
    -- ! or any other language, or even handled in the frontend, both of those sections are beyond the scope of this
    -- ! project, so I am doing as much as I can in SQL.
    -- *                                                     ↓ Here, we start at the last index instead
    DECLARE @Sum int = 0, @Digit int, @ShouldDouble bit = 0, @Index int = LEN(@TrimmedCardNumber);

    -- * Loop
    WHILE @Index > 0
        BEGIN
            -- ? First, extract and cast the digit to an integer so we can perform math on it
            SET @Digit = CAST(SUBSTRING(@TrimmedCardNumber, @Index, 1) AS int);

            -- ? If we are on one of the digits we should double (every second digit from the right)
            IF @ShouldDouble = 1
                BEGIN
                    -- ? Double the digit
                    SET @Digit *= 2;

                    -- ? If the doubled result is greater than 9, remove 9
                    IF @Digit > 9
                        SET @Digit -= 9;
                END;

            -- ? Add the digit (either doubled and fixed to under 9 or still single)
            SET @Sum += @Digit;

            -- ? Flip the doubling flag and decrement the index
            SET @ShouldDouble = ~@ShouldDouble;
            SET @Index -= 1;
        END;

    RETURN CASE
        WHEN
            -- ? If the sum ends in 0 (aka is divisible by 10), then it was a valid number
            @Sum % 10 = 0 THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created identification number validation function.';

GO

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

GO

/* =====================================
=      The Location schema tables      =
===================================== */

-- * Drop them in reverse order of their FK relationships, if needed
-- * This technically never matters if you are running the PS script, but ordered nonetheless
DROP TABLE IF EXISTS locations.Location;
DROP TABLE IF EXISTS locations.Area;
DROP TABLE IF EXISTS locations.Country;
DROP TABLE IF EXISTS locations.Region;

/* =====================================
=           The Region table           =
===================================== */

CREATE TABLE locations.Region (

    /* Region Info
    ===================================== */

    RegionId   smallint IDENTITY (1, 1) NOT NULL,
    RegionName nvarchar(128) NOT NULL UNIQUE,
    RegionDesc nvarchar(512),

    /* Constraints
    ===================================== */

    -- * The primary key constraint for the RegionId column
    CONSTRAINT PK_RegionId PRIMARY KEY CLUSTERED (RegionId),
);

PRINT 'Created Region table.';

/* =====================================
=          The Country table           =
===================================== */

CREATE TABLE locations.Country (

    /* Country Info
    ===================================== */

    CountryId   smallint IDENTITY (1, 1) NOT NULL,
    CountryName varchar(128) NOT NULL UNIQUE,

    -- * The Region this country is classified in
    RegionId    smallint NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the CountryId column
    CONSTRAINT PK_CountryId PRIMARY KEY CLUSTERED (CountryId),

    -- * Foreign key constraint for the Region ID this country belongs to
    CONSTRAINT FK_Country_Region FOREIGN KEY (RegionId) REFERENCES locations.Region (RegionId)
    ON UPDATE CASCADE
);

PRINT 'Created Country table.';

/* =====================================
=            The Area table            =
===================================== */

CREATE TABLE locations.Area (

    /* Area Info
    ===================================== */

    AreaId    int IDENTITY (1, 1) NOT NULL,

    -- * The country this area is in
    CountryId smallint NOT NULL,

    -- * Area name and description
    AreaName  varchar(128) NOT NULL UNIQUE,
    AreaDesc  varchar(512),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the AreaId column
    CONSTRAINT PK_AreaId PRIMARY KEY CLUSTERED (AreaId),

    -- * Foreign key constraint for the Country ID this area belongs to
    CONSTRAINT FK_Area_Country FOREIGN KEY (CountryId) REFERENCES locations.Country (CountryId)
    ON UPDATE CASCADE
);

PRINT 'Created Area table.';

/* =====================================
=     The granular Location table      =
===================================== */

CREATE TABLE locations.Location (

    /* Location Info
    ===================================== */

    LocationId   int IDENTITY (1, 1) NOT NULL,

    -- * The area this location is in
    AreaId       int NOT NULL,

    -- * The location name and description
    LocationName varchar(128) NOT NULL UNIQUE,
    LocationDesc varchar(512),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the LocationId column
    CONSTRAINT PK_LocationId PRIMARY KEY CLUSTERED (LocationId),

    -- * Foreign key constraint for the Area ID this location belongs to
    CONSTRAINT FK_Location_Area FOREIGN KEY (AreaId) REFERENCES locations.Area (AreaId)
    ON UPDATE CASCADE
);

PRINT 'Created Location table.';

GO

/* =====================================
=       Payment Method Type table      =
===================================== */

DROP TABLE IF EXISTS reservations.PaymentMethodType;

CREATE TABLE reservations.PaymentMethodType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Credit Card", "Paypal", "Online Wallet"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the payment method type ID
    CONSTRAINT PK_PaymentMethodTypeId PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Payment Method Type LUT.';

GO

/* =====================================
=            User Tier LUT             =
===================================== */

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

GO

/* =====================================
=          User Account Table          =
===================================== */

DROP TABLE IF EXISTS users.UserAccount;

CREATE TABLE
users.UserAccount (

    /* Credentials and IDs
    ===================================== */

    -- * The optimised integer internal ID to be used throughout the database
    -- * Instead of being a UUID, which I discovered is very non-optimised for JOINs
    -- * and other database FK uses. The UUID is now stored in the public user profile table.
    -- * Being an Identity item, it starts at 1 and auto increments
    UserId         bigint IDENTITY (1, 1) NOT NULL UNIQUE,
    UserTier       tinyint NOT NULL,
    Email          varchar(50) NOT NULL UNIQUE,
    -- ? Password is a keyword in SQL Server, and so
    -- ? an alternative name was used, also indicating the fact that the
    -- ? stored password is hashed and not raw.
    -- * The hashing is supposed to be handled by the application layer, so out of this project scope
    -- * Also, the strength requirements are enforced by the frontend
    HashedPassword varchar(255) NOT NULL,
    PhoneNumber    varchar(30) NOT NULL,

    /* Dates and Tracking
    ===================================== */
    -- * The user's country of residence

    -- ! This was originally not in the plan, but as I was writing the test case
    -- ! regarding checking cross-country bookings, I realised that there is no way
    -- ! to reliably determine a user's country of origin/residence given the current
    -- ! implementation. You have to join across the billing address table and then the
    -- ! payment methods table to get the country of the user, inflating joins and also
    -- ! being problematic with the fact that users can have multiple billing addresses
    -- ! and payment methods, without a single "primary" one to derive a user's
    -- ! potential address from.
    UserCountry    smallint NOT NULL,
    -- * Can be null, as the user may have never hosted
    HostingSince   date,
    -- * Creation and Updating dates are automatically populated
    -- * on row creation, ensuring they are not null
    CreatedAt      datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,
    ModifiedAt     datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,

    /* Constraints
    ===================================== */

    -- * The Primary Key Constraint for the user account
    CONSTRAINT PK_UserId PRIMARY KEY CLUSTERED (UserId),

    -- * The Foreign Key Constraint for the user tier id and user Country
    CONSTRAINT FK_UserAccount_UserTier FOREIGN KEY (UserTier) REFERENCES users.UserTier (TierId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_UserAccount_Country FOREIGN KEY (UserCountry) REFERENCES locations.Country (CountryId),

    -- ? Checks that the phone number is a valid international number
    CONSTRAINT CHK_Valid_PhoneNumber CHECK (dbo.FN_IsValidPhoneNumber(PhoneNumber) = 1),
    -- ? Checks that the email is valid
    CONSTRAINT CHK_Valid_Email CHECK (dbo.FN_IsValidEmail(Email) = 1),
    -- ? Checks that the modified date is after/at the created date
    CONSTRAINT CHK_Valid_AccountModifiedAt CHECK (ModifiedAt >= CreatedAt)
);

PRINT 'Created User Account table.';

GO

-- * The trigger to automatically update the ModifiedAt in the User Account table
CREATE TRIGGER users.TR_UserAccount_UpdateModifiedAt
ON users.UserAccount
AFTER UPDATE
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the updated time into the newly updated row
    UPDATE users.UserAccount
    -- ? ModifiedAt automatically gets populated with the current time (in UTC, like CreatedAt)
    SET ModifiedAt = SYSUTCDATETIME()
    FROM users.UserAccount
    INNER JOIN inserted ON (UserAccount.UserId = inserted.UserId);
END;

GO

PRINT 'Created User Account `ModifiedAt` updating trigger.';

GO

/* =====================================
=          User Profile table          =
===================================== */

DROP TABLE IF EXISTS users.UserProfile;

CREATE TABLE
users.UserProfile (
    /* User ID and public UUID
    ===================================== */

    -- * The internal user ID will be used as the foreign and primary key for this table as well,
    -- * which should hopefully result in easier searching and a redundant ensuring of a strict 1-to-1 relationship
    UserId            bigint NOT NULL UNIQUE,
    -- * Automatically-populated UUID, which will be used in profile URLs and other public-facing contexts
    -- ! This was used in place of the original UUID and profile ID setup after more understanding of privacy and UUIDs
    -- ! Also, instead of using Airbnb's numeric IDs for profile URLs etc., using a UUID is easier to generate
    PublicUserUuid    uniqueidentifier DEFAULT NEWID() NOT NULL UNIQUE,

    /* Basic Info
    ===================================== */

    FirstName         nvarchar(100) NOT NULL,
    LastName          nvarchar(100) NOT NULL,
    ProfilePictureUrl varchar(1500),

    /* Linked Accounts
    ===================================== */

    FacebookLink      varchar(1500),
    InstagramLink     varchar(1500),
    LinkedinLink      varchar(1500),

    /* Times and tracking
    ===================================== */

    -- * Creation and Updating dates are automatically populated
    -- * on row creation, ensuring they are not null
    CreatedAt         datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,
    ModifiedAt        datetime2 DEFAULT SYSUTCDATETIME() NOT NULL,

    /* Constraints
    ===================================== */

    -- * The internal User ID is both the primary and a foreign key
    CONSTRAINT PK_Profile_User PRIMARY KEY CLUSTERED (UserId),
    CONSTRAINT FK_Profile_User FOREIGN KEY (UserId) REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * Constraints to validate the URLs for the (1) profile pic. and (2) linked social media accounts
    -- * (1)
    CONSTRAINT CHK_ValidURL_ProfilePictureUrl CHECK (dbo.FN_IsValidURL(ProfilePictureUrl) = 1),
    -- * (2)
    CONSTRAINT CHK_ValidURL_FacebookLink CHECK (dbo.FN_IsValidURL(FacebookLink) = 1),
    CONSTRAINT CHK_ValidURL_InstagramLink CHECK (dbo.FN_IsValidURL(InstagramLink) = 1),
    CONSTRAINT CHK_ValidURL_LinkedinLink CHECK (dbo.FN_IsValidURL(LinkedinLink) = 1),

    -- * Checks that the modified at date is valid
    CONSTRAINT CHK_Valid_ProfileModifiedAt CHECK (ModifiedAt >= CreatedAt)
);

PRINT 'Created User Profile table.';

GO

-- * The trigger to automatically update the ModifiedAt in the User Profile table
CREATE TRIGGER users.TR_UserProfile_UpdateModifiedAt
ON users.UserProfile
AFTER UPDATE
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the updated time into the newly updated row
    UPDATE users.UserProfile
    -- ? ModifiedAt automatically gets populated with the current time (in UTC, like CreatedAt)
    SET ModifiedAt = SYSUTCDATETIME()
    FROM users.UserProfile
    INNER JOIN inserted ON (UserProfile.UserId = inserted.UserId);
END;

GO

PRINT 'Created User Profile `ModifiedAt` updating trigger.';

GO

/* =====================================
=            Languages LUT             =
===================================== */

DROP TABLE IF EXISTS users.Languages;

CREATE TABLE users.Languages (

    /* Info
    ===================================== */

    -- ? IDENTITY so that this column auto-populates as new languages are added
    LangId   smallint IDENTITY (1, 1) NOT NULL,
    LangName nvarchar(30) NOT NULL UNIQUE,

    /* Constraints
    ===================================== */

    -- * The primary key constraint for the language ID
    CONSTRAINT PK_LangId PRIMARY KEY CLUSTERED (LangId)
);

PRINT 'Created Languages LUT.';

GO

/* =============================================
=  Assigned User-Languages relationship table  =
============================================= */

DROP TABLE IF EXISTS users.UserLanguages;

CREATE TABLE users.UserLanguages (

    /* User & Language IDs
    ===================================== */

    UserId bigint NOT NULL,
    LangId smallint NOT NULL,

    /* Constraints
    ===================================== */

    -- * The composite primary key using both IDs
    CONSTRAINT PK_UserLang PRIMARY KEY CLUSTERED (UserId, LangId),

    -- * The foreign key constraints for both IDs
    CONSTRAINT FK_UserLang_User FOREIGN KEY (UserId) REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_UserLang_Lang FOREIGN KEY (LangId) REFERENCES users.Languages (LangId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * The Unique constraint that ensures each each user-language combination only occurs once
    CONSTRAINT UQ_User_Lang UNIQUE (UserId, LangId)
);

PRINT 'Created User-Language Relationship table.';

GO

/* =====================================
=        User Collections table        =
===================================== */

DROP TABLE IF EXISTS users.UserCollections;

CREATE TABLE users.UserCollections (

    /* Collection and Creator/Owner IDs
    ===================================== */

    CollectionId   bigint IDENTITY (1, 1) NOT NULL,
    CreatorId      bigint NOT NULL,

    /* Collection Info
    ===================================== */

    -- * Basic Collection info
    CollectionName nvarchar(30) NOT NULL,
    CollectionDesc nvarchar(256),

    -- * Collection Classification
    IsFavourites   bit DEFAULT (0) NOT NULL,
    IsPublic       bit DEFAULT (0) NOT NULL

    /* Constraints
    ===================================== */

    -- * The primary key for this table
    CONSTRAINT PK_CollectionId PRIMARY KEY CLUSTERED (CollectionId),

    -- * The foreign key constraint for the User/Creator ID of the collection
    CONSTRAINT FK_Collection_User FOREIGN KEY (CreatorId) REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * The Unique constraint that ensures each user has uniquely-named collections
    CONSTRAINT UQ_User_CollectionName UNIQUE (CreatorId, CollectionName)
);

PRINT 'Created User Collection table.';

CREATE UNIQUE NONCLUSTERED INDEX
UX_UserCollections_CreatorId_SingleFavourites
    ON users.UserCollections (CreatorId)
    WHERE IsFavourites = 1;

PRINT 'Created One-Favourites-Collection-Per-User User Collections Table Validating Index.';

GO

/* ============================================
= User Favourites Collection creation trigger =
============================================ */

-- ? The trigger inserts a favourites collection into the collections table when a new
-- ? user joins

CREATE TRIGGER users.TR_UserCollection_InsertFavouritesOnUserJoin
ON users.UserAccount
AFTER INSERT
AS
BEGIN
-- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    INSERT INTO
    users.UserCollections (
        CreatorId,
        CollectionName,
        CollectionDesc,
        IsFavourites,
        IsPublic
    )
    SELECT
        inserted.UserId,
        'Favourites'                          AS CollectionName,
        'Your default Favourites collection.' AS CollectionDesc,
        1                                     AS IsFavourites,
        1                                     AS IsPublic
    FROM inserted
    ORDER BY inserted.UserId ASC;
END;

GO

/* =====================================
=     User Billing Addresses table     =
===================================== */

DROP TABLE IF EXISTS users.BillingAddress;

CREATE TABLE users.BillingAddress (

    /* Address Identification
    ===================================== */

    AddressId      bigint IDENTITY (1, 1) NOT NULL,
    AddressName    nvarchar(50) NOT NULL,

    /* Address Location info
    ===================================== */

    -- * For example, street/area/block
    AddressLine1   nvarchar(100) NOT NULL,
    -- * For example, room/floor/building
    AddressLine2   nvarchar(100),
    -- ? Renamed to include global codes, and made nullable because some countries don't have them at all
    PostalCode     nvarchar(20),
    AddressCountry smallint NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the Billing Address's ID
    CONSTRAINT PK_BillingAddressId PRIMARY KEY CLUSTERED (AddressId),

    -- * Foreign key constraint for the Country ID this Billing Address is in
    CONSTRAINT FK_BillingAddress_Country FOREIGN KEY (AddressCountry) REFERENCES locations.Country (CountryId)
    ON UPDATE CASCADE
);

PRINT 'Created Billing Address table.';

GO

/* =====================================
=        User Payment Method LUT       =
===================================== */

DROP TABLE IF EXISTS users.PaymentMethod;

CREATE TABLE users.PaymentMethod (

    /* Method Classification
    ===================================== */

    MethodId                   bigint IDENTITY (1, 1) NOT NULL,
    -- * From the table under the reservations schema
    MethodType                 tinyint NOT NULL,
    -- * The associated billing address with this payment method
    BillingAddress             bigint NOT NULL,

    /* User-side Info
    ===================================== */

    OwnerId                    bigint NOT NULL,
    -- * What this payment method is saved as, such as "My Credit Card"
    MethodName                 nvarchar(50) NOT NULL,

    /* Billing Fields
    ===================================== */

    -- * Originally, I planned to just include the Cardholder name as one of the fields in
    -- * credit cards or other types that needed names, and instead take the name based on the OwnerId.
    -- ! However, I realised that the payment method name can very commonly be different than the account's owner
    -- ! For example, using a shared credit card with a spouse's name, using a parent's bank account, using a shared
    -- ! crypto wallet, etc. This was thus split off into a dedicated billing-related name for this purpose.
    BillingName                nvarchar(100) NOT NULL,

    -- * Neutral/multi-purpose fields, the values of which are enforced based on the method type using constraints
    Field1                     varchar(100),
    Field2                     varchar(100),
    Field3                     varchar(100),
    Field4                     varchar(100),
    Field5                     varchar(100),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the Payment Method ID
    CONSTRAINT PK_PaymentMethodId PRIMARY KEY CLUSTERED (MethodId),

    -- * Foreign key constraint for the payment method type ID
    CONSTRAINT FK_PaymentMethod_MethodType FOREIGN KEY (MethodType) REFERENCES reservations.PaymentMethodType (TypeId),
    -- * Foreign key constraint for the payment method's associated billing address
    CONSTRAINT FK_PaymentMethod_BillingAddress FOREIGN KEY (BillingAddress) REFERENCES users.BillingAddress (AddressId)
    ON UPDATE CASCADE,
    -- * Foreign key constraint for the user who saved/added the payment method
    CONSTRAINT FK_PaymentMethod_User FOREIGN KEY (OwnerId) REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * Constraint to validate the billing name for any payment type
    CONSTRAINT CHK_Valid_BillingName CHECK (dbo.FN_IsValidName(BillingName) = 1),

    /* Type-specific Constraints
    ===================================== */

    -- ? The payment method types will be populated manually, with the following order:
    -- ?    1 - Card
    -- ?    2 - Digital Wallet (Google/Apple pay)
    -- ?    3 - Paypal/Venmo
    -- ?    4 - Buy now & Pay Later (BNPL)
    -- ?    5 - Bank Transfer

    -- * Validates if the method is a card, or skips
    CONSTRAINT CHK_Valid_CardPaymentMethod CHECK (
        -- ? If the method is not a card, skip
        MethodType <> 1
        -- ? Otherwise, check card fields
        OR (
            -- ? Checking the card number
            dbo.FN_IsValidCardNumber(Field1) = 1

            -- ! The month and year are separate both for normal forms and for easier checks
            -- ! and validation (see trigger below)
            -- ? Checking the month, 2 digits between 1 and 12 in value (01 = 1, etc.)
            AND REGEXP_LIKE(Field2, '^[0-9]{2}$')
            AND CAST(Field2 AS int) BETWEEN 1 AND 12

            -- ? Checking the year, either 2 or 4 digits
            AND REGEXP_LIKE(Field3, '^([0-9]{2}|[0-9]{4})$')

            -- ? Checking the CVV/CVC, ensuring it is 3 or 4 digits
            AND REGEXP_LIKE(Field4, '^[0-9]{3,4}$')

            -- ? Checking that the last field is empty
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is a digital wallet, or skips
    CONSTRAINT CHK_Valid_DigitalWalletPaymentMethod CHECK (
        -- ? If the method is not a card, skip
        MethodType <> 2
        -- ? Otherwise, check digital wallet fields
        OR (
            -- ? Checks the full merchant/payment token (Letters, numbers, underscores, hyphens),
            -- ? assuming this is handled by the frontend through stripe
            -- ? (https://gist.github.com/fnky/76f533366f75cf75802c8052b577e2a5?permalink_comment_id=4346671#gistcomment-4346671)
            REGEXP_LIKE(Field1, '^[a-z]{2,5}_[0-9A-Za-z]{8,58}$')

            -- ? Checks the month and year, same as above
            AND REGEXP_LIKE(Field2, '^[0-9]{2}$')
            AND CAST(Field2 AS int) BETWEEN 1 AND 12
            AND REGEXP_LIKE(Field3, '^([0-9]{2}|[0-9]{4})$')

            -- ? Checks if the Payment provider is valid
            AND Field4 IN ('APPLE_PAY', 'GOOGLE_PAY')

            -- ? Checking that the last field is empty
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is Paypal/Venmo, or skips
    CONSTRAINT CHK_Valid_PayPalVenmoPaymentMethod CHECK (
        -- ? If the method is not Paypal/Venmo, skip
        MethodType <> 3
        OR (
            (
            -- ? If it is PayPal, Field1 is the payer ID or a vault ID
            -- ? (https://developer.paypal.com/docs/api/payment-tokens/v3/)
                Field4 = 'PAYPAL'
                AND REGEXP_LIKE(Field1, '^[A-Z0-9]{13,36}$')
            )
            OR
            (
            -- ? If it is Venmo, Field1 stores the username (starts with @, allows letters/numbers/hyphens/underscores)
                Field4 = 'VENMO'
                AND dbo.FN_IsValidUsername(Field1) = 1
            )

            -- ? Checking that the other 3 fields are empty
            AND Field2 IS NULL
            AND Field3 IS NULL
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is a BNPL method, or skips
    CONSTRAINT CHK_Valid_BNPLPaymentMethod CHECK (
        -- ? If the method is not a BNPL system, skip
        MethodType <> 4
        OR (
            -- ? Check the stored/saved token, usually between 30-60 characters with numbers, letters,
            -- ? hyphens, underscores, and sometimes slashes. Length limits are with padding
            -- ? eg: (https://documentation.lemonway.com/reference/moneyins_cardwebinitpost)
            REGEXP_LIKE(Field1, '^[A-Za-z0-9_/-]{10,100}$')
            AND

            -- ? Check the provider/system
            Field4 IN ('KLARNA', 'AFFIRM', 'AFTERPAY', 'SPLITIT')

            -- ? Check that the remaining fields are empty
            AND Field2 IS NULL
            AND Field3 IS NULL
            AND Field5 IS NULL
        )
    ),

    -- * Validates if the method is a Bank account, or skips
    CONSTRAINT CHK_Valid_BankPaymentMethod CHECK (
        -- ? If the method is not a Bank account/transfer location, skip
        MethodType <> 5
        OR (
            -- ! NOTE: While there are many other bank transfer types in the real world,
            -- ! I will keep this Bank transfer to a simple IBAN system. Otherwise, there
            -- ! can be easy checks similar to the Paypal/Venmo options shown above
            -- ? Checks the IBAN  (https://www.iban.com/structure)
            REGEXP_LIKE(Field1, '^[A-Z]{2}[0-9]{2}[A-Z0-9]{10,30}$')

            -- ? Checks the BIC/SWIFT Code (https://wise.com/gb/swift-codes/)
            AND REGEXP_LIKE(Field2, '^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$')

            -- ? Checks the account type
            AND Field4 IN ('CHECKING', 'SAVINGS')

            -- ? Checks that the remaining 2 fields are null
            AND Field3 IS NULL
            AND Field5 IS NULL
        )
    )
);

PRINT 'Created the Payment Methods table.';

GO

/* =====================================
=       Card Validation trigger        =
===================================== */

CREATE TRIGGER users.TR_PaymentMethod_ValidateCardExpiryDate
ON users.PaymentMethod
AFTER INSERT, UPDATE
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? The current month & year
    DECLARE @CurrentMonth int = MONTH(GETDATE());
    DECLARE @CurrentYear int = YEAR(GETDATE());
    DECLARE @Flag bit = 0;

    -- ? Normalise the year for reuse, and also keep the method type and month
    WITH
        NormalisedDates AS (
            SELECT
                MethodType,
                CAST(Field2 AS int) AS ExpiryMonth,
                IIF(
                    LEN(Field3) = 2,
                    2000 + CAST(Field3 AS int),
                    CAST(Field3 AS int)
                )                   AS ExpiryYear
            FROM inserted
        )

    -- ? If a row is returned, then the flag updates to 1
    -- ? (https://learn.microsoft.com/en-us/sql/t-sql/language-elements/select-local-variable-transact-sql?view=sql-server-ver17)
    SELECT TOP 1 @Flag = 1
    FROM NormalisedDates
    WHERE
        -- ? If it's a credit card or digital wallet entry
        MethodType IN (1, 2)
        AND (
            -- ? If the year is before the current one
            ExpiryYear < @CurrentYear
            -- ? If the year is more than the approximate max year based on the method type
            OR ExpiryYear > (
                @CurrentYear + CASE MethodType
                    -- * If it is a card, then usually 3-5 years
                    WHEN 1 THEN 5
                    -- * If it is a digital wallet, then up to 10 years
                    WHEN 2 THEN 10
                    ELSE 5
                END
            )
            -- ? If the year is the current year, but the month is a previous month
            OR
            (
                ExpiryYear = @CurrentYear
                AND ExpiryMonth < @CurrentMonth
            )
        )

    IF @Flag = 1
        BEGIN
            -- ? If the card inserted/updated is expired
            RAISERROR ('Inserted credit card is expired! Please verify the card details.', 16, 1);
            -- * Rewind
            ROLLBACK TRANSACTION;
        END
END;

GO

PRINT 'Created Card Date Validation trigger.';

GO

/* =====================================
=         Property Type table          =
===================================== */

DROP TABLE IF EXISTS properties.PropertyType;

CREATE TABLE properties.PropertyType (

    /* Type Info
    ===================================== */

    TypeId          smallint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Apartment", "House", "Duplex"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property type ID
    CONSTRAINT PK_PropertyType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Property Type LUT.';

GO

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

GO

/* =====================================
=        Property Images table         =
===================================== */

DROP TABLE IF EXISTS properties.PropertyImages;

CREATE TABLE properties.PropertyImages (

    /* Image info
    ===================================== */

    ImageId    bigint IDENTITY (1, 1) NOT NULL,

    -- * The property this image is of/associated with
    PropertyId bigint NOT NULL,

    -- * The actual URL of the image
    ImageUrl   varchar(1500) NOT NULL,

    -- * The index/order of this image in the gallery/carousel of property images for its property
    ImageIndex tinyint DEFAULT (0),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the image id
    CONSTRAINT PK_PropertyImage PRIMARY KEY CLUSTERED (ImageId),

    -- * Foreign key constraint for the property ID
    CONSTRAINT FK_PropertyImage_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * A unique constraint on the property, url, and index columns
    -- ? This was not in the original plan, but this is now added to ensure
    -- ? no duplicate image URL gets uploaded in the same position/index for the same property
    CONSTRAINT UQ_Property_Image_Index UNIQUE (PropertyId, ImageUrl, ImageIndex)
);

PRINT 'Created Property Images table.';

GO

/* =====================================
=      Property Sector Type table      =
===================================== */

DROP TABLE IF EXISTS properties.SectorType;

CREATE TABLE properties.SectorType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Room", "Guest House", "Floor"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the sector type ID
    CONSTRAINT PK_SectorType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Sector Type LUT.';

GO

/* =====================================
=        Property Sectors table        =
===================================== */

DROP TABLE IF EXISTS properties.PropertySectors;

CREATE TABLE properties.PropertySectors (

    /* Sector Identification
    ===================================== */

    SectorId          bigint IDENTITY (1, 1) NOT NULL,
    -- * The type of sector, from a LUT
    SectorTypeId      tinyint NOT NULL,
    -- * The property this sector belongs to
    PropertyId        bigint NOT NULL,

    /* Sector Information
    ===================================== */

    SectorName        varchar(64) NOT NULL,
    SectorDescription varchar(256),

    /* Sector Specifications
    ===================================== */

    -- * Minimum and maximum occupants per booking
    -- ! A min/max occupants count of 0 means that there is no lower/upper limit
    MinOccupants      tinyint DEFAULT (0) NOT NULL,
    MaxOccupants      tinyint DEFAULT (0) NOT NULL,

    -- * The number of beds, bedrooms, and bathrooms
    NumOfBeds         tinyint DEFAULT (0) NOT NULL,
    NumOfBedrooms     tinyint DEFAULT (0) NOT NULL,
    NumOfBathrooms    tinyint DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the sector ID
    CONSTRAINT PK_SectorId PRIMARY KEY CLUSTERED (SectorId),

    -- * Foreign key constraints for the sector type and containing property
    CONSTRAINT FK_PropertySector_Type FOREIGN KEY (SectorTypeId) REFERENCES properties.SectorType (TypeId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_PropertySector_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- ? Ensuring that no sectors in the same property have the same name
    CONSTRAINT UQ_PropertySector_Name UNIQUE (PropertyId, SectorName),

    -- ? Checking that all spec quantities are non-negative
    CONSTRAINT CHK_NonNegative_MinSectorOccupants CHECK (MinOccupants >= 0),
    CONSTRAINT CHK_NonNegative_MaxSectorOccupants CHECK (MaxOccupants >= 0),
    CONSTRAINT CHK_NonNegative_NumOfBeds CHECK (NumOfBeds >= 0),
    CONSTRAINT CHK_NonNegative_NumOfBedrooms CHECK (NumOfBedrooms >= 0),
    CONSTRAINT CHK_NonNegative_NumOfBathrooms CHECK (NumOfBathrooms >= 0),

    -- ? Checking that the maximum number of occupants is either
    -- ? (1) Greater than or equal to the minimum number of occupants (valid case)
    -- ? (2) Zero, meaning there is no maximum number of occupants (unusual but possible)
    CONSTRAINT CHK_Valid_MaxSectorOccupants CHECK (
        MaxOccupants >= MinOccupants
        OR MaxOccupants = 0
    )
);

PRINT 'Created Property-Sector Relationship table.';

GO

/* =====================================
=       Property Category table        =
===================================== */

DROP TABLE IF EXISTS properties.PropertyCategory;

CREATE TABLE properties.PropertyCategory (

    /* Category Info
    ===================================== */

    CategoryId          int IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Beach House", "Mountain Home"
    CategoryName        varchar(64) NOT NULL UNIQUE,
    CategoryDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property category ID
    CONSTRAINT PK_PropertyCategory PRIMARY KEY CLUSTERED (CategoryId)
);

PRINT 'Created Property Category LUT.';

GO

/* =====================================
=   Assigned Property Category table   =
===================================== */

DROP TABLE IF EXISTS properties.AssignedPropertyCategories;

CREATE TABLE properties.AssignedPropertyCategories (

    /* Property and Category
    ===================================== */

    -- * The property being assigned a category
    PropertyId bigint NOT NULL,

    -- * The category being assigned to the property
    CategoryId int NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property-category combination
    CONSTRAINT PK_AssignedPropCat PRIMARY KEY CLUSTERED (PropertyId, CategoryId),

    -- * Foreign key constraints for both the property and category IDs
    CONSTRAINT FK_AssignedPropCat_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_AssignedPropCat_Category FOREIGN KEY (CategoryId) REFERENCES properties.PropertyCategory (CategoryId)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

PRINT 'Created Assigned Property-Category Relationship table.';

GO

/* =====================================
=    Property Attribute Type table     =
===================================== */

DROP TABLE IF EXISTS properties.AttributeType;

CREATE TABLE properties.AttributeType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Amenity", "Surrounding Area Trait", "Service Trait"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the attribute type ID
    CONSTRAINT PK_AttributeType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Property Attribute Type LUT.';

GO

/* =====================================
=       Property Attribute table       =
===================================== */

DROP TABLE IF EXISTS properties.PropertyAttribute;

CREATE TABLE properties.PropertyAttribute (

    /* Attribute Info
    ===================================== */

    AttributeId          smallint IDENTITY (1, 1) NOT NULL,

    -- * The attribute type (amenity, area trait, etc.)
    AttributeTypeId      tinyint NOT NULL,

    -- * I.e. "Free Wifi", "Great View"
    AttributeName        varchar(64) NOT NULL UNIQUE,
    AttributeDescription varchar(256),

    -- ? Whether this attribute depends on users, like being a Guest Favourite vs Free Wifi
    IsUserBased          bit DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property attribute ID
    CONSTRAINT PK_PropertyAttribute PRIMARY KEY CLUSTERED (AttributeId),

    -- * Foreign key constraint for the attribute type
    CONSTRAINT FK_PropertyAttribute_Type FOREIGN KEY (AttributeTypeId) REFERENCES properties.AttributeType (TypeId)
    ON UPDATE CASCADE
);

PRINT 'Created Property Attribute LUT.';

GO

/* ===============================================
= Assigned property-attribute relationship table =
=============================================== */

DROP TABLE IF EXISTS properties.AssignedPropertyAttributes;

CREATE TABLE properties.AssignedPropertyAttributes (

    /* Property and Attribute
    ===================================== */

    -- * The property being assigned a attribute
    PropertyId  bigint NOT NULL,

    -- * The attribute being assigned to the property
    AttributeId smallint NOT NULL,

    -- ? Whether the attribute is notable for this property and so should be outlined/emphasised,
    -- ? such as being the only property in the area to have Free Parking, etc.
    IsNotable   bit DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property-attribute combination
    CONSTRAINT PK_AssignedPropAttr PRIMARY KEY CLUSTERED (PropertyId, AttributeId),

    -- * Foreign key constraints for both the property and attribute IDs
    CONSTRAINT FK_AssignedPropAttr_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_AssignedPropAttr_Attribute FOREIGN KEY (AttributeId) REFERENCES properties.PropertyAttribute (AttributeId)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

PRINT 'Created Assigned Property-Attribute Relationship table.';

GO

/* ====================================================
=  Properties in User Collections relationship table  =
==================================================== */

DROP TABLE IF EXISTS users.PropertiesInCollections;

CREATE TABLE users.PropertiesInCollections (

    /* Collection and Property IDs
    ===================================== */

    CollectionId bigint NOT NULL,
    PropertyId   bigint DEFAULT (0) NOT NULL,

    /* Added Info
    ===================================== */

    AddedBy      bigint DEFAULT (0) NOT NULL,
    AddedOn      datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the three main columns (Collection, User, and Property IDs)
    CONSTRAINT PK_PropertiesInUserCollections PRIMARY KEY CLUSTERED (CollectionId, AddedBy, PropertyId),

    -- * Foreign key constraints for the three main columns
    CONSTRAINT FK_PropertyInCollection_Collection FOREIGN KEY (CollectionId) REFERENCES users.UserCollections (CollectionId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_PropertyInCollection_User FOREIGN KEY (AddedBy) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_PropertyInCollection_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON DELETE CASCADE
);

PRINT 'Created Assigned Property-Collection Relationship table.';

GO

/* =====================================
=          Booking Status LUT          =
===================================== */

DROP TABLE IF EXISTS reservations.BookingStatus;

CREATE TABLE reservations.BookingStatus (

    /* Status Info
    ===================================== */

    StatusId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Reserved", "Complete", "On Hold"
    StatusName        varchar(64) NOT NULL UNIQUE,
    StatusDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the booking status ID
    CONSTRAINT PK_BookingStatus PRIMARY KEY CLUSTERED (StatusId)
);

PRINT 'Created Booking Status LUT.';

GO

/* =====================================
=          Payment Status LUT          =
===================================== */

DROP TABLE IF EXISTS reservations.PaymentStatus;

CREATE TABLE reservations.PaymentStatus (

    /* Status Info
    ===================================== */

    StatusId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Refunded", "Rolled back", "Delivered", "On Hold"
    StatusName        varchar(64) NOT NULL UNIQUE,
    StatusDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the payment status ID
    CONSTRAINT PK_PaymentStatus PRIMARY KEY CLUSTERED (StatusId)
);

PRINT 'Created Payment Status LUT.';

GO

/* =====================================
=          Payment Purpose LUT         =
===================================== */

DROP TABLE IF EXISTS reservations.PaymentPurpose;

CREATE TABLE reservations.PaymentPurpose (

    /* Purpose Info
    ===================================== */

    PurposeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Refund", "Instalment", "Payout"
    PurposeName        varchar(64) NOT NULL UNIQUE,
    PurposeDescription varchar(256) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the payment purpose ID
    CONSTRAINT PK_PaymentPurpose PRIMARY KEY CLUSTERED (PurposeId)
);

PRINT 'Created Payment Purpose LUT.';

GO

/* =====================================
=       Property Bookings table        =
===================================== */

DROP TABLE IF EXISTS reservations.PropertyBookings;

CREATE TABLE reservations.PropertyBookings (

    /* Booking Identification
    ===================================== */

    BookingId                bigint IDENTITY (1, 1) NOT NULL,
    -- * The property being booked
    PropertyId               bigint NOT NULL,
    -- * The user/customer that booked the property
    BookerId                 bigint NOT NULL,

    /* Booking Info
    ===================================== */

    -- * The current status of the booking
    BookingStatusId          tinyint NOT NULL,

    -- * The booking check-in and check-out dates
    StartDate                date NOT NULL,
    EndDate                  date NOT NULL,

    /* Booking Finances
    ===================================== */

    -- * The base price per night
    -- ! This was broken down into the 3 separate parts after realising relying on the frontend
    -- ! for appropriate record keeping, as well as continuous FK relationships might not be good
    -- ! for records. For example, getting the financial modifier from the UserId > TierId > Mod is unreliable
    -- ! as the user might have changed tiers between the booking date and query date
    BasePricePerNight        decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * The financial modifier applied to this booking
    AppliedFinancialModifier decimal(3, 2) DEFAULT (0) NOT NULL,

    -- * The computed price per night
    FinalPricePerNight       decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * Fees per night
    ServiceFeePerNight       decimal(14, 2) DEFAULT (0) NOT NULL,
    CleaningFeePerNight      decimal(14, 2) DEFAULT (0) NOT NULL,

    -- * The total price per night, with fees
    TotalPricePerNight       decimal(15, 2) DEFAULT (0) NOT NULL,

    -- * The total booking cost, computed from all nightly costs multiplied by the number of nights
    TotalBookingCost         decimal(16, 2) DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the property type ID
    CONSTRAINT PK_PropertyBookings PRIMARY KEY CLUSTERED (BookingId),

    -- * Foreign key constraints for the Property and Booker IDs
    CONSTRAINT FK_PropertyBooking_User FOREIGN KEY (BookerId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_PropertyBooking_Property FOREIGN KEY (PropertyId) REFERENCES properties.Property (PropertyId)
    ON UPDATE CASCADE,

    -- * Non-negative validations
    CONSTRAINT CHK_NonNegative_BasePriceNight CHECK (BasePricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_FinalPriceNight CHECK (FinalPricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_ServiceFeeNight CHECK (ServiceFeePerNight >= 0),
    CONSTRAINT CHK_NonNegative_CleaningFeeNight CHECK (CleaningFeePerNight >= 0),
    CONSTRAINT CHK_NonNegative_TotalNightCost CHECK (TotalPricePerNight >= 0),
    CONSTRAINT CHK_NonNegative_TotalCost CHECK (TotalBookingCost >= 0),

    -- * Date validation
    CONSTRAINT CHK_Valid_BookingEndDate CHECK (EndDate >= StartDate),

    -- ? Limits the modifier between 0 and 2
    -- ? Allows numbers above 1 in case they are needed for whatever reason
    -- ? for example, an "on probation" or "penalty" tier? Maybe
    CONSTRAINT CHK_Valid_BookingFinancialModifier CHECK (
        AppliedFinancialModifier <= 2 AND AppliedFinancialModifier >= 0
    )
);

PRINT 'Created Property Bookings table.';

GO

/* ========================================
=  Booking Price info Population trigger  =
======================================== */

-- ? The trigger calculates and populates the price info for a booking based on the
-- ? property pricing

CREATE TRIGGER reservations.TR_Bookings_PopulatePriceInfo
ON reservations.PropertyBookings
AFTER INSERT
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the calculated and populated booking price info into the newly updated row
    UPDATE PropertyBookings
    SET
        -- * The base price per night
        PropertyBookings.BasePricePerNight = Prop.PerNightCost,

        -- * The fees per night
        PropertyBookings.CleaningFeePerNight = Prop.CleaningFeePerNight,
        PropertyBookings.ServiceFeePerNight = Prop.ServiceFeePerNight,

        -- * The financial modifier applied to this booking
        PropertyBookings.AppliedFinancialModifier = UsrTr.TierFinancialModifier,

        -- * The modified price per night
        PropertyBookings.FinalPricePerNight = Prop.PerNightCost * UsrTr.TierFinancialModifier,

        -- * The total booking cost per night, including the fees
        PropertyBookings.TotalPricePerNight = Prop.PerNightCost * UsrTr.TierFinancialModifier + Prop.CleaningFeePerNight + Prop.ServiceFeePerNight,

        -- * And lastly, the total booking cost for the entire reservation/booking
        PropertyBookings.TotalBookingCost = (
            Prop.PerNightCost * UsrTr.TierFinancialModifier
            + Prop.CleaningFeePerNight + Prop.ServiceFeePerNight
        ) * DATEDIFF(DAY, Ins.StartDate, Ins.EndDate)

    FROM reservations.PropertyBookings AS Bks
    -- ? And join the tables for the relevant data

    -- * The inserted row for the new data
    INNER JOIN
        inserted AS Ins
        ON Bks.BookingId = Ins.BookingId

    -- * The property table for base property info
    INNER JOIN
        properties.Property AS Prop
        ON Ins.PropertyId = Prop.PropertyId

    -- * The user account table to get the user's tier
    INNER JOIN
        users.UserAccount AS UsrAc
        ON Ins.BookerId = UsrAc.UserId

    -- * The user tier table to get the tier financial modifier
    INNER JOIN
        users.UserTier AS UsrTr
        ON UsrAc.UserTier = UsrTr.TierId;
END;

GO

PRINT 'Created Booking Price Info population function.';

GO

/* =====================================
=           Guest Type table           =
===================================== */

DROP TABLE IF EXISTS reservations.GuestType;

CREATE TABLE reservations.GuestType (

    /* Type Info
    ===================================== */

    TypeId          tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Adult", "Child", "Pet"
    TypeName        varchar(64) NOT NULL UNIQUE,
    TypeDescription varchar(256),

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the guest type ID
    CONSTRAINT PK_GuestType PRIMARY KEY CLUSTERED (TypeId)
);

PRINT 'Created Guest Type LUT.';

GO

/* =====================================
=   Booking-Guest relationship table   =
===================================== */

DROP TABLE IF EXISTS reservations.BookingGuests

CREATE TABLE reservations.BookingGuests (

    /* Guest booking info
    ===================================== */

    -- * The booking this record is for
    BookingId   bigint NOT NULL,

    -- * Guest type and quantity
    GuestTypeId tinyint NOT NULL,
    Quantity    tinyint DEFAULT (0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key for the booking ID and guest types
    CONSTRAINT PK_BookingGuests PRIMARY KEY CLUSTERED (BookingId, GuestTypeId),

    -- * Foreign key constraints for the booking ID and guest types
    CONSTRAINT FK_BookingGuests_Booking FOREIGN KEY (BookingId) REFERENCES reservations.PropertyBookings (BookingId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_BookingGuests_GuestType FOREIGN KEY (GuestTypeId) REFERENCES reservations.GuestType (TypeId)
    ON UPDATE CASCADE,

    CONSTRAINT CHK_NonNegative_GuestQuantity CHECK (Quantity >= 0)
);

PRINT 'Created Booking-Guests Relationship table.';

GO

/* =====================================
=            Payments table            =
===================================== */

-- ? The Payments table tracks all payments for bookings, installments, refunds, etc.

DROP TABLE IF EXISTS reservations.Payments;

CREATE TABLE reservations.Payments (

    /* Payment Identification & Association
    ===================================== */

    PaymentId        bigint IDENTITY (1, 1) NOT NULL,
    -- * The booking this payment is connected with
    AssocBookingId   bigint NOT NULL,
    -- * The payment method used for this payment
    PaymentMethodId  bigint DEFAULT (0) NOT NULL,

    /* Payment Classification
    ===================================== */

    -- * What this payment was for - a refund, a host payout, an instalment, etc.
    PaymentPurposeId tinyint NOT NULL,
    -- * The current status of the payment - on hold, delivered, etc.
    PaymentStatusId  tinyint NOT NULL,

    /* Payment information
    ===================================== */

    -- * The user paying the money
    PayerId          bigint NOT NULL,
    -- * The user receiving this payment
    PayeeId          bigint NOT NULL,

    -- * The amount paid in this transaction
    PaidAmount       decimal(14, 2) DEFAULT (0) NOT NULL,

    -- ! The columns below were initially not in the plan, but while developing this database's
    -- ! tables it seemed completely logical to add them

    -- * The date and time this payment was made on
    PaidOn           datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    -- * Any optional comment attached to the payment
    PaymentComment   nvarchar(500) DEFAULT ('') NOT NULL,

    -- * The remaining amount/balance for the booking after this payment is accumulated
    AmountRemaining  decimal(14, 2) DEFAULT (0.0) NOT NULL,

    /* Constraints
    ===================================== */

    -- ? The primary key constraint for the payment ID
    CONSTRAINT PK_Payments PRIMARY KEY CLUSTERED (PaymentId),

    -- ? The foreign key constraint for the associated booking
    CONSTRAINT FK_Payments_AssociatedBooking FOREIGN KEY (AssocBookingId) REFERENCES reservations.PropertyBookings (BookingId)
    ON UPDATE CASCADE,

    -- ? The foreign key constraints for the payment classification (method, purpose, and status)
    CONSTRAINT FK_Payments_PaymentMethod FOREIGN KEY (PaymentMethodId) REFERENCES users.PaymentMethod (MethodId),
    CONSTRAINT FK_Payments_PaymentPurpose FOREIGN KEY (PaymentPurposeId) REFERENCES reservations.PaymentPurpose (PurposeId),
    CONSTRAINT FK_Payments_PaymentStatus FOREIGN KEY (PaymentStatusId) REFERENCES reservations.PaymentStatus (StatusId),

    -- ? The foreign key constraints for the involved users/parties
    CONSTRAINT FK_Payments_Payer FOREIGN KEY (PayerId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_Payments_Payee FOREIGN KEY (PayeeId) REFERENCES users.UserAccount (UserId),

    -- ? Validates that the payment amount is non-negative
    CONSTRAINT CHK_NonNegative_PaymentAmount CHECK (PaidAmount >= 0),

    -- ? Checks that the payer and payee are not the same user (no money laundering in this database on my watch)
    CONSTRAINT CHK_Payments_DiffParties CHECK (PayerId <> PayeeId)
);

PRINT 'Created Payments table.';

GO

/* ====================================================
= Remaining Balance Post-payment Calculation function =
==================================================== */

-- ? The function calculates the remaining balance to be paid after a newly inputted
-- ? payment/refund, accounting for the payment type and booking status

CREATE FUNCTION reservations.FN_GetRemainingBalance(
    -- * The associated booking to get the payment information for
    @BookingID bigint,

    -- * The last/newest payment info
    @NewPaymentId bigint,
    @NewPaidAmount decimal(14, 2),
    @NewPaymentPurpose tinyint
)
RETURNS decimal(14, 2)
AS
BEGIN
    -- * The variable to store the cumulative payment/balance sum for the booking
    DECLARE @CumulativeSum decimal(14, 2);

    -- ? Declaring and populating the associated booking's cost and status (to check if it's cancelled later on)
    DECLARE @FullCost decimal(14, 2);
    DECLARE @AssociatedBookingStatus tinyint;
    -- ? Fetch original cost and status
    SELECT
        @FullCost = PropertyBookings.TotalBookingCost,
        @AssociatedBookingStatus = PropertyBookings.BookingStatusId
    FROM reservations.PropertyBookings
    WHERE PropertyBookings.BookingId = @BookingID;

    -- ? Get and store the defined ID for a Cancelled booking Status
    DECLARE @CancelledStatusID tinyint;
    SELECT @CancelledStatusID = StatusId FROM reservations.BookingStatus
    WHERE StatusName = 'Cancelled';

    -- ? Get and store the defined IDs for payments that add onto the remaining balance
    -- ? i.e. refunds, security deposits, damages, etc.
    DECLARE @NegativePurposeIds TABLE (
        PurposeId tinyint
    );
    INSERT INTO
    @NegativePurposeIds (PurposeId)
    (
        SELECT PurposeId FROM reservations.PaymentPurpose
        WHERE PurposeName IN ('Refund', 'Additional Charge', 'Security Deposit Claim', 'Tax')
    );

    -- ? Get and store the defined IDs for payments that have no effect on the remaining balance
    -- ? i.e. host/co-host payouts, commission fees, etc.
    DECLARE @ZeroingPurposeIds TABLE (
        PurposeId tinyint
    );
    INSERT INTO
    @ZeroingPurposeIds (PurposeId)
    (
        SELECT PurposeId FROM reservations.PaymentPurpose
        WHERE PurposeName IN ('Payout', 'Co-Host Payout', 'Host Referral Bonus', 'Platform Commission Fee')
    );

    -- ? If the booking we are tracking has been cancelled, then the full cost starting point is now nothing
    -- ! If there were a cancellation fee implemented in the hypothetical airbnb system we are making, then it would simply be that number
    -- ! instead of 0 here, or even that percentage * the total cost, etc. But, the same logic applies,
    -- ? We do this so that if a booking is cancelled and the customer has already paid, the system tracks how much they are owed in refunds
    IF (@AssociatedBookingStatus = @CancelledStatusID)
        SET @FullCost = 0;

    -- ? Now, we sum up all previous payments (before this new/last one)
    SELECT
        @CumulativeSum = SUM(
            -- ? Add either the paid amount or subtract it/add its negative if it was a refund/add
            CASE
                -- ? The join means that if the isn't null then the payment was of a specific type (i.e. the join returned data)

                -- ? If this is a payment that Increases Balance (Money given back OR extra charges)
                WHEN NegIds.PurposeId IS NOT NULL THEN -Payments.PaidAmount

                -- ? If this is a payment that has no impact on the balance (such as a host payout)
                WHEN ZeroIds.PurposeId IS NOT NULL THEN 0

                ELSE Payments.PaidAmount
            END

        )
    FROM reservations.Payments
    LEFT JOIN @NegativePurposeIds AS NegIds ON Payments.PaymentPurposeId = NegIds.PurposeId
    LEFT JOIN @ZeroingPurposeIds AS ZeroIds ON Payments.PaymentPurposeId = ZeroIds.PurposeId
    WHERE
        -- ? Make sure to check this booking's records, and those previous to the new one whose trigger is calling this function
        Payments.AssocBookingId = @BookingID
        AND Payments.PaymentId < @NewPaymentId;

    -- ? Now, to return, take the full cost (1/3)
    RETURN @FullCost - (
        -- ? Subtract the cumulative paid balance so far (2/3)
        ISNULL(@CumulativeSum, 0)
        + (
            -- ? And then add (or subtract/add the negative of) the newest payment if needed, and voila
            CASE
                -- ? If this is a payment that Increases Balance (Money given back OR extra charges)
                WHEN @NewPaymentPurpose IN (SELECT NIds.PurposeId FROM @NegativePurposeIds AS NIds)
                    THEN -@NewPaidAmount

                -- ? If this is a payment that has no impact on the balance (such as )
                WHEN @NewPaymentPurpose IN (SELECT ZIds.PurposeId FROM @ZeroingPurposeIds AS ZIds)
                    THEN 0.00

                ELSE @NewPaidAmount
            END
        )
    );
END;

GO

PRINT 'Created Remaining Booking Balance Calculation function.';

GO

/* ==============================================
= Payment Remaining Balance calculation trigger =
============================================== */

/**
*
* The trigger calculates and populates the remaining balance column in the Payments
* table on inserting a new payment
*
* ! This was originally planned to be a computed column, but unfortunately because I
* ! am using a defined function, I could not set it as PERSISTED, which meant that
* ! this would have to be dynamically calculated on each SELECT. That is definitely not
* ! well optimised. Also, that is why this trigger merely calls the function itself
* ! instead of housing the logic - I reused the function above in the trigger without
* ! having to refactor the whole function to work in a trigger. Also, this allows me to
* ! properly/clearly document everything in the function above
*/

CREATE TRIGGER reservations.TR_Payments_PopulateRemainingBalance
ON reservations.Payments
AFTER INSERT
AS
BEGIN
    -- ? Unneeded response of rows affected
    SET NOCOUNT ON;

    -- ? Merge a row with the calculated remaining balance into the newly updated row
    UPDATE Payments
    SET
        -- ? Calls the above function to set its value to the AmountRemaining column
        Payments.AmountRemaining = reservations.FN_GetRemainingBalance(
            NewPayment.AssocBookingId,
            NewPayment.PaymentId,
            NewPayment.PaidAmount,
            NewPayment.PaymentPurposeId
        )
    FROM reservations.Payments
    INNER JOIN inserted AS NewPayment ON Payments.PaymentId = NewPayment.PaymentId;
END;

GO

PRINT 'Created Booking Payment `AmountRemaining` population function.';

GO

/* =====================================
=        Property Review table         =
===================================== */

DROP TABLE IF EXISTS reviews.PropertyReview;

CREATE TABLE reviews.PropertyReview (

    /* Review ID and associated items
    ===================================== */

    ReviewId            bigint IDENTITY (1, 1) NOT NULL,
    -- ! There was also a property id FK that referenced the property being reviewed,
    -- ! but given that the booking table's row has the property ID, having the property here
    -- ! as well may violate normal forms, and it introduces another point of error (what if
    -- ! a different property ID is inserted here from the frontend?).
    -- ? The specific booking linked with this review
    AssociatedBookingId bigint NOT NULL,
    -- ? The user making this review
    ReviewerId          bigint NOT NULL,

    /* Review Content
    ===================================== */

    ReviewTitle         nvarchar(100) NOT NULL,
    ReviewComment       nvarchar(1000) NOT NULL,
    ReviewedOn          datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    -- ! There is a total rating column in this table that dynamically gets the
    -- ! total rating from fetching data from both CriteriaRatings and ReviewCriteria,
    -- ! but it is not defined in this script, because –
    -- ! It ended up proving to be an issue. Here is the issue and my solution:
    -- ? (1) CriteriaRatings needs PropertyReview to exist as a table before it is created, due to the FK
    -- ? (2) PropertyReview has the TotalRating column
    -- ? (3) The TotalRating is computed from values in CriteriaRatings and ReviewCriteria,
    -- !     and so it needs them both to exist before being created
    -- ! /!\ I now have a circular dependency, which, while logical, gives me immense trouble in
    -- !     creating these tables. I thus resorted to this solution in order to keep the schema
    -- !     and database design as planned:
    -- ? (1) I create the PropertyReview table first, WITHOUT the TotalRating column
    -- ? (2) Then, I create (ReviewCriteria and) CriteriaRatings, as its ReviewId FK is satisfied
    -- ?     by the creation of step (1)'s table, and ReviewCriteria is a LUT so that's fine
    -- ? (3) Lastly, I add the TotalRating column to the PropertyReview table, as now its computation has all
    -- ?     required tables now created from step (2)

    /* Constraints
    ===================================== */

    -- ? Primary key constraint for the review ID
    CONSTRAINT PK_PropertyReviewId PRIMARY KEY CLUSTERED (ReviewId),

    -- ? Foreign key constraints for the reviewer and booking IDs
    CONSTRAINT FK_PropertyReview_Booking FOREIGN KEY (AssociatedBookingId) REFERENCES reservations.PropertyBookings (BookingId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_PropertyReview_Reviewer FOREIGN KEY (ReviewerId) REFERENCES users.UserAccount (UserId),

    -- ? Unique constraint for the booking-user-property trio, ensuring a user can't rate a property for a same booking twice (they can edit),
    -- ? but that is frontend functionality. This constraint was not in the original plan, but it makes sense more now
    CONSTRAINT UQ_PropertyReview_Booking_Reviewer_Property UNIQUE (AssociatedBookingId, ReviewerId)
);

PRINT 'Created Property Review (without Total Rating) table.';

GO

/* =====================================
=         Review Criteria LUT          =
===================================== */

DROP TABLE IF EXISTS reviews.ReviewCriteria;

CREATE TABLE reviews.ReviewCriteria (

    /* Criterion Info
    ===================================== */

    CriterionId           tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Cleanliness", "Service", "Host Manners"
    CriterionName         varchar(64) NOT NULL UNIQUE,
    CriterionDescription  varchar(256) NOT NULL,

    -- ? The weight of the individual criterion when compiling an overall property rating from all criteria
    CriterionReviewWeight decimal(4, 2) DEFAULT (1.0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the review criterion ID
    CONSTRAINT PK_ReviewCriteria PRIMARY KEY CLUSTERED (CriterionId),

    -- * Limit and constraint for criterion weight
    CONSTRAINT CHK_Valid_CriterionWeight CHECK (
        CriterionReviewWeight >= 0
        -- ? An arbitrary but plausible limit on the weight of a criterion
        AND CriterionReviewWeight <= 10
    )
);

PRINT 'Created Review Criteria LUT.';

GO

/* ======================================
=  Criteria Ratings relationship table  =
====================================== */

DROP TABLE IF EXISTS reviews.CriteriaRatings;

CREATE TABLE reviews.CriteriaRatings (

    /* Criterion and Associated review
    ===================================== */

    ReviewId    bigint NOT NULL,
    CriterionId tinyint NOT NULL,

    -- * The rating for the criterion for this review
    Rating      decimal(2, 1) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the criterion and review IDs
    CONSTRAINT PK_CriteriaRatings PRIMARY KEY (ReviewId, CriterionId),

    -- * Foreign key constraints for the criterion and review IDs
    CONSTRAINT FK_CriteriaRating_Review FOREIGN KEY (ReviewId) REFERENCES reviews.PropertyReview (ReviewId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    CONSTRAINT FK_CriteriaRating_Criterion FOREIGN KEY (CriterionId) REFERENCES reviews.ReviewCriteria (CriterionId)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    -- * Validation and limiting of the rating
    CONSTRAINT CHK_Valid_CriterionRating CHECK (
        -- ? Between 0 and 5 stars total
        Rating >= 0
        AND Rating <= 5

        -- ? Divisible by half (i.e., either a whole star/rating or a half star/rating, like 2 and 2.5)
        AND (Rating % 0.5 = 0)
    )
);

PRINT 'Created Criteria-Rating Relationship table.';

GO

-- ! This function has to be put here (after these two tables, but before the property review table)
-- ! as it is used in a computed column in that table, but requires these two. That is why it is not in
-- ! the main functions.sql file

/* ==================================================
= Total Property Review Rating calculation function =
================================================== */

-- ? This function gathers a total weighted rating for a property based on an
-- ? associated booking and all the reviewed criteria associated with the booking's
-- ? review

CREATE
OR ALTER
FUNCTION reviews.FN_TotalPropertyReviewRating(@ReviewId bigint) RETURNS decimal(3, 2)
AS
BEGIN
    RETURN (
        -- ? We select and use aggregate functions to calculate the total review score for all the ratings
        SELECT
            -- ? If the result is null - i.e. a column failed to return something or the NULLIF created a NULL, then (1/2)
            ISNULL(
                -- ? Cast to ensure we are returning the proper type
                CAST(
                -- ? Add all the ratings multiplied by their relative weights
                    SUM(Ratings.Rating * Criteria.CriterionReviewWeight)

                    -- ? Divide by the sum of all weights.
                    -- ! We use a NULLIF here so the program doesn't crash if we somehow have a NULL criterion review weight
                    -- ! for example if the criterion ID somehow breaks, etc. by attempting to divide by 0. NULL above is
                    -- ! dealt with easily, but not here
                    / SUM(NULLIF(Criteria.CriterionReviewWeight, 0.0))

                    AS decimal(3, 2)

                -- ? Return 0.00 as a fallback (2/2)
                ), 0.00
            )
        -- ? Get all criterion ratings (1/3)
        FROM reviews.CriteriaRatings AS Ratings
        -- ? And all their weights (2/3)
        INNER JOIN reviews.ReviewCriteria AS Criteria
            ON Ratings.CriterionId = Criteria.CriterionId
        -- ? For the passed review (3/3)
        WHERE Ratings.ReviewId = @ReviewId
    );
END;

GO

PRINT 'Created Total Property Review Rating compilation function.';

GO

-- ? The computed total rating column is now added to the PropertyReview table
-- ? now that all looped dependencies are sorted
-- ! See the creation script for the PropertyReview table for the full information
ALTER TABLE reviews.PropertyReview
ADD
-- ? The derived and weighted total rating for the property linked with a particular booking
TotalRating AS reviews.FN_TotalPropertyReviewRating(ReviewId);
-- ? We cannot add a CHECK constraint to clamp the Total rating, as it is a non-persisted computed column,
-- ? but given that the values used in the original ratings are limited between 0 and 5, then the
-- ? calculation will automatically be within that range, so that helps with the Limitation

GO

PRINT 'Added Computed Total Property Review Rating column.';

GO

/* =====================================
=          User Review table           =
===================================== */

DROP TABLE IF EXISTS reviews.UserReview;

CREATE TABLE reviews.UserReview (

    /* Review ID and associated items
    ===================================== */

    ReviewId            bigint IDENTITY (1, 1) NOT NULL,
    -- ? The user being reviewed
    TargetId            bigint NOT NULL,
    -- ? The user making this review
    ReviewerId          bigint NOT NULL,
    -- ? The specific booking of the host's property linked with this review
    AssociatedBookingId bigint NOT NULL,

    /* Review Content
    ===================================== */

    ReviewTitle         nvarchar(100) NOT NULL,
    ReviewComment       nvarchar(500) NOT NULL,
    Rating              decimal(2, 1) NOT NULL,
    ReviewedOn          datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    /* Constraints
    ===================================== */

    -- ? Primary key constraint for the review ID
    CONSTRAINT PK_UserReviewId PRIMARY KEY CLUSTERED (ReviewId),

    -- ? Foreign key constraints for the property, reviewer, and booking IDs
    CONSTRAINT FK_UserReview_Target FOREIGN KEY (TargetId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_UserReview_Reviewer FOREIGN KEY (ReviewerId) REFERENCES users.UserAccount (UserId)
    ON UPDATE CASCADE,
    CONSTRAINT FK_UserReview_Booking FOREIGN KEY (AssociatedBookingId) REFERENCES reservations.PropertyBookings (BookingId),

    -- ? Unique constraint for the booking-user-target trio, ensuring a user can't rate a host for a same booking twice (they can edit),
    -- ? but that is frontend functionality. This constraint was not in the original plan, but it makes sense more now
    CONSTRAINT UQ_UserReview_Booking_Reviewer_Target UNIQUE (TargetId, ReviewerId, AssociatedBookingId),

    -- ? Checks the range and value of the rating
    CONSTRAINT CHK_Valid_UserReviewRating CHECK (
        -- ? Rating is between 0 and 5
        Rating >= 0
        AND Rating <= 5

        -- ? And the rating is divisible by half (either a whole number or half, like 2 or 2.5)
        AND Rating % 0.5 = 0
    ),

    -- ? Ensures no user is reviewing themselves
    CONSTRAINT CHK_Valid_UserReviewReviewerTarget CHECK (ReviewerId <> TargetId)
);

PRINT 'Created User Review table.';

GO

