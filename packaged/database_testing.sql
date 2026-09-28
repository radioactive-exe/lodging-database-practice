-- ? Ensure we are testing the Lodging database
USE [Lodging];

/* =====================================
=   Test cases for individual tables   =
===================================== */

/* =====================================
=             User tables              =
===================================== */

/* User Account table
===================================== */

-- ? Gets the email and phone numbers of all host users, along with their hosting
-- ? debut and tier, in order of tier

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

-- ? Gets the public UUIDs and full names of all users who have a Linkedin account
-- ? connected to their Lodging accounts

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

-- ? Gets all collection names, creator names, and public state for collections that
-- ? have one of the first 5 properties defined

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

-- ? Gets the address information for all addresses that have an associated card
-- ? payment method

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
        PM.BillingAddress = BA.AddressId -- noqa
        AND PM.MethodType = 1
);

/* =====================================
=           Location tables            =
===================================== */

-- ? Gets the full location information about locations in the Mediterranean

SELECT
    Location.LocationName,
    Area.AreaName,
    Country.CountryName,
    Region.RegionName
FROM locations.Location
INNER JOIN locations.Area ON Location.AreaId = Area.AreaId
INNER JOIN locations.Country ON Area.CountryId = Country.CountryId
INNER JOIN locations.Region ON Country.RegionId = Region.RegionId
WHERE Region.RegionName = 'Mediterranean';

/* =====================================
=           Property tables            =
===================================== */

/* Property table
===================================== */

-- ? Gets the costs of all properties with 2 to 4 sub-bookable sectors

SELECT
    PropertyId,
    PropertyName,
    NumOfSectors,
    PerNightCost,
    ServiceFeePerNight,
    CleaningFeePerNight,
    (PerNightCost + ServiceFeePerNight + CleaningFeePerNight) AS TotalCostPerNight
FROM properties.Property
WHERE NumOfSectors BETWEEN 2 AND 4
ORDER BY NumOfSectors ASC;

/* Property Images table
===================================== */

-- ? Gets the number of images uploaded for each property

SELECT
    Property.PropertyId,
    Property.PropertyName,
    COUNT(*) AS NumOfImages
FROM properties.PropertyImages
INNER JOIN properties.Property ON PropertyImages.PropertyId = Property.PropertyId
GROUP BY Property.PropertyId, Property.PropertyName;

/* Property types
===================================== */

-- ? Gets all mobile properties currently available

SELECT
    PropertyId,
    PropertyName
FROM properties.Property
WHERE PropertyTypeId = (
    SELECT TOP 1 PropertyType.TypeId
    FROM properties.PropertyType
    WHERE PropertyType.TypeName = 'Mobile Property'
);

/* Property Sector tables
===================================== */

-- ? Gets the number of properties that have at least one sector of each type,
-- ? and the average minimum and maximum occupant counts

SELECT
    SectorType.TypeName,
    CAST(AVG(CAST(PropertySectors.MinOccupants AS decimal(5, 2))) AS decimal(5, 2)) AS AverageMinOccupants,
    CAST(AVG(CAST(PropertySectors.MaxOccupants AS decimal(5, 2))) AS decimal(5, 2)) AS AverageMaxOccupants,
    COUNT(DISTINCT PropertySectors.PropertyId)                                      AS NumOfProperties
FROM properties.PropertySectors
INNER JOIN properties.SectorType ON PropertySectors.SectorTypeId = SectorType.TypeId
GROUP BY (SectorType.TypeName);

/* Property category tables
======================================== */

-- ? Gets the number of times a category was assigned and orders the categories by
-- ? quantity

SELECT
    PropertyCategory.CategoryName,
    COUNT(DISTINCT APC.PropertyId) AS NumOfProperties
FROM properties.PropertyCategory
LEFT JOIN properties.AssignedPropertyCategories AS APC ON PropertyCategory.CategoryId = APC.CategoryId
GROUP BY (PropertyCategory.CategoryName)
ORDER BY NumOfProperties DESC;

/* Property attribute tables
===================================== */

-- ? Gets and ranks properties by the number of notable attributes they have as well
-- ? as by the number of amenities

SELECT
    APA.PropertyId,
    SUM(CAST(APA.IsNotable AS tinyint))                                      AS NumOfNotableAttributes,
    SUM(CASE WHEN AttributeType.TypeName LIKE '%Amenity%' THEN 1 ELSE 0 END) AS NumOfAmenities
FROM properties.AssignedPropertyAttributes AS APA
INNER JOIN properties.PropertyAttribute ON APA.AttributeId = PropertyAttribute.AttributeId
INNER JOIN properties.AttributeType ON PropertyAttribute.AttributeTypeId = AttributeType.TypeId
GROUP BY APA.PropertyId
ORDER BY NumOfNotableAttributes DESC, NumOfAmenities DESC;

/* ======================================
=            Booking tables             =
====================================== */

/* Bookings and statuses
===================================== */

-- ? Gets all financial information for bookings that are currently in progress

SELECT
    PB.BookingId,
    PB.BasePricePerNight,
    PB.AppliedFinancialModifier,
    PB.CleaningFeePerNight,
    PB.ServiceFeePerNight,
    PB.TotalPricePerNight,
    PB.TotalBookingCost,
    DATEDIFF(DAY, PB.StartDate, PB.EndDate) AS BookingLength
FROM reservations.PropertyBookings AS PB
INNER JOIN reservations.BookingStatus ON PB.BookingStatusId = BookingStatus.StatusId
WHERE BookingStatus.StatusName LIKE '%In Progress%';

/* Booking guest tables
===================================== */

-- ? Gets the total number of guests of all types per booking

SELECT
    BookingGuests.BookingId,
    SUM(BookingGuests.Quantity) AS TotalGuests
FROM reservations.BookingGuests
GROUP BY BookingGuests.BookingId;

/* Payments and statuses
===================================== */

-- ? Gets basic data about all refunds and their current statuses

SELECT
    Payments.PaymentId,
    PaymentStatus.StatusName,
    Payments.PayerId,
    Payments.PayeeId,
    Payments.PaidAmount,
    Payments.PaidOn,
    Payments.AssocBookingId
FROM reservations.Payments
INNER JOIN reservations.PaymentPurpose ON Payments.PaymentPurposeId = PaymentPurpose.PurposeId
INNER JOIN reservations.PaymentStatus ON Payments.PaymentStatusId = PaymentStatus.StatusId
WHERE PaymentPurpose.PurposeName LIKE '%Refund%'
ORDER BY PaymentStatus.StatusId;

/* =====================================
=            Review tables             =
===================================== */

/* Property review tables
===================================== */

-- ? Gets the the average ratings for all properties across their bookings, and the number of
-- ? reviews for each property

SELECT
    Property.PropertyId,
    CAST(AVG(PropertyReview.TotalRating) AS decimal(3, 2)) AS AverageBookingRating,
    COUNT(PropertyReview.ReviewId)                         AS NumOfReviews
FROM properties.Property
INNER JOIN reservations.PropertyBookings ON Property.PropertyId = PropertyBookings.PropertyId
INNER JOIN reviews.PropertyReview ON PropertyBookings.BookingId = PropertyReview.AssociatedBookingId
WHERE
    PropertyReview.ReviewId IN (
        SELECT CriteriaRatings.ReviewId
        FROM reviews.CriteriaRatings
    )
GROUP BY Property.PropertyId
ORDER BY NumOfReviews DESC, AverageBookingRating DESC;

/* User review table
===================================== */

-- ? Gets the total number of times each user has been reviewed (with their name),
-- ? and the average rating

SELECT
    UserProfile.UserId,
    CAST(AVG(UserReview.Rating) AS decimal(3, 2))        AS AverageRating,
    (UserProfile.FirstName + ' ' + UserProfile.LastName) AS FullName,
    COUNT(UserReview.Rating)                             AS NumOfReviews
FROM reviews.UserReview
INNER JOIN users.UserProfile ON UserReview.TargetId = UserProfile.UserId
GROUP BY (UserProfile.FirstName + ' ' + UserProfile.LastName), UserProfile.UserId
ORDER BY NumOfReviews DESC;

/* ========= End of Individual/Few table tests ========= */

/* ======================================
=       Large scale system tests        =
====================================== */

-- ? Gets the names of collections and their creators where the creator has added at
-- ? least one of the properties in it, AND when the properties they have added have
-- ? reviews (aka > 0* with our small dataset)

WITH
    PropertiesAndAverageRatings AS (
        SELECT
            PropertyBookings.PropertyId,
            AVG(PropertyReview.TotalRating) AS AverageRating
        FROM reservations.PropertyBookings
        INNER JOIN reviews.PropertyReview ON PropertyBookings.BookingId = PropertyReview.AssociatedBookingId
        GROUP BY PropertyBookings.PropertyId
    )

SELECT
    UserCollections.CollectionId,
    UserCollections.CollectionName,
    SUM(
        CASE
            WHEN (PIC.AddedBy = UserCollections.CreatorId) THEN 1
            ELSE 0
        END
    )                                AS NumOfPropertiesAddedByCreator,
    COUNT(DISTINCT PIC.CollectionId) AS CollectionSize
FROM
    users.UserCollections
INNER JOIN users.PropertiesInCollections AS PIC ON UserCollections.CollectionId = PIC.CollectionId
INNER JOIN users.UserProfile ON UserCollections.CreatorId = UserProfile.UserId
INNER JOIN PropertiesAndAverageRatings AS PAARs ON PIC.PropertyId = PAARs.PropertyId
GROUP BY UserCollections.CollectionId, UserCollections.CollectionName, PAARs.AverageRating
HAVING (
    SUM(
        CASE
            WHEN (PIC.AddedBy = UserCollections.CreatorId) THEN 1
            ELSE 0
        END
    ) > 0
) AND (
    PAARs.AverageRating > 0
);

-- ? Gets the total number of collections and the total number of distinct properties
-- ? saved in all of them for each user, as well as the number of properties they
-- ? host and the compiled minimum and maximum guest counts for them

WITH
    HostsAndPropertyCount AS (
        SELECT
            UserAccount.UserId                    AS HostId,
            ISNULL(COUNT(Property.PropertyId), 0) AS PropertyCount
        FROM
            users.UserAccount
        LEFT JOIN properties.Property ON UserAccount.UserId = Property.HostId
        GROUP BY UserAccount.UserId
    ),

    HostsAndMinMaxOcc AS (
        SELECT
            UserAccount.UserId,
            SUM(PropertySectors.MinOccupants) AS CompiledMinOccupants,
            SUM(PropertySectors.MaxOccupants) AS CompiledMaxOccupants
        FROM users.UserAccount
        LEFT JOIN properties.Property ON UserAccount.UserId = Property.HostId
        LEFT JOIN properties.PropertySectors ON Property.PropertyId = PropertySectors.PropertyId
        GROUP BY UserAccount.UserId
    )

SELECT
    UserAccount.UserId,
    HostsAndPropertyCount.PropertyCount,
    HostsAndMinMaxOcc.CompiledMinOccupants,
    HostsAndMinMaxOcc.CompiledMaxOccupants,
    COUNT(UserCollections.CollectionId)                AS NumOfCollections,
    COUNT(DISTINCT PropertiesInCollections.PropertyId) AS NumOfSavedProperties
FROM users.UserAccount
INNER JOIN users.UserCollections ON UserAccount.UserId = UserCollections.CreatorId
INNER JOIN users.PropertiesInCollections ON UserCollections.CollectionId = PropertiesInCollections.CollectionId
INNER JOIN HostsAndPropertyCount ON UserAccount.UserId = HostsAndPropertyCount.HostId
INNER JOIN HostsAndMinMaxOcc ON UserAccount.UserId = HostsAndMinMaxOcc.UserId
GROUP BY UserAccount.UserId, HostsAndPropertyCount.PropertyCount, HostsAndMinMaxOcc.CompiledMinOccupants, HostsAndMinMaxOcc.CompiledMaxOccupants
ORDER BY UserAccount.UserId;

-- ? Ranks hosts by the number of cross-country bookings, the number of countries
-- ? these cross-country bookings came from, the number of reviews received by these
-- ? cross country bookings, the number of reviews above the average database rating

WITH
    AverageRating AS (
        SELECT AVG(TotalRating) AS AverageRating
        FROM reviews.PropertyReview
        WHERE TotalRating > 0
    ),

    CrossCountryBookings AS (
        SELECT
            PropertyBookings.BookingId,
            PropertyBookings.BookerId AS CustomerId,
            Property.HostId,
            Customer.UserCountry      AS CustomerCountry,
            Host.UserCountry          AS HostCountry
        FROM reservations.PropertyBookings
        INNER JOIN properties.Property ON PropertyBookings.PropertyId = Property.PropertyId
        INNER JOIN users.UserAccount AS Host ON Property.HostId = Host.UserId
        INNER JOIN users.UserAccount AS Customer ON PropertyBookings.BookerId = Customer.UserId
        WHERE Customer.UserCountry <> Host.UserCountry
    ),

    CCBookingReviews AS (
        SELECT
            CCBooks.BookingId,
            PropertyReview.ReviewId,
            PropertyReview.TotalRating,
            (IIF(PropertyReview.TotalRating >= (SELECT TOP 1 AverageRating.AverageRating FROM AverageRating), 1, 0)) AS IsAboveAverage
        FROM CrossCountryBookings AS CCBooks
        INNER JOIN reviews.PropertyReview ON CCBooks.BookingId = PropertyReview.AssociatedBookingId
    )

SELECT
    CCBookings.HostId,
    (
        UserProfile.FirstName
        + ' '
        + UserProfile.LastName
    )                                          AS HostName,
    COUNT(DISTINCT CCBookings.BookingId)       AS NumOfCCBookings,
    COUNT(DISTINCT CCBookings.CustomerCountry) AS DistinctCCBookingOrigins,
    COUNT(DISTINCT CCReviews.ReviewId)         AS NumOfCCReviews,
    SUM(ISNULL(CCReviews.IsAboveAverage, 0))   AS NumOfAboveAverageCCRatings
FROM CrossCountryBookings AS CCBookings
LEFT JOIN CCBookingReviews AS CCReviews ON CCBookings.BookingId = CCReviews.BookingId
INNER JOIN users.UserProfile ON CCBookings.HostId = UserProfile.UserId
GROUP BY CCBookings.HostId, UserProfile.FirstName, UserProfile.LastName
ORDER BY DistinctCCBookingOrigins DESC, NumOfCCBookings DESC, NumOfCCReviews DESC, NumOfAboveAverageCCRatings DESC;
