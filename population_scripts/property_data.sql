-- ? Unneeded response of rows affected -- noqa: LT05
SET
    NOCOUNT ON;

/* =====================================
=   Filling out the Property Type LUT  =
===================================== */

-- ! This is another LUT that classifies properties into one of a few entirely holistic types
-- ! and as such, it is not possible to get 20 or more types without imposing on the territory
-- ! of the property category table, implemented later in the file.

INSERT INTO
properties.PropertyType (TypeName, TypeDescription)
VALUES

/* These are 7 property types
===================================== */

(
    'Apartment',
    'A residential unit of a shared living setup, such as a building or compound.'
),
(
    'House',
    'A standalone/separate residential unit that may be in a compound but stands separate architecturally.'
),
(
    'Unique Property',
    'A residential unit that has an unconventional type - a cave, tree-house, etc.'
),
(
    'Secondary Unit',
    'A residential unit that serves as an addendum/extension of another, wherein the other is not a bookable property, such as a guest house or a basement'
),
(
    'Commercial Establishment',
    'A residency unit that is part of a commercially-facing setup, such as hotels, hostels, resorts, etc.'
),
(
    'Mobile Property',
    'A property that has the capabilities to move and serve as mobile residency - this includes yachts, RVs, campers and so forth.'
),
(
    'Collective Property',
    'A group of residential units that are all collectively bookable.'
);

PRINT 'Populated Property Type LUT.';

/* =====================================
=    Filling out the Property Table    =
===================================== */

INSERT INTO
properties.Property (
    PropertyTypeId,
    HostId,
    PropertyName,
    PropertyDescription,
    NumOfSectors,
    PerNightCost,
    CleaningFeePerNight,
    ServiceFeePerNight,
    Coordinates,
    LocationId,
    AddressLine1,
    AddressLine2
)
VALUES

/* These are 30 properties
===================================== */

(
    6,
    2,
    'Roberts, Dicki and Kohler House',
    'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',
    4,
    2700.62,
    73.71,
    36.94,
    GEOGRAPHY::Point(16.06145, 44.81012, 4326),
    4.73,
    '241 Eggendart Crossing',
    '7th Floor'
),
(
    5,
    12,
    'Loria''s Valley',
    'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.',
    7,
    2658.82,
    20.81,
    91.04,
    GEOGRAPHY::Point(-6.9465, 113.8331, 4326),
    2.56,
    '29 Susan Road',
    'Room 375'
),
(
    2,
    12,
    'Lambert''s Apartment',
    'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',
    4,
    718.09,
    54.02,
    71.18,
    GEOGRAPHY::Point(56.4273888, 12.8477217, 4326),
    22.6,
    '153 Bluestem Point',
    'PO Box 80832'
),
(
    4,
    17,
    'Dayle''s Lodging',
    'Integer non velit.',
    6,
    1043.2,
    40.79,
    47.2,
    GEOGRAPHY::Point(36.58838, 38.29788, 4326),
    18.27,
    '13 Sage Trail',
    'Apt 148'
),
(
    1,
    14,
    'Tanny''s Apartment',
    'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',
    7,
    1462.74,
    76.5,
    50.63,
    GEOGRAPHY::Point(40.99259, 21.4208548, 4326),
    9.62,
    '1323 Petterle Plaza',
    '13th Floor'
),
(
    5,
    14,
    'Geater Cabin',
    'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.',
    1,
    2068.12,
    8.26,
    73.06,
    GEOGRAPHY::Point(52.2415583, 8.0495294, 4326),
    4.13,
    '058 Vahlen Trail',
    '5th Floor'
),
(
    4,
    21,
    'Marjorie''s House',
    'Nulla nisl.',
    4,
    1539.79,
    48.28,
    26.75,
    GEOGRAPHY::Point(-8.5571409, 116.6335548, 4326),
    18.32,
    '68293 Westport Point',
    'Room 850'
),
(
    2,
    13,
    'Joyner House',
    'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',
    7,
    847.44,
    22.17,
    80.03,
    GEOGRAPHY::Point(32.6938737, 51.6044276, 4326),
    7.94,
    '387 Atwood Trail',
    '17th Floor'
),
(
    2,
    2,
    'Katharina''s Studio',
    'Aliquam erat volutpat. In congue.',
    4,
    690.14,
    56.93,
    11.57,
    GEOGRAPHY::Point(9.315382, -82.157199, 4326),
    21.15,
    '8564 Anderson Crossing',
    'Apt 240'
),
(
    5,
    2,
    'Rutter''s Chalet',
    'Etiam pretium iaculis justo.',
    2,
    253.35,
    43.23,
    79.73,
    GEOGRAPHY::Point(36.276526, 109.351019, 4326),
    4.23,
    '47216 Lakewood Gardens Street',
    'Apt 1986'
),
(
    2,
    22,
    'Linkin Stay',
    'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.',
    6,
    2415.61,
    79.06,
    68.26,
    GEOGRAPHY::Point(-6.956164, 106.7714, 4326),
    5.97,
    '43 Cordelia Plaza',
    'Room 1071'
),
(
    4,
    1,
    'Chidzoy Hostel',
    'Aenean lectus.',
    4,
    342.12,
    44.33,
    96.59,
    GEOGRAPHY::Point(14.6688068, 121.1138058, 4326),
    13.86,
    '1 New Castle Terrace',
    'Room 1004'
),
(
    7,
    19,
    'Von Welldun Hostel',
    'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',
    5,
    169.46,
    54.21,
    17.17,
    GEOGRAPHY::Point(-43.1169327, -73.6138821, 4326),
    13.27,
    '1641 Moulton Plaza',
    'PO Box 16727'
),
(
    6,
    4,
    'Kenafaque Hostel',
    'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis.',
    6,
    1745.99,
    94.63,
    22.04,
    GEOGRAPHY::Point(6.14444, 125.70083, 4326),
    4.99,
    '08 Lakewood Crossing',
    'Apt 426'
),
(
    3,
    18,
    'Hellicar Apartment',
    'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',
    3,
    2335.02,
    60.75,
    46.32,
    GEOGRAPHY::Point(51.626324, 39.4129061, 4326),
    4.59,
    '73 Graedel Plaza',
    'PO Box 96203'
),
(
    7,
    19,
    'Ogger Bungalow',
    'Morbi non quam nec dui luctus rutrum.',
    6,
    2725.63,
    75.11,
    76.36,
    GEOGRAPHY::Point(8.1679082, 124.1582966, 4326),
    5.87,
    '7238 Kennedy Crossing',
    '2nd Floor'
),
(
    6,
    2,
    'Gather Stay',
    'Morbi non lectus.',
    6,
    2225.11,
    97.52,
    7.3,
    GEOGRAPHY::Point(56.9438063, 51.0642669, 4326),
    20.01,
    '61 Kinsman Center',
    '3rd Floor'
),
(
    6,
    24,
    'Greenfelder Group Condo',
    'Donec ut mauris eget massa tempor convallis.',
    7,
    190.09,
    64.62,
    96.13,
    GEOGRAPHY::Point(30.93902, 94.68908, 4326),
    3.66,
    '30 Pennsylvania Street',
    'Suite 68'
),
(
    2,
    19,
    'Paucek and Sons Studio',
    'Etiam justo.',
    4,
    486.96,
    49.0,
    62.25,
    GEOGRAPHY::Point(25.8025129, -100.2268529, 4326),
    14.2,
    '6246 Dawn Terrace',
    'Room 79'
),
(
    3,
    6,
    'Willi''s Condo',
    'In hac habitasse platea dictumst.',
    7,
    932.73,
    45.9,
    16.91,
    GEOGRAPHY::Point(-7.3619457, 107.9968408, 4326),
    1.44,
    '16123 Mitchell Parkway',
    'Room 1272'
),
(
    1,
    22,
    'Gusikowski, Boyer and Davis Home',
    'Vestibulum rutrum rutrum neque.',
    5,
    1002.47,
    53.18,
    95.25,
    GEOGRAPHY::Point(6.601838, 3.3514863, 4326),
    18.09,
    '3 Morning Circle',
    'Suite 20'
),
(
    3,
    19,
    'Bastable Bungalow',
    'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    4,
    2594.31,
    85.66,
    98.22,
    GEOGRAPHY::Point(52.43843, 17.77321, 4326),
    3.31,
    '816 Gulseth Center',
    '18th Floor'
),
(
    5,
    20,
    'Clint''s Cabin',
    'In est risus, auctor sed, tristique in, tempus sit amet, sem.',
    1,
    1594.3,
    67.57,
    48.72,
    GEOGRAPHY::Point(0.3158349, 102.1575544, 4326),
    16.87,
    '51 Leroy Road',
    'Suite 70'
),
(
    5,
    14,
    'Ibbott Resort',
    'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',
    5,
    1561.86,
    34.58,
    76.94,
    GEOGRAPHY::Point(43.35, 142.38333, 4326),
    17.27,
    '7 Springview Place',
    'PO Box 83095'
),
(
    3,
    4,
    'Linzy''s House',
    'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',
    4,
    501.14,
    19.24,
    65.87,
    GEOGRAPHY::Point(-6.7654881, 106.3011265, 4326),
    21.36,
    '81779 Village Green Pass',
    'Apt 161'
),
(
    6,
    5,
    'Salvatore''s Chalet',
    'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.',
    5,
    1976.88,
    67.49,
    38.82,
    GEOGRAPHY::Point(-7.8478439, -35.7570657, 4326),
    1.27,
    '47 Atwood Parkway',
    'PO Box 24737'
),
(
    4,
    1,
    'Trista''s Lodge',
    'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',
    3,
    2075.83,
    50.92,
    72.81,
    GEOGRAPHY::Point(-13.4932812, -71.7844893, 4326),
    12.38,
    '64422 Bayside Way',
    'Apt 1721'
),
(
    4,
    7,
    'Leinthall Studio',
    'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',
    3,
    2258.88,
    83.49,
    45.49,
    GEOGRAPHY::Point(57.6938555, 11.9704401, 4326),
    22.03,
    '814 Pankratz Place',
    'Suite 43'
),
(
    5,
    17,
    'Blonden Stay',
    'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',
    7,
    189.31,
    69.15,
    85.22,
    GEOGRAPHY::Point(30.780217, 120.644805, 4326),
    21.18,
    '53083 Kropf Plaza',
    'Suite 71'
),
(
    3,
    3,
    'Mariana''s Resort',
    'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',
    1,
    1157.78,
    26.31,
    36.7,
    GEOGRAPHY::Point(39.5791451, 47.5422138, 4326),
    5.07,
    '71 Carberry Park',
    'Suite 22'
);

PRINT 'Populated Property table.';

/* =====================================
=    Filling out the Sector Type LUT   =
===================================== */

-- ! While more sector types can be defined, it may introduce redundancies and overlaps in definitions or scopes
-- ! Since this is simply a LUT, these 8 sector types serve as a proof of concept and organisation.

INSERT INTO
properties.SectorType (TypeName, TypeDescription)
VALUES

/* These are 11 different sector types
===================================== */

(
    'Room',
    'A room, hall, or section of a larger house or apartment, where each room is individual but there is a larger shared space connected.'
),
(
    'Suite',
    'More often in connected or commercial settings, a larger multi-room residential unit, separate from the rest but still connected outwards.'
),
(
    'Floor',
    'One vertical level of a shared/larger bookable property, with or without doors and explicit separations.'
),
(
    'Apartment',
    'A separate single- or multi-level separation from a collective residential unit, or the sole sector in an apartment property'
),
(
    'Standalone single unit',
    'A full residential unit that stands alone from the rest, but still in a large collective bookable property, or the sole sector in a standalone property.'
),
(
    'Standalone connected unit',
    'A full residential unit that stands alone from the rest logistically, but may still be connected physically to others in a large collective bookable property.'
),
(
    'Addendum',
    'A section not considered a core part of the containing property, such as guest houses, attics, basements, etc.'
),
(
    'Outside Addendum',
    'Similar to an addendum, this is one that is physically outside of the main property, and can either be accessed from the outside or through the main property, including terraces, gardens, venues, etc.'
),
(
    'Shared',
    'A less specific sector of a shared booking, wherein multiple bookings can take place, and the whole space is shared.'
),
(
    'Standalone multiple units',
    'A collection of multiple residential units that functions as a single sector in booking, such as a group of tents, bungalows, etc.'
),
(
    'Studio',
    'Somewhere between a suit and a full apartment, a residential unit that has most if not all needed amenities in a compact format.'
);

PRINT 'Populated Sector Type LUT.';

/* ===================================================
= Filling out the Property-Sector relationship table =
================================================= = */

INSERT INTO
properties.PropertySectors (
    PropertyId,
    SectorTypeId,
    SectorName,
    SectorDescription,
    MinOccupants,
    MaxOccupants,
    NumOfBeds,
    NumOfBedrooms,
    NumOfBathrooms
)
VALUES

/* These are 80 sectors spread across the 30 properties
======================================================= */

(
    1,
    8,
    'Studio Bravo',
    'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',
    2,
    6,
    1,
    3,
    4
),
(
    2,
    2,
    'House Golf',
    'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.',
    2,
    0,
    2,
    1,
    5
),
(
    2,
    8,
    'Basement Golf',
    'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.',
    1,
    7,
    5,
    5,
    4
),
(
    3,
    5,
    'Floor Hotel',
    'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',
    1,
    7,
    1,
    2,
    1
),
(
    3,
    10,
    'Attic X-ray',
    'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.',
    2,
    6,
    1,
    4,
    1
),
(
    3,
    10,
    'Floor Yankee',
    'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio.',
    1,
    5,
    4,
    5,
    4
),
(
    4,
    4,
    'Room Quebec',
    'Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
    1,
    0,
    4,
    2,
    5
),
(
    4,
    10,
    'Studio Yankee',
    'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',
    1,
    7,
    4,
    4,
    1
),
(
    4,
    10,
    'Tent Victor',
    'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',
    2,
    7,
    5,
    3,
    2
),
(
    5,
    5,
    'Room Foxtrot',
    'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.',
    1,
    3,
    5,
    4,
    5
),
(
    5,
    5,
    'Room Victor',
    'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.',
    1,
    0,
    0,
    5,
    2
),
(
    6,
    1,
    'Tent Victor',
    'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',
    2,
    6,
    5,
    1,
    4
),
(
    6,
    9,
    'Attic India',
    'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.',
    1,
    4,
    0,
    5,
    2
),
(
    6,
    11,
    'House Echo',
    'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',
    2,
    7,
    5,
    3,
    2
),
(
    7,
    1,
    'Terrace Zulu',
    'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.',
    1,
    3,
    2,
    5,
    1
),
(
    7,
    3,
    'Floor Sierra',
    'Duis mattis egestas metus. Aenean fermentum.',
    1,
    4,
    3,
    4,
    1
),
(
    7,
    5,
    'Terrace Kilo',
    'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.',
    2,
    5,
    5,
    4,
    3
),
(
    7,
    6,
    'Floor Golf',
    'Vivamus tortor. Duis mattis egestas metus.',
    1,
    7,
    3,
    5,
    4
),
(
    7,
    6,
    'Tent Oscar',
    'Etiam vel augue. Vestibulum rutrum rutrum neque.',
    2,
    6,
    3,
    0,
    2
),
(
    8,
    7,
    'Studio Tango',
    'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',
    1,
    6,
    0,
    5,
    1
),
(
    8,
    8,
    'Basement Uniform',
    'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',
    2,
    7,
    0,
    2,
    1
),
(
    8,
    9,
    'Floor Alfa',
    'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.',
    2,
    0,
    5,
    0,
    3
),
(
    8,
    10,
    'Attic Charlie',
    'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',
    1,
    6,
    1,
    4,
    4
),
(
    8,
    10,
    'Section Zulu',
    'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',
    2,
    4,
    3,
    0,
    1
),
(
    8,
    11,
    'Attic X-ray',
    'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',
    2,
    6,
    1,
    1,
    2
),
(
    8,
    11,
    'House Romeo',
    'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
    1,
    7,
    4,
    3,
    2
),
(
    9,
    7,
    'Section Juliett',
    'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.',
    1,
    5,
    4,
    1,
    0
),
(
    10,
    6,
    'Suite Oscar',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.',
    2,
    6,
    0,
    0,
    2
),
(
    11,
    1,
    'Chalet Hotel',
    'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',
    2,
    4,
    0,
    5,
    1
),
(
    11,
    4,
    'Section Sierra',
    'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.',
    1,
    3,
    3,
    5,
    4
),
(
    12,
    7,
    'Tent Papa',
    'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',
    2,
    3,
    5,
    5,
    2
),
(
    13,
    3,
    'Floor Alfa',
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.',
    1,
    5,
    3,
    1,
    4
),
(
    13,
    8,
    'Tent Papa',
    'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.',
    2,
    3,
    4,
    1,
    5
),
(
    14,
    2,
    'Apartment Foxtrot',
    'Donec dapibus. Duis at velit eu est congue elementum.',
    2,
    7,
    4,
    4,
    0
),
(
    14,
    5,
    'Suite Sierra',
    'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi.',
    2,
    3,
    0,
    3,
    2
),
(
    14,
    7,
    'Basement India',
    'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',
    2,
    4,
    3,
    2,
    4
),
(
    14,
    7,
    'Suite Golf',
    'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.',
    1,
    4,
    2,
    1,
    3
),
(
    15,
    1,
    'Terrace Papa',
    'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',
    1,
    7,
    0,
    2,
    3
),
(
    16,
    2,
    'House Victor',
    'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.',
    1,
    0,
    4,
    0,
    3
),
(
    16,
    6,
    'Apartment Quebec',
    'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.',
    1,
    3,
    2,
    1,
    0
),
(
    17,
    7,
    'Bungalow Mike',
    'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',
    1,
    0,
    5,
    5,
    0
),
(
    18,
    4,
    'Attic Whiskey',
    'Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
    1,
    5,
    2,
    1,
    0
),
(
    18,
    9,
    'House Kilo',
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.',
    2,
    3,
    5,
    5,
    4
),
(
    18,
    11,
    'Floor India',
    'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',
    2,
    4,
    0,
    4,
    4
),
(
    19,
    7,
    'Floor Hotel',
    'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',
    1,
    0,
    2,
    3,
    1
),
(
    19,
    10,
    'Apartment Papa',
    'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',
    2,
    6,
    3,
    3,
    2
),
(
    20,
    3,
    'Basement Delta',
    'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',
    2,
    4,
    3,
    1,
    5
),
(
    20,
    3,
    'Room Kilo',
    'Proin risus. Praesent lectus.',
    1,
    4,
    1,
    1,
    1
),
(
    20,
    6,
    'Apartment Bravo',
    'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.',
    1,
    4,
    5,
    5,
    4
),
(
    20,
    8,
    'Tent Echo',
    'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.',
    2,
    4,
    1,
    4,
    4
),
(
    21,
    2,
    'House Sierra',
    'Suspendisse potenti. In eleifend quam a odio.',
    2,
    5,
    5,
    0,
    0
),
(
    21,
    2,
    'Section India',
    'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',
    2,
    6,
    4,
    1,
    5
),
(
    22,
    4,
    'Basement X-ray',
    'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',
    2,
    4,
    2,
    1,
    4
),
(
    22,
    8,
    'Basement Kilo',
    'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',
    2,
    4,
    2,
    2,
    4
),
(
    22,
    11,
    'Apartment Mike',
    'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.',
    1,
    3,
    0,
    3,
    2
),
(
    23,
    3,
    'Suite Foxtrot',
    'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio.',
    2,
    6,
    3,
    2,
    2
),
(
    23,
    4,
    'Apartment Lima',
    'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',
    2,
    6,
    1,
    5,
    5
),
(
    23,
    8,
    'Room Victor',
    'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',
    1,
    7,
    0,
    3,
    3
),
(
    23,
    10,
    'Suite Papa',
    'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
    1,
    4,
    0,
    4,
    5
),
(
    24,
    7,
    'Chalet Alfa',
    'Proin risus. Praesent lectus.',
    1,
    7,
    1,
    4,
    5
),
(
    25,
    5,
    'Section Zulu',
    'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',
    1,
    7,
    3,
    4,
    2
),
(
    25,
    10,
    'Studio India',
    'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.',
    1,
    6,
    4,
    4,
    3
),
(
    25,
    11,
    'Chalet Tango',
    'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.',
    2,
    4,
    1,
    5,
    4
),
(
    26,
    1,
    'Bungalow Yankee',
    'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',
    1,
    5,
    5,
    0,
    2
),
(
    26,
    1,
    'House Golf',
    'Nulla nisl. Nunc nisl.',
    2,
    4,
    5,
    2,
    4
),
(
    26,
    7,
    'Suite November',
    'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',
    2,
    3,
    1,
    0,
    0
),
(
    27,
    4,
    'Studio Whiskey',
    'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',
    2,
    5,
    5,
    2,
    3
),
(
    27,
    8,
    'Studio Foxtrot',
    'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',
    2,
    7,
    0,
    0,
    2
),
(
    27,
    10,
    'Studio Golf',
    'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',
    1,
    5,
    4,
    4,
    3
),
(
    27,
    11,
    'Chalet Zulu',
    'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.',
    1,
    3,
    4,
    4,
    0
),
(
    28,
    1,
    'Floor Zulu',
    'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.',
    2,
    3,
    3,
    4,
    3
),
(
    28,
    3,
    'Bungalow Hotel',
    'Proin eu mi. Nulla ac enim.',
    2,
    6,
    1,
    5,
    3
),
(
    28,
    3,
    'Section Echo',
    'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',
    1,
    3,
    2,
    2,
    1
),
(
    28,
    7,
    'Attic Lima',
    'Sed ante. Vivamus tortor. Duis mattis egestas metus.',
    2,
    5,
    3,
    1,
    0
),
(
    29,
    1,
    'Suite Uniform',
    'Suspendisse potenti. In eleifend quam a odio.',
    1,
    7,
    5,
    1,
    1
),
(
    29,
    6,
    'House X-ray',
    'Suspendisse potenti. Nullam porttitor lacus at turpis.',
    2,
    5,
    1,
    3,
    5
),
(
    30,
    3,
    'House X-ray',
    'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',
    1,
    0,
    3,
    1,
    4
),
(
    30,
    6,
    'Bungalow Victor',
    'Pellentesque ultrices mattis odio. Donec vitae nisi.',
    2,
    7,
    1,
    0,
    4
),
(
    30,
    6,
    'Terrace Echo',
    'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.',
    1,
    3,
    4,
    3,
    2
),
(
    30,
    7,
    'Studio Kilo',
    'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',
    1,
    0,
    3,
    3,
    0
);

PRINT 'Populated Assigned Property-Sector relationship table.';

/* =====================================
= Filling out the property media table =
===================================== */

INSERT INTO
properties.PropertyImages (
    PropertyId,
    ImageUrl,
    ImageIndex
)
VALUES

/* These are 100 images spread across the 30 properties
====================================================== */

-- ? I will not split these over several lines because they are readable, and so would waste hundreds of lines

(1, 'http://dummyimage.com/307x100.png/5fa2dd/ffffff', 0),
(1, 'http://dummyimage.com/476x100.png/ff4444/ffffff', 1),
(2, 'http://dummyimage.com/118x100.png/5fa2dd/ffffff', 0),
(2, 'http://dummyimage.com/226x100.png/5fa2dd/ffffff', 1),
(2, 'http://dummyimage.com/294x100.png/5fa2dd/ffffff', 2),
(3, 'http://dummyimage.com/101x100.png/ff4444/ffffff', 0),
(3, 'http://dummyimage.com/152x100.png/dddddd/000000', 1),
(3, 'http://dummyimage.com/356x100.png/dddddd/000000', 2),
(4, 'http://dummyimage.com/250x100.png/ff4444/ffffff', 0),
(4, 'http://dummyimage.com/281x100.png/cc0000/ffffff', 1),
(5, 'http://dummyimage.com/316x100.png/dddddd/000000', 0),
(5, 'http://dummyimage.com/316x100.png/ff4444/ffffff', 1),
(6, 'http://dummyimage.com/199x100.png/5fa2dd/ffffff', 0),
(6, 'http://dummyimage.com/205x100.png/cc0000/ffffff', 1),
(7, 'http://dummyimage.com/141x100.png/cc0000/ffffff', 0),
(7, 'http://dummyimage.com/167x100.png/cc0000/ffffff', 1),
(7, 'http://dummyimage.com/262x100.png/5fa2dd/ffffff', 2),
(7, 'http://dummyimage.com/304x100.png/cc0000/ffffff', 3),
(7, 'http://dummyimage.com/340x100.png/cc0000/ffffff', 4),
(7, 'http://dummyimage.com/378x100.png/dddddd/000000', 5),
(7, 'http://dummyimage.com/442x100.png/5fa2dd/ffffff', 6),
(8, 'http://dummyimage.com/109x100.png/cc0000/ffffff', 0),
(8, 'http://dummyimage.com/116x100.png/5fa2dd/ffffff', 1),
(8, 'http://dummyimage.com/254x100.png/cc0000/ffffff', 2),
(8, 'http://dummyimage.com/497x100.png/ff4444/ffffff', 3),
(9, 'http://dummyimage.com/118x100.png/cc0000/ffffff', 0),
(9, 'http://dummyimage.com/459x100.png/5fa2dd/ffffff', 1),
(9, 'http://dummyimage.com/474x100.png/ff4444/ffffff', 2),
(10, 'http://dummyimage.com/121x100.png/cc0000/ffffff', 0),
(10, 'http://dummyimage.com/264x100.png/cc0000/ffffff', 1),
(10, 'http://dummyimage.com/315x100.png/ff4444/ffffff', 2),
(10, 'http://dummyimage.com/393x100.png/dddddd/000000', 3),
(11, 'http://dummyimage.com/418x100.png/5fa2dd/ffffff', 0),
(12, 'http://dummyimage.com/296x100.png/dddddd/000000', 0),
(12, 'http://dummyimage.com/358x100.png/cc0000/ffffff', 1),
(12, 'http://dummyimage.com/498x100.png/dddddd/000000', 2),
(13, 'http://dummyimage.com/135x100.png/ff4444/ffffff', 0),
(13, 'http://dummyimage.com/239x100.png/cc0000/ffffff', 1),
(13, 'http://dummyimage.com/469x100.png/ff4444/ffffff', 2),
(14, 'http://dummyimage.com/161x100.png/ff4444/ffffff', 0),
(14, 'http://dummyimage.com/197x100.png/cc0000/ffffff', 1),
(14, 'http://dummyimage.com/340x100.png/dddddd/000000', 2),
(15, 'http://dummyimage.com/128x100.png/ff4444/ffffff', 0),
(15, 'http://dummyimage.com/151x100.png/dddddd/000000', 1),
(15, 'http://dummyimage.com/305x100.png/cc0000/ffffff', 2),
(15, 'http://dummyimage.com/382x100.png/dddddd/000000', 3),
(16, 'http://dummyimage.com/179x100.png/cc0000/ffffff', 0),
(16, 'http://dummyimage.com/249x100.png/ff4444/ffffff', 1),
(16, 'http://dummyimage.com/298x100.png/cc0000/ffffff', 2),
(16, 'http://dummyimage.com/348x100.png/dddddd/000000', 3),
(16, 'http://dummyimage.com/491x100.png/5fa2dd/ffffff', 4),
(17, 'http://dummyimage.com/299x100.png/ff4444/ffffff', 0),
(18, 'http://dummyimage.com/104x100.png/dddddd/000000', 0),
(18, 'http://dummyimage.com/180x100.png/dddddd/000000', 1),
(18, 'http://dummyimage.com/355x100.png/5fa2dd/ffffff', 2),
(18, 'http://dummyimage.com/443x100.png/cc0000/ffffff', 3),
(18, 'http://dummyimage.com/453x100.png/cc0000/ffffff', 4),
(18, 'http://dummyimage.com/476x100.png/dddddd/000000', 5),
(19, 'http://dummyimage.com/125x100.png/cc0000/ffffff', 0),
(19, 'http://dummyimage.com/147x100.png/dddddd/000000', 1),
(20, 'http://dummyimage.com/105x100.png/dddddd/000000', 0),
(21, 'http://dummyimage.com/220x100.png/cc0000/ffffff', 0),
(21, 'http://dummyimage.com/286x100.png/ff4444/ffffff', 1),
(21, 'http://dummyimage.com/437x100.png/cc0000/ffffff', 2),
(21, 'http://dummyimage.com/469x100.png/5fa2dd/ffffff', 3),
(21, 'http://dummyimage.com/498x100.png/ff4444/ffffff', 4),
(22, 'http://dummyimage.com/190x100.png/ff4444/ffffff', 0),
(22, 'http://dummyimage.com/195x100.png/ff4444/ffffff', 1),
(22, 'http://dummyimage.com/272x100.png/5fa2dd/ffffff', 2),
(22, 'http://dummyimage.com/272x100.png/cc0000/ffffff', 3),
(22, 'http://dummyimage.com/354x100.png/cc0000/ffffff', 4),
(23, 'http://dummyimage.com/117x100.png/5fa2dd/ffffff', 0),
(23, 'http://dummyimage.com/265x100.png/dddddd/000000', 1),
(23, 'http://dummyimage.com/270x100.png/cc0000/ffffff', 2),
(23, 'http://dummyimage.com/277x100.png/dddddd/000000', 3),
(23, 'http://dummyimage.com/422x100.png/cc0000/ffffff', 4),
(23, 'http://dummyimage.com/484x100.png/cc0000/ffffff', 5),
(24, 'http://dummyimage.com/118x100.png/5fa2dd/ffffff', 0),
(24, 'http://dummyimage.com/311x100.png/cc0000/ffffff', 1),
(24, 'http://dummyimage.com/320x100.png/5fa2dd/ffffff', 2),
(24, 'http://dummyimage.com/440x100.png/ff4444/ffffff', 3),
(24, 'http://dummyimage.com/467x100.png/cc0000/ffffff', 4),
(25, 'http://dummyimage.com/170x100.png/ff4444/ffffff', 0),
(25, 'http://dummyimage.com/274x100.png/dddddd/000000', 1),
(25, 'http://dummyimage.com/306x100.png/ff4444/ffffff', 2),
(25, 'http://dummyimage.com/333x100.png/cc0000/ffffff', 3),
(25, 'http://dummyimage.com/435x100.png/5fa2dd/ffffff', 4),
(25, 'http://dummyimage.com/439x100.png/5fa2dd/ffffff', 5),
(26, 'http://dummyimage.com/168x100.png/dddddd/000000', 0),
(26, 'http://dummyimage.com/174x100.png/5fa2dd/ffffff', 1),
(27, 'http://dummyimage.com/250x100.png/ff4444/ffffff', 0),
(27, 'http://dummyimage.com/385x100.png/cc0000/ffffff', 1),
(27, 'http://dummyimage.com/387x100.png/ff4444/ffffff', 2),
(27, 'http://dummyimage.com/417x100.png/5fa2dd/ffffff', 3),
(28, 'http://dummyimage.com/201x100.png/ff4444/ffffff', 0),
(28, 'http://dummyimage.com/324x100.png/ff4444/ffffff', 1),
(28, 'http://dummyimage.com/371x100.png/cc0000/ffffff', 2),
(29, 'http://dummyimage.com/399x100.png/dddddd/000000', 0),
(29, 'http://dummyimage.com/445x100.png/cc0000/ffffff', 1),
(30, 'http://dummyimage.com/101x100.png/cc0000/ffffff', 0);

PRINT 'Populated Property Images table.';

/* ======================================
= Filling out the Property Category LUT =
====================================== */

INSERT INTO
properties.PropertyCategory (
    CategoryName,
    CategoryDescription
)
VALUES

/* These are 35 different property categories
===================================== */

-- ? I will not split these over several lines because they are readable, and so would waste dozens of lines

-- ? Categories classifying Structure and Purpose

('Studio', 'Single-room property with all or most basic facilities in compact form.'),
('Loft', 'Open-concept urban unit with high ceilings.'),
('Penthouse', 'Premium luxurious top-floor(s) unit.'),
('Multiplex', 'Multi-story residential unit (duplex, triplex, etc.), or single residential buildings split into multiple distinct sectors.'),
('Chalet', 'Wooden or cozy residential unit built for vacations, either in the snow or by the water.'),
('Cottage', 'Small and cozy traditional home, often in the countryside or rural nature.'),
('Villa', 'Larger distinct/separate estate with private lands, often luxurious or with gardens and entertainment space.'),
('Mansion', 'Elite, sprawling luxury estate built on a massive scale.'),
('Hotel Room', 'Private room managed within a commercial hotel.'),
('Hotel Suite', 'Upscale commercial hotel unit, often multiple interconnected/distinct rooms.'),
('Hostel Dorm', 'Shared community space with multiple beds for budget travelers.'),
('Treehouse', 'Raised wooden structure on or around large trees, often small and cozy.'),
('Guesthouse / ADU', 'Detached independent secondary residential unit built on a primary residential unit''s estate.'),
('Basement', 'Self-contained apartment or room built into the lower level of a primary home.'),
('Houseboat', 'Docked or navigable water vessel designed for living on the water.'),
('Campervan / RV', 'Motorized vehicle or towable trailer with living quarters.'),
('Co-Living Space', 'Private room within a residential unit sharing communal lounges, kitchens, and/or other facilities.'),

-- ? Categories classifying Geographic Settings

('Beachfront', 'Property with direct access onto a beach, including piers.'),
('Lakefront', 'Property with direct access onto the edge of a lake or pond, including a dock.'),
('Resort Bungalow', 'Standalone single-story holiday cabin inside a commercial resort.'),
('Mountain View', 'Property high in mountain ranges with peak views.'),
('Desert Oasis', 'Remote property located in arid climates with desert landscapes.'),
('Urban Residence', 'Property located inside dense, walkable hearts of cities.'),
('Countryside', 'Property surrounded by fields, forests, farmland, or other natural landscapes.'),
('Eco-Village Cabin', 'Sustainable cabin inside an environmentally conscious commune.'),

-- ? Categories classifying Design Themes and Significance

('Tiny Home', 'Highly compact, self-containing home under 40 square metres.'),
('Dome', 'Spherical structure featuring geometric paneling with natural light and skylights.'),
('Historical / Heritage', 'Property in historical registries or with cultural significance.'),
('Castle / Fort', 'Historic, fortified stone and/or wooden structure with antique and cultural novelty.'),
('Design Marvel', 'Property showcasing unique and world-class interior architecture and design.'),
('Vineyard-Adjacent', 'Residence located at or near operational wineries.'),
('Eco-Friendly', 'Off-grid residence, solar-powered, or certified as carbon-neutral.'),

-- ? Categories classifying related Experiential Activities

('Ski-In / Ski-Out', 'Property where guests can ski directly to and from the entrance(s).'),
('Golfing', 'Property located inside or bordering a professional golf course.'),
('Surfing', 'Property situated at famous a surf break or appropriate coastline.');

PRINT 'Populated Property Category LUT.';

/* ==============================================================
= Filling out the assigned Property Category relationship table =
============================================================== */

INSERT INTO
properties.AssignedPropertyCategories (
    PropertyId,
    CategoryId
)
VALUES

/* These are 60 instances of a category assigned to a property.
============================================================== */

-- ? Each property can have multiple categories
-- ! Because these were generated randomly with Mockaroo, some categories may not make
-- ! perfect sense with each other or may even contradict each other, but this is a PoC

(1, 26),
(1, 32),
(3, 13),
(3, 14),
(3, 26),
(3, 27),
(3, 32),
(4, 16),
(4, 27),
(4, 30),
(5, 8),
(6, 6),
(7, 2),
(7, 8),
(7, 21),
(7, 22),
(8, 23),
(9, 20),
(9, 22),
(10, 6),
(10, 13),
(11, 26),
(12, 9),
(12, 31),
(13, 12),
(13, 19),
(13, 35),
(14, 11),
(16, 1),
(17, 12),
(17, 13),
(18, 3),
(18, 10),
(18, 24),
(19, 24),
(19, 30),
(20, 2),
(20, 5),
(20, 31),
(20, 34),
(21, 5),
(21, 8),
(21, 25),
(22, 22),
(23, 7),
(23, 11),
(23, 17),
(25, 6),
(25, 8),
(25, 16),
(25, 35),
(26, 23),
(27, 1),
(27, 21),
(27, 32),
(28, 1),
(28, 35),
(30, 14),
(30, 16),
(30, 32);

PRINT 'Populated Assigned Property-Category relationship table.';

/* ============================================
= Filling out the Property Attribute Type LUT =
============================================ */

INSERT INTO
properties.AttributeType (
    TypeName,
    TypeDescription
)
VALUES

/* These are 8 primary attribute types
====================================== */

(
    'Standard Amenity',
    'Tangible, physical items (or wireless services) located inside or on the property available for guest use (e.g., Free Wi-Fi, Balcony/Terrace, Parking, etc.).'
),
(
    'Safety and Security',
    'Emergency hardware, compliance technology, and security systems protecting the property (e.g., Smoke Detector, CCTV Cameras, Silent Alarm, Keyed Gate, etc.).'
),
(
    'Logistics and Service',
    'Operational services or assistance included by the host with the booking/property (e.g., 24/7 Check-in, Self Check-in, Airport Shuttle, Nearby Location Shuttle, etc.).'
),
(
    'Rule and Restriction',
    'Behavioral, valid, and operational policies governing guest conduct during bookings (e.g., No Smoking, Pets Allowed, Quiet Nights Required, etc.).'
),
(
    'Accessibility and Structure',
    'Physical architectural modifications or layout properties accommodating mobility needs (e.g., Step-free Entrance, Lift Inside Property, Fitted With Grab Bars, etc.).'
),
(
    'Surrounding Area and Environment',
    'External spatial, atmospheric, or geographic traits defined by the property''s location (e.g., High Street Noise, Windy Weather, Great View, Beach Access, etc.).'
),
(
    'Platform Status Attribute',
    'System-calculated, algorithmically awarded badges based on defined systematic criteria (e.g., Guest Favorite, High Turnover, Long Term Booking, etc.).'
),
(
    'User Opinion-Defined Attribute',
    'Subjective community feedback attributes generated or attributed based on guest feedback and ratings (e.g., Hospitable Service, Clean Property, etc.).'
);

PRINT 'Populated Property Attribute Type LUT';

/* =======================================
= Filling out the Property Attribute LUT =
======================================= */

INSERT INTO
properties.PropertyAttribute (
    AttributeTypeId,
    AttributeName,
    AttributeDescription,
    IsUserBased
)
VALUES

/* These are 26 attributes of the 8 above types
================================================= */

-- ? I will not spread these across multiple lines because they are readable and would waste many lines

/* Standard Amenities
================================================= */

(1, 'Free Wi-Fi', 'Free wireless internet connection included with the property for bookers.', 0),
(1, 'Balcony/Terrace', 'An external/outdoors platform or seating area connected to the main property.', 0),
(1, 'Parking', 'A lot or spot belonging to or surrounding/near the property to park vehicles.', 0),

/* Safety and Security attributes
================================================= */

(2, 'Smoke Detector', 'A fitted smoke or fire detector with or without relevant alarms or sprinklers.', 0),
(2, 'CCTV Cameras', 'Security cameras monitoring the property and/or its premises.', 0),
(2, 'Silent Alarm', 'A fitted security system that rings local authorities silently in case of a breakin or emergency.', 0),
(2, 'Keyed Gate', 'A fence or wall surrounding the property with an entrance requiring a specific metal or technological key to open.', 0),

/* Logistics and Service attributes
================================================= */

(3, '24/7 Check-in', 'The ability to check in at any time, accounting for late arrivals and travel times.', 0),
(3, 'Self Check-in', 'The ability to check in immediately upon arrival, not requiring the host or a keyholder to be present.', 0),
(3, 'Airport Shuttle', 'Shuttle buses to and from the nearby airport(s) for booker convenience.', 0),
(3, 'Nearby Location Shuttle', 'Shuttle buses to and from nearby hotspots and locations like downtown or market districts.', 0),

/* Rules and Restriction attributes
================================================= */

(4, 'No Smoking', 'Smoking disallowed on or within the premises of the property.', 0),
(4, 'Pets Allowed', 'Bookers and guests are allowed to bring pets with them on/inside the property.', 0),
(4, 'Quiet Nights Required', 'Low volume requirements during night-time hours for adjacent or nearby residents.', 0),

/* Accessibility and Structure attributes
================================================= */

(5, 'Step-free Entrance', 'Entrance either at the same level as the floor leading to it, or fitted with ramps or accessible ways of entry.', 0),
(5, 'Lift Inside Property', 'Fitted with an elevator/lift within the property to move between floors or to and from the property', 0),
(5, 'Fitted With Grab Bars', 'Walls around the property fitted with grab bars and railings for accessibility.', 0),

/* Surrounding Area and Environmental attributes
================================================= */

(6, 'High Street Noise', 'A loud/busy surrounding and neighbouring area to the property, to be accounted for.', 0),
(6, 'Windy Weather', 'Windy and breezy weather in or at the property, due to climate or neighbouring architecture.', 0),
(6, 'Great View', 'Notable view from or facing the property, including natural, urban, or other scenery.', 0),
(6, 'Beach Access', 'Walking distance or direct access between the property and the beach.', 0),

/* Platform Status attributes
===================================== */

(7, 'Long Term Booking', 'A preference to book for long-term stays and bookings, as opposed to short term.', 0),
(7, 'Guest Favorite', 'A property with consistent booking and high customer ratings.', 1),
(7, 'High Turnover', 'Continuous bookings and high-traffic short-term reservations.', 1),

/* User Opinion-Defined attributes
===================================== */

(8, 'Hospitable Service', 'Hospitable and welcoming treatment by the host or any relevant assisting individuals.', 1),
(8, 'Clean Property', 'Well-reviewed property for cleanliness, hygiene, and organisation.', 1);

PRINT 'Populated Property Attribute Type LUT.';

/* ===============================================================
= Filling out the assigned property-attribute relationship table =
=============================================================== */

INSERT INTO
properties.AssignedPropertyAttributes (
    PropertyId,
    AttributeId,
    IsNotable
)
VALUES

/* These are 100 attribute-property assignments
=============================================== */

-- ? While some combinations of attributes here may not make complete sense, or the notability/lack of,
-- ? this data was generated randomly for the concept, not logic.

(1, 1, 1),
(1, 3, 0),
(1, 6, 0),
(1, 7, 1),
(1, 17, 0),
(1, 18, 0),
(2, 7, 1),
(2, 16, 1),
(2, 26, 1),
(3, 5, 1),
(3, 11, 1),
(3, 22, 1),
(4, 8, 0),
(4, 23, 1),
(5, 7, 1),
(5, 14, 1),
(5, 25, 1),
(6, 6, 1),
(6, 20, 0),
(7, 3, 0),
(7, 4, 0),
(7, 6, 1),
(7, 17, 0),
(7, 19, 1),
(7, 20, 0),
(7, 24, 1),
(7, 25, 1),
(7, 26, 1),
(8, 6, 1),
(8, 24, 1),
(8, 25, 1),
(9, 2, 1),
(9, 4, 0),
(9, 6, 0),
(9, 13, 1),
(9, 17, 0),
(9, 26, 1),
(10, 14, 0),
(10, 17, 0),
(10, 24, 1),
(10, 26, 1),
(11, 3, 1),
(11, 9, 1),
(11, 11, 1),
(11, 18, 1),
(11, 19, 1),
(12, 9, 1),
(12, 14, 0),
(12, 15, 0),
(12, 16, 1),
(12, 17, 1),
(12, 23, 1),
(12, 25, 1),
(13, 1, 0),
(13, 4, 1),
(13, 11, 0),
(13, 12, 0),
(13, 24, 1),
(14, 12, 1),
(14, 17, 0),
(15, 14, 0),
(15, 19, 1),
(16, 20, 1),
(17, 4, 0),
(17, 6, 0),
(17, 9, 1),
(17, 22, 0),
(18, 2, 0),
(18, 18, 1),
(18, 21, 0),
(19, 6, 0),
(19, 13, 0),
(20, 10, 1),
(21, 11, 1),
(21, 17, 0),
(22, 23, 1),
(23, 5, 1),
(23, 21, 0),
(24, 2, 0),
(24, 19, 0),
(24, 23, 1),
(24, 26, 1),
(25, 11, 1),
(25, 18, 1),
(25, 22, 0),
(25, 24, 1),
(25, 25, 1),
(25, 26, 1),
(26, 1, 0),
(26, 3, 0),
(27, 4, 0),
(27, 16, 0),
(27, 18, 1),
(28, 1, 1),
(28, 6, 0),
(28, 15, 1),
(28, 18, 1),
(28, 25, 1),
(29, 5, 0),
(29, 16, 1);

PRINT 'Populated Assigned Property-Attribute relationship table.';
