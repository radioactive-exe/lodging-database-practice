/* =====================================
=   Test cases for individual tables   =
===================================== */

/* =====================================
=             User tables              =
===================================== */

/* User Account table
===================================== */

-- ? Gets the email and phone numbers of all host users, along with their hosting debut and tier, in order of tier

SELECT
    UserAccount.Email,
    UserAccount.PhoneNumber,
    UserAccount.HostingSince,
    UserTier.TierName
FROM users.UserAccount
INNER JOIN users.UserTier ON UserAccount.UserTier = UserTier.TierId
WHERE UserTier.IsHostTier = 1
ORDER BY UserAccount.UserTier ASC;

/* User Profile table
===================================== */

-- ? Gets the public UUIDs and full names of all users who have a Linkedin account connected to their Airbnb accounts

SELECT
    PublicUserUuid,
    (FirstName + ' ' + LastName) AS FullName
FROM users.UserProfile
WHERE LinkedinLink IS NOT NULL;

/* User Languages table
===================================== */

-- ? Gets the names of all users who speak french, english, and german

SELECT
    Languages.LangName,
    (UserProfile.FirstName + ' ' + UserProfile.LastName) AS FullName
FROM users.UserLanguages
INNER JOIN users.UserProfile ON UserLanguages.UserId = UserProfile.UserId
INNER JOIN users.Languages ON UserLanguages.LangId = Languages.LangId
WHERE Languages.LangName IN ('German', 'French', 'English')
ORDER BY UserLanguages.LangId;

/* User Tier table
===================================== */

-- ? Gets all customer tiers

SELECT UserTier.TierName
FROM users.UserTier
WHERE UserTier.IsHostTier = 0;

/* User Collections and their properties
===================================== */

-- ? Gets all collection names, creator names, and public state for collections that have one of the first 5 properties defined

SELECT
    UserCollections.CollectionName,
    (UserProfile.FirstName + ' ' + UserProfile.LastName) AS CollectionCreator,
    (CASE
        WHEN UserCollections.IsPublic = 1 THEN 'Public'
        ELSE 'Private'
    END)                                                 AS CollectionType
FROM users.UserCollections
INNER JOIN users.UserProfile ON UserCollections.CreatorId = UserProfile.UserId
WHERE UserCollections.CollectionId IN (
    SELECT PropertiesInCollections.CollectionId
    FROM users.PropertiesInCollections
    WHERE PropertiesInCollections.PropertyId BETWEEN 1 AND 5
);

/* User Billing data tables
===================================== */

-- ? Gets the address information for all addresses that have an associated card payment method

SELECT
    BA.AddressId,
    BA.AddressName,
    BA.AddressLine2,
    BA.AddressLine1,
    Country.CountryName,
    BA.PostalCode
FROM users.BillingAddress AS BA
INNER JOIN locations.Country
    ON BA.AddressCountry = Country.CountryId
WHERE EXISTS (
    SELECT * -- noqa: RF02
    FROM users.PaymentMethod AS PM
    WHERE
        PM.BillingAddress = BA.AddressId -- noqa: RF03
        AND PM.MethodType = 1
);

/* =====================================
=           Location tables            =
===================================== */
