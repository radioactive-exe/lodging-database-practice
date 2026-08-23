-- ? Unneeded response of rows affected
SET NOCOUNT ON;

/* =====================================
=    Filling out the Regions table     =
===================================== */

-- ? These fill out with generated IDs from 1 to 12
-- ! Unfortunately, I tried to spread out regions more, but I cannot divide the world
-- ! into 20+ regions without redundancy
INSERT INTO locations.Region (RegionName, RegionDesc) VALUES
('Caribbean & Bahamas', 'Tropical island destinations.'),
('Mediterranean', 'European, Levantine, and North African climates and cuisines.'),
('Southeast Asia', 'Tropical islands and cultural heritage sites.'),
('Middle East & Gulf', 'Deserts, oases, cultured mega cities, and ancient ruins.'),
('Polynesia & South Pacific', 'Remote islands, ceremonies, and bungalows.'),
('Central America', 'Eco-tourism hotspots, dense rainforests, Mayan ruins, and surf coasts.'),
('South America', 'Diverse landscapes, with forests, mountains, and the Amazon.'),
('North America', 'Metropolitan tourism hubs, national parks, and snowy getaways.'),
('East Asia', 'High-tech city skylines with temples and mountains.'),
('Sub-Saharan Africa', 'Safaris, wildlife reserves, and nature lodges.'),
('Oceania', 'Adventure and wildlife, wine, and scenic coasts.'),
('Nordics & Arctic', 'Winter wonderlands, Aurora Borealis, and beautiful landscapes.');

PRINT 'Populated the Region LUT.';

/* =====================================
=    Filling out the Country table     =
===================================== */

-- ? These fill out with generated IDs from 1 to 21
INSERT INTO locations.Country (CountryName, RegionId) VALUES
-- ? Filled into the Caribbean, with IDs from 1 to 3
('Jamaica', 1),
('Bahamas', 1),
('Aruba', 1),

-- ? Filled into the Mediterranean, with IDs from 4 to 7
('Greece', 2),
('Italy', 2),
('Lebanon', 2),
('Egypt', 2),

-- ? Filled into Southeast Asia, with IDs from 8 to 10
('Thailand', 3),
('Indonesia', 3),
('Vietnam', 3),

-- ? Filled into the Middle East & Gulf, with IDs 11 and 12
('United Arab Emirates', 4),
('Jordan', 4),

-- ? Filled into Polynesia & South Pacific, with IDs 13 and 14
('Fiji', 5),
('French Polynesia', 5),

-- ? Filled into Central America, with ID 15
('Costa Rica', 6),

-- ? Filled into South America with ID 16
('Peru', 7),

-- ? Filled into North America, with IDs 17 to 19
('United States', 8),
('Canada', 8),
('Mexico', 8),

-- ? Filled into East Asia, with IDs 20 and 21
('Japan', 9),
('South Korea', 9);

PRINT 'Populated the Country LUT.'

/* =====================================
=      Filling out the Area table      =
===================================== */

-- ? These fill out with generated IDs from 1 to 23
INSERT INTO locations.Area (CountryId, AreaName, AreaDesc) VALUES
-- ? Filled into the United States, with IDs from 1 to 4
(17, 'Hawaii', 'Volcanic islands for surfing and luxury resorts.'),
(17, 'Florida', 'Sunshine state with theme parks.'),
(17, 'California Coast', 'Scenic highway and beach-front cities.'),
(17, 'Nevada Desert', 'Entertainment and beautiful desert landscapes.'),

-- ? Filled into Mexico, with IDs 5 and 6
(19, 'Quintana Roo', 'The Caribbean coastline.'),
(19, 'Baja California Sur', 'Ocean-side desert, with Los Cabos.'),

-- ? Filled into Greece, with IDs 7 and 8
(4, 'Cyclades Islands', 'Cliffside villages.'),
(4, 'Crete', 'The largest and most diverse Greek island.'),

-- ? Filled into Italy, with IDs 9 and 10
(5, 'Tuscany', 'Vineyards, villas, and art capitals.'),
(5, 'Amalfi Coast', 'Steep hillsides dropping into gorgeous waters.'),

-- ? Filled into Spain, with IDs 11 and 12
(6, 'Balearic Islands', 'Mediterranean islands including Ibiza.'),
(6, 'Andalusia', 'Moorish architecture and flamenco.'),

-- ? Filled into Egypt, with IDs 13 and 14
(7, 'Red Sea', 'Diving resort havens like Hurghada and Sharm El-Sheikh.'),
(7, 'Luxor Governorate', 'Ancient Egyptian temples along the Nile.'),

-- ? Filled into Thailand, with IDs 15 and 16
(8, 'Phuket Province', 'Thailand''s largest resort island on the Andaman Sea.'),
(8, 'Chiang Mai', 'Mountainous area sporting temples and nature.'),

-- ? Filled into Indonesia, with ID 17
(9, 'Bali Island', 'Volcanic mountains, rice growths, and beaches.'),

-- ? Filled into the United Arab Emirates, with ID 18
(11, 'Dubai', 'Global luxury shopping, architecture, and nightlife.'),

-- ? Filled into French Polynesia, with ID 19
(14, 'Society Islands', 'Home to the peaks and lagoons of Bora Bora and Tahiti.'),

-- ? Filled into Costa Rica, with ID 20
(15, 'Guanacaste', 'Pacific coast with tropical forests and surfing beaches.'),

-- ? Filled into Peru, with ID 21
(16, 'Cusco', 'Inca heritage hotspot in the Highland Andes.'),

-- ? Filled into Japan, with IDs 22 and 23
(20, 'Kyoto Prefecture', 'Cultural nexus of shrines and bamboo forests.'),
(20, 'Hokkaido', 'Hot springs and powder snow ski fields.');

PRINT 'Populated the Area LUT.'

/* =====================================
=     Filling out the Location table   =
===================================== */

-- ? These fill out with generated IDs from 1 to 23
INSERT INTO locations.Location (AreaId, LocationName, LocationDesc) VALUES
-- ? Filled into Hawaii, with IDs 1 and 2
(1, 'Waikiki Beach Resort Strip', 'Honolulu beachfront hotel area.'),
(1, 'Maui Lahaina Coast', 'Scenic coastal corridor.'),

-- ? Filled into Florida, with IDs 3 and 4
(2, 'Key West Old Town', 'Historic southernmost point of the US.'),
(2, 'Lake Buena Vista Resort Area', 'The vacation hub with major theme parks.'),

-- ? Filled into the Nevada Desert, with ID 5
(4, 'Las Vegas Strip', 'Casinos, resort hotels, and nightlife.'),

-- ? Filled into Quintana Roo, with IDs 6 and 7
(5, 'Cancun Hotel Zone', 'Island stretch with beachfront luxury.'),
(5, 'Tulum Beach Road', 'Boutique hotels and beach clubs, along with ruins.'),

-- ? Filled into the Cyclades Islands, with IDs 8 and 9
(7, 'Oia Cliffside Santorini', 'Famous blue-domed churches village with sunset views.'),
(7, 'Mykonos Old Town', 'White streets, boutique stays, and beach clubs.'),

-- ? Filled into Amalfi Coast, with ID 10
(10, 'Positano Village', 'Cliffside village with colorful sea-facing buildings.'),

-- ? Filled into the Balearic Islands, with IDs 11 and 12
(11, 'Ibiza San Antonio Harbor', 'Sunset strip with nightlife resorts.'),
(11, 'Palma de Mallorca Center', 'Historic hub with old-world boutiques and hotels.'),

-- ? Filled into the Red Sea, with IDs 13 and 14
(13, 'Hurghada Marina District', 'Waterfront promenade with boats, food, and beach resorts.'),
(13, 'Naama Bay Sharm', 'Natural bay with diving and nightlife.'),

-- ? Filled into Phuket Province, with IDs 15 and 16
(15, 'Patong Beach Strip', 'Vibrant nightlife with central public resorts and beaches.'),
(15, 'Kata Noi Luxury Cove', 'Secluded beach area to high-end luxury properties.'),

-- ? Filled into Bali Island, with IDs 17 and 18
(17, 'Ubud Rainforest Ridge', 'Cultural center known for jungle eco-lodges and wellness retreats.'),
(17, 'Seminyak Beachfront', 'Upscale beach clubs, fashion boutiques, and luxury villas.'),

-- ? Filled into Dubai, with IDs 19 and 20
(18, 'Palm Jumeirah Boardwalk', 'Man-made palm-shaped island lined with mega-resorts.'),
(18, 'Downtown Dubai Mall District', 'Urban hub housing the Burj Khalifa and luxury skyscrapers.'),

-- ? Filled into Guanacaste, with ID 21
(20, 'Tamarindo Surf Beach', 'Coastal town famous for its waves and eco-resorts.'),

-- ? Filled into Cusco, with ID 22
(21, 'Machu Picchu Sanctuary Citadel', 'Iconic 15th-century mountain Inca citadel.'),

-- ? Filled into Kyoto Prefecture, with ID 23
(22, 'Arashiyama Bamboo Grove Area', 'Scenic hills surrounded by luxurious traditional Japanese Inns.');

PRINT 'Populated the Location LUT.';

-- ? Unneeded response of rows affected
SET
    NOCOUNT ON;

/* =====================================
=    Filling out the User Tiers LUT    =
===================================== */

INSERT INTO
users.UserTier (
    IsHostTier,
    TierLevel,
    TierName,
    TierDesc,
    TierQueuePriority,
    TierFinancialModifier,
    TierCriteriaUI,
    TierMinBookings,
    TierMinRating,
    TierReqTimeConstraint
)
VALUES
/* Customer Tiers
===================================== */
(
    0,
    1,
    'Standard Customer',
    'The default customer tier obtained on registration.',
    1,
    1.00,
    'None',
    0,
    0.0,
    0
),
(
    0,
    2,
    'Distinguished Customer',
    'Customers who have begun proving their loyalty to the platform and hosts.',
    1,
    0.98,
    'At least 2 bookings in the last 6 months, with a total User Rating of 4.2 or more.',
    2,
    4.2,
    6
),
(
    0,
    3,
    'Super Customer',
    'Customers recognised by hosts as friendly regulars with great conduct.',
    2,
    0.92,
    'At least 5 bookings in the last year (12 months) with a total User Rating of 4.5 or more.',
    5,
    4.5,
    12
),
(
    0,
    4,
    'Ultimate Customer',
    'Customers that are notably outstanding in loyalty, consistency, and dealings, with the highest queue priorities and commission discounts.',
    3,
    0.85,
    'At least 12 bookings in the last 2 years (24 months) with a total User Rating of 4.7 or more.',
    12,
    4.7,
    24
),
/* Host Tiers
===================================== */
(
    1,
    1,
    'Standard Host',
    'The default host tier obtained on hosting one''s first property.',
    1,
    1.00,
    'None',
    0,
    0.0,
    0
),
(
    1,
    2,
    'Distinguished Host',
    'Hosts who have begun proving their loyalty to the platform and hospitality.',
    1,
    0.98,
    'At least 3 non-cancelled bookings in the last 6 months, with a total User Rating of 4.5 or more.',
    3,
    4.5,
    6
),
(
    1,
    3,
    'Super Host',
    'Hosts recognised by the community for their hospitality, consistency, and notable service.',
    2,
    0.92,
    'At least 10 non-cancelled bookings in the last year (12 months), with a total User Rating of 4.8 or more.',
    10,
    4.8,
    12
),
(
    1,
    4,
    'Ultimate Host',
    'Hosts that are notably outstanding in their services, standing out from the rest as consistent guest favourites and Airbnb ambassadors.',
    3,
    0.88,
    'At least 25 non-cancelled bookings in the last year (12 months), with a total User Rating of 4.9 or more.',
    25,
    4.9,
    12
);

PRINT 'Populated User Tier LUT.';

/* =====================================
=  Filling out the User Account table  =
===================================== */

INSERT INTO
users.UserAccount (
    UserTier,
    Email,
    HashedPassword,
    PhoneNumber,
    HostingSince
)
VALUES

/* These are 25 users
===================================== */

(
    6,
    'ichiese0@dropbox.com',
    '$2a$04$RGiMVP7czVRBzn3mYpENbuTHSvBMXId3GCw5N4jPI4eQQtBEAtMGm',
    '+33 (164) 763-2075',
    '2025-01-16'
),
(
    4,
    'dbatch1@nydailynews.com',
    '$2a$04$J97Oqdyrc.hRDOSyRmsTDuCIryy5r3bXnJ6QJp4Yj7ZGwk3cmFzl2',
    '+62 (755) 847-7794',
    NULL
),
(
    3,
    'bneilan2@apache.org',
    '$2a$04$izF8Zop9ksWIQVHWMTMvBehrtyTqUmijr35prDG9NXroEPwti31ea',
    '+255 (474) 485-7259',
    NULL
),
(
    1,
    'mfogarty3@ifeng.com',
    '$2a$04$QSvUHn46oM5/JPwtJkM9iO80ZhNb7O2i2uPLc8OJoQA8Fh/671f9a',
    '+256 (900) 674-3230',
    NULL
),
(
    1,
    'scollister4@cnet.com',
    '$2a$04$tFKOBQrAb9/qeIfN26CkAuZJ2NkDHLIS1nu6TCdEpfr7kkcCn8Srq',
    '+46 (385) 995-4471',
    NULL
),
(
    8,
    'jsolman5@histats.com',
    '$2a$04$GbRJ1DBDsyNLYwJL3QTgoec0tlyDTCQ4PnReLhM4ldgBdO5rLSqYW',
    '+56 (360) 724-5977',
    '2020-07-05'
),
(
    4,
    'eblacklidge6@dailymotion.com',
    '$2a$04$qlU4OmrwCXcx4J5NsbL0LuqCo9GKlDM7TFL8ZZ.DZb7aFVbdWe0aS',
    '+46 (501) 936-1791',
    NULL
),
(
    1,
    'fhaxby7@ucsd.edu',
    '$2a$04$hkDbaBnKxxXfnxJ8fCUQtuDreoP6JT9HBOIxsW/R5KqCEz4dZB.xG',
    '+86 (893) 128-8121',
    NULL
),
(
    3,
    'owyllie8@paypal.com',
    '$2a$04$MuHzRDC3nRPb50wdVhavGudxvSvXlbDsDQgXPiHfwHC2My8VpdNAK',
    '+86 (376) 642-6326',
    NULL
),
(
    8,
    'rnudd9@barnesandnoble.com',
    '$2a$04$PK1S33okFmNJzsKXPdXjSOXAzmTwmdgobMvaVBMb6j8LJ1ImwQtOG',
    '+86 (592) 953-5449',
    '2025-03-10'
),
(
    5,
    'cpetraitisa@sciencedirect.com',
    '$2a$04$iO./qgTD4Ck03On.YYGLC.1TqCENyMftuOU8i1RA.RYxbRpyE28nO',
    '+48 (635) 788-2494',
    '2025-02-17'
),
(
    5,
    'mwallsworthb@uiuc.edu',
    '$2a$04$HQfSlhv1aPd1jGgCiJbrXe3i.uPTIgL/TYox9e1TAx61bX27Nn81a',
    '+1 (860) 568-7424',
    '2022-12-22'
),
(
    2,
    'mvyec@washingtonpost.com',
    '$2a$04$oa0jrycQSlxYWAFn.irvfOqbNiuFAGyWsE2VUre5ItnARECBW1iTe',
    '+55 (709) 852-0172',
    NULL
),
(
    2,
    'eprettyjohnsd@symantec.com',
    '$2a$04$sNO3fK/DzkEJCMIt9Zy1gu.rxoEQ/PlmNh5VNewILXempZ6jauqFq',
    '+62 (190) 235-8604',
    NULL
),
(
    6,
    'blistone@google.nl',
    '$2a$04$DFUhUGO8KAtj6XniEh0Bd.atO9hp6cHONDaQXtLbqxqble9Pc3TW6',
    '+51 (153) 961-7633',
    '2025-10-13'
),
(
    2,
    'creganf@slashdot.org',
    '$2a$04$aEVIbXCTNGJ8zB2ECJZEQupJ.YlPiNOLfh36BMKr2Bbb6K7Ju8V.O',
    '+237 (336) 464-3421',
    NULL
),
(
    6,
    'nramshawg@ocn.ne.jp',
    '$2a$04$mZclPUDMpASrsm4DFViZ9OljK1sjGqHwFmn7PK/KVrjViv1780iZS',
    '+86 (339) 547-3406',
    '2021-09-14'
),
(
    7,
    'jrawlisonh@businessweek.com',
    '$2a$04$nQqqy2TkDj7/VVTtdfN2kua111M9Y4TPgKMJWFff28F7TxqcD8YLG',
    '+86 (876) 552-2825',
    '2021-03-24'
),
(
    1,
    'aboogi@usa.gov',
    '$2a$04$0aVvnVqYg.XikVlzr48PIeADGRygmx1Ge87JCv9YLHAEKBJJ/9bBq',
    '+81 (679) 514-8312',
    NULL
),
(
    2,
    'mincognaj@free.fr',
    '$2a$04$mkDy4M6TsoVcYh1zD1hfu.vvuAxmIrGORdWwInzXogbkpHZ0MLKZ2',
    '+27 (824) 742-2034',
    NULL
),
(
    6,
    'shallask@a8.net',
    '$2a$04$NDDRouKN/Pa/7H0fh8u3gOJfPm8bEe5fPQZK13/xH1e.kxPiq08iC',
    '+46 (901) 941-6197',
    '2024-09-03'
),
(
    4,
    'achifneyl@topsy.com',
    '$2a$04$fo7rteueniYYidi8Zii64ejoRSMF1PTOES.rHIxxcBZA5jQ12X/v6',
    '+86 (405) 465-2008',
    NULL
),
(
    8,
    'wthomelm@google.com.br',
    '$2a$04$I1o1tlNAfYIbGb2Ja4AefOi0wRINczIn2gLaM2UfoAsmMRHXJLvGy',
    '+81 (261) 648-3031',
    '2024-05-23'
),
(
    2,
    'dgiraudeln@123-reg.co.uk',
    '$2a$04$62CeidWEKfioxyAhVgrk4.hW2SoDOrOoDaKnjHkCV1MrRLt/31umG',
    '+7 (606) 127-9643',
    NULL
),
(
    3,
    'mcarseyo@indiegogo.com',
    '$2a$04$NM09ruTx6ZnwW3TNVrdzge2yqaPkgeNxgQaS8rHWk/a11qe1MrGUa',
    '+420 (235) 178-5829',
    NULL
);

PRINT 'Populated User Account table.';

/* =====================================
=  Filling out the User Profiles table =
===================================== */

-- ! Note: Due to limitations of Mockaroo (the tool being used to generate the mock data)
-- !       the Facebook, Instagram, and Linkedin links (when present) will not have those
-- !       specific domains, but instead random domains. The mockaroo URL data type does not
-- !       have the ability to specify a domain.
INSERT INTO
users.UserProfile (
    UserId,
    FirstName,
    LastName,
    ProfilePictureUrl,
    FacebookLink,
    InstagramLink,
    LinkedinLink
)
VALUES

/* Also 25 profiles respectively
===================================== */

(
    1,
    'Rowan',
    'Staddon',
    'http://dummyimage.com/224x139.png/dddddd/000000',
    'https://hatena.ne.jp/bibendum/imperdiet/nullam/orci/pede.json',
    'https://icio.us/turpis/enim.json',
    'https://example.com/sodales/scelerisque/mauris/sit/amet.jsp'
),
(
    2,
    'Wilma',
    'Gooley',
    'http://dummyimage.com/233x225.png/5fa2dd/ffffff',
    NULL,
    'https://cmu.edu/purus.png',
    'https://netlog.com/amet/consectetuer/adipiscing/elit/proin.xml'
),
(
    3,
    'Shelly',
    'Mabbot',
    'http://dummyimage.com/215x166.png/cc0000/ffffff',
    'http://google.es/fermentum/donec/ut/mauris/eget/massa/tempor.png',
    'https://google.co.uk/enim/blandit/mi/in/porttitor/pede.js',
    'http://newyorker.com/magna.aspx'
),
(
    4,
    'Iain',
    'Novak',
    'http://dummyimage.com/225x203.png/ff4444/ffffff',
    NULL,
    'http://msn.com/convallis/morbi/odio/odio/elementum/eu.jpg',
    'https://oakley.com/vitae/nisl/aenean/lectus.png'
),
(
    5,
    'Constance',
    'Reeveley',
    'http://dummyimage.com/147x135.png/5fa2dd/ffffff',
    NULL,
    NULL,
    'http://blogs.com/eleifend/luctus/ultricies.json'
),
(
    6,
    'Joseito',
    'Quye',
    'http://dummyimage.com/161x237.png/ff4444/ffffff',
    'https://vimeo.com/quisque/id/justo/sit/amet.xml',
    'https://nbcnews.com/dolor/morbi.xml',
    'https://unesco.org/morbi/vel/lectus.html'
),
(
    7,
    'Abagail',
    'Dole',
    'http://dummyimage.com/173x126.png/5fa2dd/ffffff',
    NULL,
    'https://hud.gov/nisi/vulputate/nonummy/maecenas/tincidunt/lacus.jsp',
    NULL
),
(
    8,
    'Egon',
    'Eskell',
    'http://dummyimage.com/135x169.png/5fa2dd/ffffff',
    NULL,
    'http://admin.ch/pede/ullamcorper/augue/a/suscipit.jsp',
    NULL
),
(
    9,
    'Quintus',
    'Roycraft',
    'http://dummyimage.com/135x129.png/cc0000/ffffff',
    NULL,
    'https://tinypic.com/magna/vestibulum/aliquet/ultrices/erat/tortor/sollicitudin.aspx',
    'http://mac.com/dictumst/etiam/faucibus/cursus/urna/ut.json'
),
(
    10,
    'Karolina',
    'Studdard',
    'http://dummyimage.com/150x176.png/cc0000/ffffff',
    'http://imgur.com/et/ultrices/posuere.js',
    'https://myspace.com/nisi/volutpat/eleifend/donec/ut/dolor.jpg',
    NULL
),
(
    11,
    'Gerardo',
    'O''Hannen',
    'http://dummyimage.com/193x201.png/5fa2dd/ffffff',
    'http://macromedia.com/nulla/nunc/purus/phasellus/in.jpg',
    NULL,
    'http://jugem.jp/morbi.xml'
),
(
    12,
    'Donovan',
    'La Torre',
    'http://dummyimage.com/179x156.png/ff4444/ffffff',
    'https://vkontakte.ru/nulla/suspendisse/potenti.json',
    'https://edublogs.org/morbi/non.png',
    'http://sfgate.com/diam/nam/tristique.json'
),
(
    13,
    'Allin',
    'Trittam',
    'http://dummyimage.com/100x105.png/cc0000/ffffff',
    NULL,
    'https://phpbb.com/vel/sem.jsp',
    'http://t-online.de/cubilia/curae/mauris/viverra.json'
),
(
    14,
    'Regen',
    'Yannikov',
    'http://dummyimage.com/222x177.png/dddddd/000000',
    NULL,
    'http://google.cn/ligula/sit/amet/eleifend/pede/libero/quis.xml',
    'http://reference.com/mattis/nibh/ligula/nec/sem/duis/aliquam.aspx'
),
(
    15,
    'Karol',
    'Giscken',
    'http://dummyimage.com/229x198.png/5fa2dd/ffffff',
    'http://fastcompany.com/quis/libero/nullam/sit.json',
    'http://dyndns.org/vulputate.js',
    NULL
),
(
    16,
    'Beth',
    'Kardos',
    'http://dummyimage.com/135x192.png/dddddd/000000',
    NULL,
    NULL,
    NULL
),
(
    17,
    'Papagena',
    'Gobert',
    'http://dummyimage.com/219x188.png/dddddd/000000',
    NULL,
    'http://irs.gov/placerat/praesent/blandit/nam.jsp',
    'https://free.fr/vel/nulla/eget/eros/elementum/pellentesque.js'
),
(
    18,
    'Valerye',
    'Tarling',
    'http://dummyimage.com/162x210.png/dddddd/000000',
    'https://columbia.edu/nec/sem/duis/aliquam/convallis.png',
    NULL,
    'https://yellowbook.com/ante/ipsum.json'
),
(
    19,
    'Killie',
    'Laxton',
    'http://dummyimage.com/160x150.png/5fa2dd/ffffff',
    'https://marketwatch.com/mi/nulla.jsp',
    'http://newsvine.com/sit.png',
    NULL
),
(
    20,
    'Nolan',
    'Layland',
    'http://dummyimage.com/165x161.png/dddddd/000000',
    'https://ustream.tv/urna/ut/tellus.jsp',
    'http://flavors.me/ut/dolor/morbi/vel/lectus.js',
    'http://engadget.com/pellentesque/ultrices/phasellus.aspx'
),
(
    21,
    'Debora',
    'Jakubovicz',
    'http://dummyimage.com/159x173.png/ff4444/ffffff',
    'http://dagondesign.com/risus.html',
    'http://toplist.cz/adipiscing.aspx',
    NULL
),
(
    22,
    'Fredi',
    'Bownde',
    'http://dummyimage.com/150x217.png/5fa2dd/ffffff',
    'https://blogtalkradio.com/tincidunt/eu/felis.xml',
    'http://lycos.com/posuere.js',
    'http://webnode.com/orci/mauris/lacinia/sapien/quis.js'
),
(
    23,
    'Rayshell',
    'Huxter',
    'http://dummyimage.com/121x109.png/dddddd/000000',
    NULL,
    NULL,
    NULL
),
(
    24,
    'Thia',
    'Wingatt',
    'http://dummyimage.com/248x153.png/dddddd/000000',
    'http://altervista.org/diam/erat/fermentum.json',
    'https://csmonitor.com/sagittis/sapien/cum/sociis/natoque/penatibus/et.html',
    'http://geocities.com/dolor.aspx'
),
(
    25,
    'Mavis',
    'Koopman',
    'http://dummyimage.com/156x111.png/cc0000/ffffff',
    'https://amazon.co.uk/ut/ultrices/vel/augue/vestibulum.png',
    'http://artisteer.com/cras.png',
    NULL
);

PRINT 'Populated User Profile table.';

/* =====================================
=    Filling out the Languages LUT     =
===================================== */

INSERT INTO
users.Languages (LangName)
VALUES

/* These are 25 languages
===================================== */

('Afrikaans'),
('Akan'),
('Bosnian'),
('Burmese'),
('Chichewa'),
('English'),
('Farsi'),
('French'),
('Galician'),
('German'),
('Guarani'),
('Gujarati'),
('Italian'),
('Kurdish'),
('Lithuanian'),
('Malay'),
('Norwegian'),
('Oromo'),
('Polish'),
('Romansh'),
('Rundi'),
('Spanish'),
('Swati'),
('Swedish'),
('Tigrinya');

PRINT 'Populated Languages LUT.';

/* =====================================
= Filling out the User-Languages table =
===================================== */

INSERT INTO
users.UserLanguages (LangId, UserId)
VALUES

/* These are 50 user-language relations
===================================== */

(1, 2),
(1, 24),
(2, 6),
(3, 8),
(3, 9),
(4, 10),
(4, 16),
(4, 24),
(4, 7),
(5, 14),
(5, 2),
(6, 14),
(7, 17),
(8, 4),
(8, 12),
(8, 8),
(10, 11),
(10, 20),
(11, 10),
(11, 9),
(12, 15),
(12, 17),
(12, 9),
(13, 10),
(13, 23),
(13, 3),
(13, 8),
(13, 18),
(14, 22),
(14, 5),
(14, 6),
(15, 12),
(15, 3),
(16, 18),
(16, 19),
(16, 21),
(16, 24),
(17, 1),
(17, 11),
(17, 7),
(18, 17),
(20, 19),
(22, 11),
(22, 22),
(22, 24),
(22, 8),
(23, 20),
(25, 19),
(25, 2),
(25, 5);

PRINT 'Populated Assigned User-Languages relationship table.';

-- ? Unneeded response of rows affected
SET
    NOCOUNT ON;

/* =====================================
= Filling out the Billing Address table=
===================================== */
INSERT INTO
users.BillingAddress (
    AddressName,
    AddressLine1,
    AddressLine2,
    PostalCode,
    AddressCountry
)
VALUES

/* These are 25 billing addresses
===================================== */

(
    'My Office',
    '803 Saint Paul Center',
    'PO Box 27586',
    '30501',
    21
),
(
    'Vacation Home',
    '2088 Banding Crossing',
    '7th Floor',
    NULL,
    20
),
(
    'Airbnb chalet',
    '6282 Bashford Street',
    'Room 1874',
    '1035',
    19
),
(
    'Second Office',
    '6943 Fairfield Drive',
    'Suite 42',
    NULL,
    21
),
(
    'My Office',
    '58 Forest Run Lane',
    'Apt 1227',
    NULL,
    16
),
(
    'Second Office',
    '8451 Linden Place',
    'Room 673',
    '22301',
    5
),
(
    'Second Office',
    '50387 Pleasure Way',
    'Room 340',
    NULL,
    1
),
(
    'Work Address',
    '95277 Bay Road',
    '20th Floor',
    '9017',
    4
),
(
    'Second Home',
    '6 Blue Bill Park Drive',
    'PO Box 222',
    '735037',
    21
),
(
    'Mum''s apartment',
    '7107 American Ash Plaza',
    'Room 1557',
    '5110',
    15
),
(
    'My Office',
    '7207 Vernon Junction',
    '15th Floor',
    NULL,
    6
),
(
    'Work Address',
    '87204 Hudson Crossing',
    'Suite 21',
    '4230',
    14
),
(
    'Mum''s apartment',
    '89705 Ramsey Road',
    'Apt 1946',
    NULL,
    8
),
(
    'Second Home',
    '7 Sugar Drive',
    '1st Floor',
    NULL,
    15
),
(
    'Vacation Home',
    '3 Ramsey Parkway',
    'PO Box 8878',
    NULL,
    21
),
(
    'Vacation Home',
    '322 Caliangt Street',
    'Apt 751',
    '70644',
    4
),
(
    'Second Home',
    '945 Kingsford Way',
    '2nd Floor',
    NULL,
    4
),
(
    'Home',
    '1324 Nevada Hill',
    'Suite 89',
    NULL,
    14
),
(
    'Airbnb chalet',
    '8 Haas Court',
    'PO Box 14184',
    '81803',
    11
),
(
    'Work Address',
    '6 6th Road',
    'Suite 72',
    '92521 CEDEX',
    18
),
(
    'Home',
    '820 Ramsey Pass',
    'Room 795',
    '64-234',
    2
),
(
    'Second Office',
    '095 Truax Crossing',
    '15th Floor',
    '22-470',
    14
),
(
    'Airbnb chalet',
    '5 Eastwood Court',
    '7th Floor',
    NULL,
    21
),
(
    'Airbnb chalet',
    '85325 Quincy Center',
    '3rd Floor',
    '3335',
    4
),
(
    'Work Address',
    '26 Scofield Pass',
    '5th Floor',
    NULL,
    18
);

PRINT 'Populated User Billing Address table.';

GO

/* ========================================
= Filling out the Payment Method Type LUT =
======================================== */

INSERT INTO
reservations.PaymentMethodType (TypeName, TypeDescription)
VALUES

/* These are payment method types with IDs 1 to 7
================================================== */

(
    'Card',
    'A credit, debit, or similarly functioning card with a number, expiry date, with/without a security code.'
),
(
    'Digital Wallet',
    'An online/digital wallet from a provider, like Google Pay or Apple Pay.'
),
(
    'Paypal/Venmo',
    'Online wiring and transfer providers, like Paypal and Venmo.'
),
(
    'Buy Now, Pay Later (BNPL)',
    'Financial providers that provide BNPL schemes for users.'
),
(
    'Bank Account',
    'A bank account for transfers and wiring'
);

PRINT 'Populated Payment Method Type LUT.';

/* =====================================
= Filling out the Payment Method table =
===================================== */

INSERT INTO
users.PaymentMethod (
    MethodType,
    BillingAddress,
    OwnerId,
    MethodName,
    BillingName,
    Field1,
    Field2,
    Field3,
    Field4,
    Field5
)
VALUES

/* These are 50 payment methods
===================================== */

/* Card payment methods
===================================== */

(
    1,
    19,
    3,
    'Shared Card',
    'Dionne McGahy',
    '5602223700332538',
    '07',
    '30',
    '172',
    NULL
),
(
    1,
    18,
    6,
    'Main Visa',
    'Terrel Soff',
    '374283153265889',
    '01',
    '28',
    '5017',
    NULL
),
(
    1,
    11,
    22,
    'Main Visa',
    'Tally Rummer',
    '67099126445147568',
    '07',
    '31',
    '7444',
    NULL
),
(
    1,
    7,
    12,
    'Second Card',
    'Averil Gosson',
    '6761515458868866939',
    '07',
    '27',
    '906',
    NULL
),
(
    1,
    25,
    3,
    'My card',
    'Shannah Dale',
    '5602259296760252',
    '08',
    '29',
    '7450',
    NULL
),
(
    1,
    9,
    2,
    'Dad''s Visa',
    'Wrennie Ledstone',
    '3574016149024511',
    '03',
    '2027',
    '1159',
    NULL
),
(
    1,
    20,
    9,
    'Shared Card',
    'Feodor Kloss',
    '3578397783299403',
    '08',
    '2030',
    '2842',
    NULL
),
(
    1,
    12,
    11,
    'Main Visa',
    'Billi Fawbert',
    '5610188111802058',
    '07',
    '2029',
    '282',
    NULL
),
(
    1,
    21,
    16,
    'Dad''s Visa',
    'Hollie Wollard',
    '3553839711309258',
    '06',
    '29',
    '122',
    NULL
),
(
    1,
    11,
    15,
    'Main Visa',
    'Doloritas Burrell',
    '6771767154249004746',
    '03',
    '31',
    '037',
    NULL
),

/* Digital Wallet payment methods
===================================== */

(
    2,
    7,
    1,
    'My Wallet',
    'Baryram Latehouse',
    've_1DMh2l162ppUwT08TPvD4mDBO4',
    '09',
    '2034',
    'GOOGLE_PAY',
    NULL
),
(
    2,
    9,
    11,
    'Apple Wallet',
    'Kandy Skehan',
    'pdsf_2URcQr0aYZ3xoB2a2o8PM8oJDOCm7kW0aglUUYYe270H94N',
    '01',
    '2031',
    'APPLE_PAY',
    NULL
),
(
    2,
    23,
    8,
    'Apple Wallet',
    'Cazzie Fear',
    'hjtlm_9Kb57e4KI3x802CgMgysQGduypfLlrSCWZ8m53hHO9VtBHI00374D',
    '10',
    '2032',
    'APPLE_PAY',
    NULL
),
(
    2,
    3,
    11,
    'Main Wallet',
    'Goldarina Kornilov',
    'ts_2m4amgQ8L',
    '07',
    '2028',
    'GOOGLE_PAY',
    NULL
),
(
    2,
    16,
    2,
    'Main Wallet',
    'Kirby Whittenbury',
    'eulv_5ocJZ4OH9kr4f1711GbS9333lKA1e2AEr9U9RyPt83nVxV4bx5r9M',
    '05',
    '27',
    'APPLE_PAY',
    NULL
),
(
    2,
    19,
    9,
    'Main Wallet',
    'Honor Blackster',
    'vps_cq8S749X4e414n0uQ6b3lBBU00Wk9SkYmC91DgXoseVTl2kIME6',
    '06',
    '2036',
    'GOOGLE_PAY',
    NULL
),
(
    2,
    23,
    21,
    'A Pay',
    'Georgia Fulker',
    'hyv_NvetRK517m5CiA7D5x6HD05omi8cJ5yM7x5DPdt8x5Y69zP02MNHKXkGe',
    '01',
    '35',
    'APPLE_PAY',
    NULL
),
(
    2,
    23,
    15,
    'A Pay',
    'Pinchas Seale',
    'wkd_0wNFztBPv46198EJ3058Sd6x46E97VfWffmUNhYkzDnD',
    '11',
    '28',
    'APPLE_PAY',
    NULL
),
(
    2,
    14,
    6,
    'Apple Wallet',
    'Jermaine Josebury',
    'ne_19n1Dpi4goqS1U96f7i0EA0lUHe3FZ',
    '04',
    '2029',
    'APPLE_PAY',
    NULL
),
(
    2,
    24,
    9,
    'A Pay',
    'Isador Baccas',
    'uu_C1XAERVGeLo4noxAWt1Uwb1106bkoDq2w916HBfky7xF0TSBkb1cB52SY',
    '05',
    '2035',
    'GOOGLE_PAY',
    NULL
),

/* Paypal/Venmo payment methods
===================================== */

(
    3,
    23,
    19,
    'Commissions Paypal',
    'Rachel Gatchell',
    '@hdebell0',
    NULL,
    NULL,
    'VENMO',
    NULL
),
(
    3,
    7,
    10,
    'Main Paypal',
    'Bentlee Trenchard',
    '@bvasilkov1',
    NULL,
    NULL,
    'VENMO',
    NULL
),
(
    3,
    16,
    24,
    'Shared Venmo',
    'Beltran Lilley',
    '0VRJ8L1524525URY2',
    NULL,
    NULL,
    'PAYPAL',
    NULL
),
(
    3,
    17,
    12,
    'Commissions Paypal',
    'Rebeca Warin',
    'H510F5KF7UDC352D7497J7L8Q7',
    NULL,
    NULL,
    'PAYPAL',
    NULL
),
(
    3,
    22,
    4,
    'Commissions Paypal',
    'Mildred Simoncelli',
    'PMJ45463HFNNGL5DFW9I',
    NULL,
    NULL,
    'PAYPAL',
    NULL
),
(
    3,
    11,
    15,
    'Shared Venmo',
    'Anselm Rattrie',
    '@cseeks5',
    NULL,
    NULL,
    'VENMO',
    NULL
),
(
    3,
    24,
    16,
    'Shared Venmo',
    'Papagena De Paepe',
    '@ariste6',
    NULL,
    NULL,
    'VENMO',
    NULL
),
(
    3,
    23,
    10,
    'Shared Venmo',
    'Maegan Skedge',
    'ZT82CNY6S3037VABL6CZG1U9O4',
    NULL,
    NULL,
    'PAYPAL',
    NULL
),
(
    3,
    10,
    10,
    'Shared Venmo',
    'Cooper Folkerd',
    'DN94OT0ST3KK1856',
    NULL,
    NULL,
    'PAYPAL',
    NULL
),
(
    3,
    16,
    1,
    'Main Paypal',
    'Kordula Synan',
    'P85TE774KY7NKFK88UM6',
    NULL,
    NULL,
    'PAYPAL',
    NULL
),

/* BNPL payment methods
===================================== */

(
    4,
    24,
    20,
    'Buy Now Pay Later setup',
    'Thomas Treves',
    'TnVuYyBwdXJ1cy4gUGhhc2VsbHVzIGluIGZlbGlzLiBE',
    NULL,
    NULL,
    'SPLITIT',
    NULL
),
(
    4,
    12,
    2,
    'Instalment plan',
    'Briano Filipputti',
    'VmVzdGlidWx1bSBhbnRlIGlwc3VtIHByaW1pcyBpbiBmYXVjaWJ1cyBvcmNpIGx1Y3R1c',
    NULL,
    NULL,
    'SPLITIT',
    NULL
),
(
    4,
    17,
    9,
    'Buy Now Pay Later setup',
    'Noe Shirtliff',
    'SW4gaGFjIGhhYml0YXNzZSBwbGF0ZW',
    NULL,
    NULL,
    'KLARNA',
    NULL
),
(
    4,
    15,
    20,
    'My Klarna',
    'Scotty Dabinett',
    'VmVzdGlidWx1bSBhbnRlIGlwc3VtIHByaW1pcyBpb',
    NULL,
    NULL,
    'SPLITIT',
    NULL
),
(
    4,
    10,
    15,
    'Instalment plan',
    'Burt Sisnett',
    'QWxpcXVhbSBhdWd1ZSBxdWFtLCBzb2xsaWNpdHVkaW4gdml0YWUsIGNvbnNlY3RldH',
    NULL,
    NULL,
    'SPLITIT',
    NULL
),
(
    4,
    19,
    16,
    'BNPL',
    'Angeli Grane',
    'QWxpcXVhbSBlcmF0IHZvbHV0cGF0Li',
    NULL,
    NULL,
    'AFTERPAY',
    NULL
),
(
    4,
    7,
    25,
    'BNPL',
    'Cyndie Jackson',
    'TWFlY2VuYXMgdHJpc3RpcXVlLCBlc3QgZXQgdGVtcHVzIHNlbX',
    NULL,
    NULL,
    'KLARNA',
    NULL
),
(
    4,
    18,
    25,
    'Instalment plan',
    'Crin Mattingson',
    'Q3JhcyBub24gdmVsaXQgbmVjIG5pc2kgdnV',
    NULL,
    NULL,
    'SPLITIT',
    NULL
),
(
    4,
    9,
    13,
    'My Klarna',
    'Baxy Gerrit',
    'TWFlY2VuYXMgbGVvIG9kaW8sIGNvbmRpbWVudHVtIGlkLCBsd',
    NULL,
    NULL,
    'SPLITIT',
    NULL
),
(
    4,
    5,
    15,
    'Instalment plan',
    'Marcella Pilsworth',
    'RG9uZWMgcXVpcyBvcmNpIGVnZXQgb3JjaSB2ZWhpY3VsYSBjb25kaW1lbnR1bS4gQ3Vy',
    NULL,
    NULL,
    'AFFIRM',
    NULL
),

/* Bank payment methods
===================================== */

(
    5,
    1,
    24,
    'Shared Account',
    'Orland Sheringham',
    'PQ44M94GE879WE01B7',
    'DFRWZUQJ511',
    NULL,
    'SAVINGS',
    NULL
),
(
    5,
    25,
    22,
    'Shared Account',
    'Marcia Hiskey',
    'NR21EFB1AZ7VMEFGU',
    'HLVVJQSA',
    NULL,
    'SAVINGS',
    NULL
),
(
    5,
    17,
    23,
    'Main Account',
    'Rosalinda Connett',
    'TM76913JR4L28423IC',
    'JCVOTWUAU9L',
    NULL,
    'SAVINGS',
    NULL
),
(
    5,
    10,
    21,
    'Family Account',
    'Dorthea Seamans',
    'AG63KXP6BS096I9930O0686H0L77',
    'ZYYGPY69QH4',
    NULL,
    'CHECKING',
    NULL
),
(
    5,
    3,
    17,
    'Shared Account',
    'Gerard Jeeves',
    'BG47025HUQF526200G3Z4OKDV06',
    'CBQUPXRX6K0',
    NULL,
    'SAVINGS',
    NULL
),
(
    5,
    23,
    21,
    'Savings',
    'Wilmette Degoix',
    'CM31W49SORY7O1Q',
    'IJTJOHE2',
    NULL,
    'SAVINGS',
    NULL
),
(
    5,
    10,
    3,
    'Shared Account',
    'Earle Cinelli',
    'DW86QS5391D1807NX70R8UGOD819LE0S',
    'GCJDVZDG',
    NULL,
    'CHECKING',
    NULL
),
(
    5,
    8,
    10,
    'Shared Account',
    'Nertie Ruberry',
    'WR45BK5454B1S5B5FEC53P4',
    'OYIZBL8WK6W',
    NULL,
    'CHECKING',
    NULL
),
(
    5,
    25,
    8,
    'Checkings',
    'Bernadine Spowart',
    'PV35TA8Q1906904U',
    'MNONFRWN',
    NULL,
    'SAVINGS',
    NULL
),
(
    5,
    21,
    21,
    'Family Account',
    'Evangelia Cogzell',
    'MN1008W9T2NC94OM8H995R7E73D7P1R50C',
    'LUXLVR50',
    NULL,
    'CHECKING',
    NULL
);

PRINT 'Populated User Payment Method table.';

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

/* These are 8 different sector types
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

-- ? Unneeded response of rows affected -- noqa: LT05
SET
    NOCOUNT ON;

/* =======================================
= Filling out the User Collections table =
======================================= */

-- ? Since the favourites collections are already filled out from the user account trigger,
-- ? these will be non-favourite collections

INSERT INTO
users.UserCollections (
    CreatorId,
    CollectionName,
    CollectionDesc,
    IsPublic
)
VALUES

-- ? These are 100 random collections for all users
(
    20,
    'Goals Plans Hotel',
    'Sed vel enim sit amet nunc viverra dapibus.',
    1
),
(
    20,
    'My List Zulu',
    'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.',
    0
),
(
    23,
    'Winter Favs Lima',
    'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.',
    1
),
(
    3,
    'Goals List Yankee',
    'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis.',
    0
),
(
    22,
    'My Collection India',
    'Etiam pretium iaculis justo. In hac habitasse platea dictumst.',
    1
),
(
    8,
    '2026 Plans Yankee',
    'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.',
    1
),
(
    13,
    '2026 Bucket List India',
    'Aliquam quis turpis eget elit sodales scelerisque.',
    1
),
(
    10,
    'Goals Plans India',
    'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices.',
    1
),
(
    25,
    '2026 Favs Yankee',
    'Aenean lectus. Pellentesque eget nunc.',
    0
),
(
    25,
    '2026 Tops Oscar',
    'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.',
    0
),
(
    12,
    '2026 Bucket List Whiskey',
    'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.',
    0
),
(
    17,
    'Wishlist Tops Whiskey',
    'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.',
    0
),
(
    13,
    'Goals Group Sierra',
    'Donec dapibus.',
    1
),
(
    19,
    'Summer Collection Oscar',
    'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    0
),
(
    22,
    'Goals Tops Oscar',
    'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam.',
    0
),
(
    9,
    'Winter Collection Papa',
    'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices. Integer ac neque.',
    0
),
(
    5,
    '2026 Checklist Foxtrot',
    'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.',
    0
),
(
    17,
    'Winter Tops Mike',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis.',
    0
),
(
    9,
    'My Checklist Tango',
    'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',
    1
),
(
    13,
    'Winter Tops Kilo',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.',
    0
),
(
    21,
    'Summer Tops Oscar',
    'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.',
    0
),
(
    2,
    'Summer Plans Golf',
    'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',
    1
),
(
    3,
    'My Tops Alfa',
    'Aenean fermentum. Donec ut mauris eget massa tempor convallis.',
    0
),
(
    2,
    'Goals List Tango',
    'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.',
    1
),
(
    21,
    'Wishlist Group Delta',
    'Duis ac nibh.',
    0
),
(
    23,
    'Wishlist List India',
    'In congue.',
    0
),
(
    1,
    '2026 Plans Quebec',
    'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.',
    1
),
(
    14,
    'Goals Group Sierra',
    'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.',
    0
),
(
    8,
    'Winter Collection Charlie',
    'Aenean fermentum. Donec ut mauris eget massa tempor convallis.',
    0
),
(
    25,
    'Summer Group Kilo',
    'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',
    1
),
(
    6,
    'Summer Tops Hotel',
    'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.',
    1
),
(
    18,
    'Winter Plans Victor',
    'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.',
    0
),
(
    22,
    'Winter Group India',
    'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',
    0
),
(
    10,
    '2026 Group Alfa',
    'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.',
    0
),
(
    21,
    'Winter Bucket List Uniform',
    'Donec semper sapien a libero.',
    0
),
(
    20,
    'Winter Group India',
    'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',
    0
),
(
    4,
    'Summer Favs Echo',
    'Suspendisse accumsan tortor quis turpis. Sed ante.',
    0
),
(
    24,
    '2026 Checklist India',
    'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',
    0
),
(
    13,
    'My Plans Sierra',
    'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.',
    1
),
(
    18,
    'My Plans Papa',
    'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.',
    1
),
(
    18,
    'Goals Favs Yankee',
    'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.',
    0
),
(
    19,
    'Winter Favs Papa',
    'Pellentesque ultrices mattis odio. Donec vitae nisi.',
    1
),
(
    24,
    'Winter Bucket List Bravo',
    'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    0
),
(
    17,
    'My Group Quebec',
    'Cras non velit nec nisi vulputate nonummy.',
    1
),
(
    6,
    'My Bucket List Tango',
    'Etiam pretium iaculis justo. In hac habitasse platea dictumst.',
    0
),
(
    20,
    'Winter Plans Echo',
    'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.',
    0
),
(
    2,
    'Wishlist Favs X-ray',
    'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.',
    0
),
(
    4,
    'Goals Bucket List Bravo',
    'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',
    0
),
(
    6,
    'My Group Zulu',
    'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis.',
    1
),
(
    10,
    'Summer Plans Alfa',
    'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',
    1
),
(
    23,
    '2026 Bucket List Quebec',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis.',
    0
),
(
    8,
    'Wishlist Bucket List Romeo',
    'Aliquam erat volutpat. In congue. Etiam justo.',
    0
),
(
    8,
    'Summer Bucket List Whiskey',
    'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',
    0
),
(
    5,
    'Summer Collection Hotel',
    'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',
    1
),
(
    25,
    'Summer List Mike',
    'Duis bibendum. Morbi non quam nec dui luctus rutrum.',
    0
),
(
    21,
    'Winter Tops Delta',
    'Etiam justo. Etiam pretium iaculis justo.',
    1
),
(
    15,
    'Wishlist Tops Bravo',
    'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
    1
),
(
    9,
    'Winter Favs Yankee',
    'Mauris ullamcorper purus sit amet nulla.',
    0
),
(
    13,
    'My Favs Lima',
    'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
    0
),
(
    19,
    '2026 Collection Kilo',
    'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.',
    0
),
(
    8,
    'Summer Group Bravo',
    'Donec semper sapien a libero.',
    1
),
(
    21,
    'My Favs Foxtrot',
    'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.',
    1
),
(
    10,
    'Winter List Juliett',
    'Ut tellus. Nulla ut erat id mauris vulputate elementum.',
    0
),
(
    16,
    'Goals Bucket List Zulu',
    'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',
    1
),
(
    1,
    'Goals Collection Whiskey',
    'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',
    1
),
(
    25,
    'My Bucket List Sierra',
    'Donec dapibus. Duis at velit eu est congue elementum.',
    0
),
(
    14,
    'Summer Tops Delta',
    'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.',
    1
),
(
    15,
    'Goals Collection Tango',
    'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',
    0
),
(
    4,
    '2026 Favs November',
    'Morbi non quam nec dui luctus rutrum. Nulla tellus.',
    1
),
(
    25,
    'Summer Collection Yankee',
    'Phasellus in felis. Donec semper sapien a libero. Nam dui.',
    0
),
(
    21,
    '2026 List Victor',
    'Vivamus tortor.',
    1
),
(
    22,
    'Goals Tops Mike',
    'In hac habitasse platea dictumst.',
    1
),
(
    9,
    'My Collection Romeo',
    'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.',
    0
),
(
    16,
    'Wishlist List Golf',
    'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',
    0
),
(
    7,
    'Goals Bucket List Romeo',
    'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.',
    0
),
(
    22,
    'Goals Group Oscar',
    'Praesent blandit lacinia erat.',
    1
),
(
    9,
    'My List Zulu',
    'Nulla tempus.',
    1
),
(
    8,
    'Summer Collection Oscar',
    'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.',
    1
),
(
    24,
    'My Group Kilo',
    'Morbi quis tortor id nulla ultrices aliquet.',
    1
),
(
    4,
    'Winter Favs Lima',
    'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',
    1
),
(
    8,
    'Wishlist Checklist Zulu',
    'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.',
    0
),
(
    19,
    'Wishlist Collection Golf',
    'Morbi non quam nec dui luctus rutrum. Nulla tellus.',
    0
),
(
    7,
    'Wishlist List Romeo',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',
    1
),
(
    16,
    'My Tops Oscar',
    'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.',
    1
),
(
    21,
    'Goals Collection Oscar',
    'Proin at turpis a pede posuere nonummy.',
    0
),
(
    4,
    'Winter Tops Oscar',
    'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.',
    1
),
(
    15,
    'Summer List Zulu',
    'Proin leo odio, porttitor id, consequat in, consequat ut, nulla.',
    1
),
(
    24,
    '2026 Favs Mike',
    'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',
    0
),
(
    8,
    'Winter Plans Charlie',
    'Integer ac leo. Pellentesque ultrices mattis odio.',
    0
),
(
    21,
    '2026 List Quebec',
    'Fusce consequat.',
    0
),
(
    9,
    'Goals Group India',
    'Vivamus tortor. Duis mattis egestas metus.',
    1
),
(
    22,
    'Summer Checklist Victor',
    'Integer ac neque.',
    0
),
(
    23,
    '2026 Favs Papa',
    'Duis mattis egestas metus.',
    0
),
(
    12,
    'Summer Bucket List Oscar',
    'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',
    1
),
(
    25,
    'My Group Victor',
    'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',
    1
),
(
    11,
    'My Plans Golf',
    'Phasellus in felis. Donec semper sapien a libero. Nam dui.',
    1
),
(
    10,
    'My Checklist Zulu',
    'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.',
    1
),
(
    13,
    'Wishlist Favs November',
    'Etiam justo. Etiam pretium iaculis justo.',
    0
),
(
    5,
    'Summer Plans Whiskey',
    'Aliquam erat volutpat. In congue. Etiam justo.',
    0
),
(
    21,
    'Goals Group Quebec',
    'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',
    1
);

PRINT 'Populated User Collections table.';

/* =============================================================
= Filling out the properties-in-collections relationship table =
============================================================= */

INSERT INTO
users.PropertiesInCollections (
    CollectionId,
    PropertyId,
    AddedBy
)
VALUES

/* These are 150 properties spread across (most of) the 125 collections
======================================================================= */

(3, 8, 2),
(6, 3, 5),
(6, 27, 6),
(6, 27, 25),
(7, 27, 8),
(9, 30, 21),
(10, 6, 4),
(10, 7, 21),
(10, 29, 21),
(11, 9, 6),
(11, 25, 20),
(12, 14, 1),
(13, 14, 3),
(14, 9, 4),
(14, 15, 4),
(15, 9, 14),
(15, 13, 7),
(15, 17, 4),
(15, 18, 10),
(16, 2, 21),
(16, 10, 12),
(16, 27, 20),
(17, 16, 1),
(17, 26, 11),
(17, 28, 2),
(18, 17, 7),
(19, 3, 25),
(20, 4, 14),
(20, 10, 13),
(22, 4, 17),
(22, 5, 6),
(22, 9, 3),
(22, 19, 22),
(23, 24, 7),
(24, 7, 24),
(25, 8, 5),
(25, 25, 15),
(26, 7, 9),
(27, 11, 5),
(30, 1, 4),
(31, 21, 2),
(32, 27, 12),
(33, 7, 3),
(34, 20, 12),
(35, 16, 6),
(36, 13, 16),
(37, 1, 10),
(42, 7, 6),
(42, 12, 15),
(42, 12, 17),
(43, 27, 10),
(44, 7, 2),
(44, 14, 11),
(44, 17, 3),
(45, 8, 15),
(46, 3, 1),
(46, 5, 12),
(46, 14, 23),
(46, 17, 23),
(48, 22, 17),
(48, 24, 12),
(49, 1, 5),
(49, 7, 23),
(51, 7, 4),
(52, 2, 10),
(52, 20, 21),
(53, 7, 21),
(53, 15, 13),
(53, 16, 4),
(53, 23, 18),
(56, 29, 8),
(57, 19, 22),
(57, 20, 14),
(57, 26, 6),
(58, 15, 18),
(58, 25, 12),
(60, 7, 14),
(60, 12, 15),
(60, 21, 12),
(61, 13, 11),
(62, 17, 9),
(62, 20, 24),
(64, 9, 12),
(65, 3, 5),
(66, 4, 11),
(67, 26, 23),
(68, 2, 7),
(68, 2, 20),
(70, 10, 6),
(70, 23, 17),
(72, 1, 5),
(72, 6, 12),
(72, 9, 23),
(73, 4, 5),
(74, 11, 17),
(75, 21, 10),
(76, 13, 3),
(76, 16, 23),
(78, 23, 11),
(79, 4, 6),
(79, 8, 8),
(81, 15, 4),
(82, 11, 22),
(82, 20, 5),
(82, 24, 4),
(85, 6, 1),
(85, 7, 1),
(85, 7, 9),
(86, 7, 12),
(87, 30, 4),
(88, 19, 18),
(88, 30, 15),
(89, 28, 5),
(90, 14, 9),
(90, 19, 6),
(91, 14, 14),
(91, 21, 17),
(92, 11, 24),
(95, 1, 7),
(95, 21, 9),
(97, 8, 22),
(97, 27, 1),
(97, 28, 8),
(99, 11, 1),
(99, 15, 7),
(101, 16, 10),
(102, 7, 14),
(103, 14, 12),
(103, 26, 10),
(104, 14, 1),
(105, 12, 9),
(106, 15, 16),
(106, 17, 1),
(108, 5, 5),
(109, 4, 13),
(109, 20, 21),
(110, 4, 8),
(112, 17, 20),
(112, 21, 24),
(112, 27, 11),
(117, 19, 20),
(120, 4, 20),
(120, 26, 4),
(123, 4, 8),
(123, 8, 14),
(123, 16, 3),
(124, 10, 3),
(124, 10, 4),
(124, 14, 1),
(125, 25, 15);

PRINT 'Populated the Properties-In-Collections relationship table.';

/* =====================================
=  Filling out the booking status LUT  =
===================================== */

INSERT INTO
reservations.BookingStatus (
    StatusName,
    StatusDescription
)
VALUES

/* These are 10 primary booking statuses
======================================= */

/* Pre-approval statuses
===================================== */

('Pending', 'The booking is currently awaiting host approval and/or an agreement between both parties.'),
('Awaiting Invite Accept', 'The booking was proposed by the host or a system offer, and is currently awaiting the potential customer''s acceptance.'),

/* Approved/Ongoing statuses
===================================== */

('Confirmed', 'The booking is confirmed and ready, awaiting the booking date.'),
('In Progress', 'The booking is currently in progress - i.e. the customers are staying at the property at this stage during the booking dates.'),
('Awaiting Payment', 'The booking is awaiting the total/remaining payment.'),
('Completed', 'The booking has been completed and paid off completely.'),

/* Unexpected ending statuses
===================================== */

('Declined', 'The booking, prior to being confirmed, was either declined by the host when requested by the customer, or the host''s/system''s invite was declined by the customer.'),
('Expired', 'The booking received no response by either party during the expected and allowed timeframe for bookings.'),
('Cancelled', 'The already-confirmed booking was cancelled by either the host or customer prior to or on the first day of the booking date.'),
('Truncated', 'The originally in-progress booking was cut short, due to dispute, natural disasters, personal reasons, or any other cause.');

PRINT 'Populated Booking Status LUT.';

/* ========================================
= Filling out the Property Bookings table =
======================================== */

INSERT INTO
reservations.PropertyBookings (
    BookerId,
    PropertyId,
    BookingStatusId,
    StartDate,
    EndDate
)
VALUES

/* These are 100 bookings across the 30 properties and 25 users
=============================================================== */

(1, 10, 4, '2025-10-03', '2025-11-02'),
(1, 23, 9, '2026-06-20', '2026-06-24'),
(2, 11, 4, '2025-09-14', '2025-10-11'),
(3, 18, 2, '2026-05-02', '2026-05-06'),
(3, 25, 5, '2026-04-29', '2026-05-04'),
(3, 28, 5, '2025-09-07', '2025-09-22'),
(3, 30, 7, '2025-11-07', '2025-11-29'),
(4, 11, 5, '2026-02-20', '2026-03-18'),
(4, 18, 5, '2025-09-16', '2025-10-05'),
(4, 25, 6, '2026-05-15', '2026-06-13'),
(5, 16, 7, '2025-12-12', '2025-12-21'),
(5, 18, 4, '2026-04-24', '2026-04-27'),
(5, 25, 6, '2026-04-25', '2026-05-21'),
(6, 11, 10, '2025-12-31', '2026-01-14'),
(6, 15, 10, '2025-11-13', '2025-12-12'),
(6, 20, 5, '2025-09-18', '2025-10-14'),
(6, 24, 2, '2025-11-01', '2025-11-25'),
(6, 24, 8, '2025-08-30', '2025-09-23'),
(6, 30, 7, '2026-03-18', '2026-04-12'),
(7, 4, 10, '2026-05-16', '2026-06-11'),
(7, 8, 2, '2026-06-03', '2026-06-21'),
(7, 10, 5, '2026-06-21', '2026-07-14'),
(7, 14, 5, '2025-08-25', '2025-09-01'),
(7, 19, 1, '2025-09-22', '2025-10-02'),
(7, 21, 3, '2026-06-05', '2026-06-26'),
(7, 25, 8, '2026-06-16', '2026-06-24'),
(8, 16, 8, '2026-04-13', '2026-05-07'),
(8, 25, 10, '2025-11-21', '2025-11-26'),
(9, 5, 4, '2026-03-24', '2026-04-03'),
(9, 9, 3, '2025-11-24', '2025-12-16'),
(9, 18, 3, '2026-07-31', '2026-08-24'),
(9, 29, 1, '2025-09-20', '2025-10-03'),
(9, 30, 4, '2026-04-05', '2026-04-23'),
(10, 8, 8, '2026-07-26', '2026-08-16'),
(10, 8, 10, '2026-06-29', '2026-07-28'),
(10, 23, 6, '2026-02-28', '2026-03-06'),
(10, 29, 3, '2026-03-31', '2026-04-28'),
(11, 9, 4, '2026-07-18', '2026-07-25'),
(11, 15, 8, '2025-10-13', '2025-10-17'),
(12, 3, 3, '2026-01-19', '2026-01-31'),
(12, 14, 5, '2026-05-26', '2026-05-31'),
(12, 14, 6, '2025-10-30', '2025-11-12'),
(12, 29, 5, '2026-01-23', '2026-02-12'),
(13, 3, 9, '2026-03-23', '2026-04-14'),
(13, 10, 3, '2026-07-03', '2026-07-06'),
(13, 24, 3, '2025-08-27', '2025-09-24'),
(13, 30, 7, '2025-11-12', '2025-11-18'),
(14, 3, 4, '2026-07-03', '2026-07-08'),
(14, 3, 5, '2026-04-26', '2026-05-17'),
(14, 16, 6, '2026-07-25', '2026-08-10'),
(14, 20, 4, '2026-06-07', '2026-06-12'),
(15, 8, 7, '2026-04-05', '2026-04-10'),
(15, 10, 3, '2025-12-21', '2025-12-25'),
(15, 18, 10, '2025-08-22', '2025-08-26'),
(15, 22, 9, '2026-07-23', '2026-08-11'),
(16, 1, 10, '2025-12-28', '2026-01-26'),
(16, 6, 1, '2026-03-12', '2026-03-25'),
(16, 6, 9, '2025-10-21', '2025-11-01'),
(16, 14, 8, '2025-08-18', '2025-08-21'),
(16, 17, 1, '2026-02-16', '2026-02-23'),
(17, 21, 4, '2026-04-19', '2026-05-04'),
(18, 1, 7, '2025-09-04', '2025-09-11'),
(18, 5, 1, '2025-12-23', '2026-01-14'),
(18, 7, 6, '2026-04-19', '2026-05-07'),
(18, 22, 3, '2025-12-01', '2025-12-16'),
(18, 23, 7, '2025-10-26', '2025-11-17'),
(19, 4, 6, '2026-07-10', '2026-07-25'),
(19, 9, 1, '2026-07-04', '2026-08-03'),
(19, 9, 7, '2026-02-08', '2026-03-09'),
(19, 10, 7, '2026-04-13', '2026-05-10'),
(19, 11, 7, '2026-06-03', '2026-06-06'),
(19, 15, 6, '2026-01-22', '2026-02-20'),
(19, 16, 4, '2026-02-26', '2026-03-24'),
(20, 7, 9, '2026-03-03', '2026-03-23'),
(20, 11, 2, '2026-08-06', '2026-09-02'),
(20, 12, 6, '2026-07-13', '2026-07-29'),
(20, 12, 9, '2026-05-21', '2026-05-26'),
(20, 13, 7, '2026-01-08', '2026-01-28'),
(20, 23, 3, '2026-02-04', '2026-02-12'),
(20, 25, 1, '2026-01-30', '2026-02-23'),
(21, 6, 4, '2026-05-10', '2026-05-31'),
(21, 12, 2, '2025-11-11', '2025-11-12'),
(21, 16, 8, '2026-02-16', '2026-02-24'),
(22, 9, 1, '2026-05-21', '2026-05-27'),
(22, 30, 2, '2026-06-25', '2026-07-01'),
(23, 2, 6, '2025-10-29', '2025-11-04'),
(23, 11, 5, '2025-11-24', '2025-12-05'),
(23, 17, 2, '2026-02-16', '2026-03-18'),
(23, 26, 4, '2025-12-08', '2025-12-27'),
(23, 27, 10, '2025-10-31', '2025-11-27'),
(24, 8, 1, '2025-11-04', '2025-11-15'),
(24, 10, 3, '2025-09-26', '2025-10-23'),
(24, 15, 1, '2026-02-12', '2026-02-19'),
(24, 29, 10, '2026-02-07', '2026-02-13'),
(24, 30, 9, '2025-10-24', '2025-11-01'),
(25, 22, 1, '2025-11-27', '2025-12-19'),
(25, 22, 5, '2026-04-13', '2026-05-03'),
(25, 24, 10, '2026-02-24', '2026-03-24'),
(25, 25, 2, '2026-05-17', '2026-06-07'),
(25, 25, 9, '2025-12-18', '2026-01-06');

PRINT 'Populated Property Bookings table.';

/* =======================================
= Filling out the booking guest type LUT =
======================================= */

INSERT INTO
reservations.GuestType (
    TypeName,
    TypeDescription
)
VALUES

/* These are 4 primary guest types
===================================== */

-- ? Human guest types
('Infant', 'A guest at or under the age of 2. This guest type is usually not paid and/or does not add to the guest count out of the maximum, but property-to-property policies are at the host''s discretion.'),
('Child', 'A guest between the ages of 2 and 12. This guest type can have lower booking prices or not, up to the discretion of the host. Properties may also disallow children.'),
('Adult', 'A guest above the age of 13 (in terms of guest occupancy). The person making the booking still has to be a legal adult, however (above the age of 18).'),

-- ? Pet/animal guest type
('Pet', 'An animal companion, including a dog, cat, bird, etc. Hosts may allow or disallow pets, or there may be attached conditions and policies regarding some or all types of pets.');

PRINT 'Populated Booking Guest Type LUT.';

/* ==================================================
= Filling out the booking-guest relationship table. =
================================================== */

INSERT INTO
reservations.BookingGuests (
    BookingId,
    GuestTypeId,
    Quantity
)
VALUES

/* These are 200 assigned booking guest records
=============================================== */

(1, 2, 2),
(2, 1, 6),
(2, 2, 4),
(2, 3, 4),
(3, 1, 1),
(3, 4, 6),
(4, 1, 2),
(5, 2, 5),
(5, 3, 2),
(5, 4, 3),
(6, 1, 1),
(6, 2, 3),
(7, 4, 3),
(8, 2, 2),
(8, 3, 1),
(9, 1, 3),
(9, 3, 6),
(10, 1, 2),
(10, 2, 1),
(10, 3, 4),
(11, 2, 2),
(11, 3, 3),
(11, 4, 6),
(12, 2, 4),
(12, 3, 2),
(13, 1, 2),
(13, 2, 1),
(13, 4, 2),
(14, 1, 4),
(14, 2, 1),
(15, 1, 6),
(15, 2, 3),
(15, 3, 2),
(15, 4, 6),
(16, 3, 6),
(16, 4, 2),
(17, 1, 4),
(17, 2, 3),
(17, 3, 4),
(18, 2, 3),
(18, 3, 4),
(19, 1, 2),
(19, 3, 3),
(20, 1, 6),
(20, 2, 5),
(20, 3, 3),
(21, 1, 5),
(21, 3, 1),
(22, 3, 3),
(23, 1, 4),
(23, 2, 1),
(23, 3, 3),
(24, 4, 1),
(25, 3, 2),
(26, 1, 3),
(27, 2, 2),
(28, 2, 2),
(29, 1, 3),
(30, 2, 4),
(30, 3, 2),
(30, 4, 2),
(31, 2, 1),
(31, 3, 1),
(31, 4, 6),
(32, 1, 1),
(32, 3, 3),
(33, 1, 3),
(33, 2, 3),
(34, 3, 1),
(34, 4, 3),
(35, 4, 4),
(36, 2, 3),
(37, 1, 5),
(37, 2, 6),
(38, 2, 4),
(38, 4, 2),
(39, 1, 1),
(39, 4, 2),
(40, 3, 5),
(40, 4, 1),
(41, 1, 5),
(41, 3, 1),
(42, 2, 3),
(43, 1, 4),
(43, 4, 2),
(44, 3, 4),
(45, 1, 3),
(45, 4, 4),
(46, 1, 1),
(46, 2, 3),
(47, 3, 1),
(47, 4, 1),
(48, 1, 3),
(48, 2, 2),
(48, 4, 6),
(49, 1, 4),
(49, 3, 4),
(50, 2, 3),
(50, 4, 3),
(51, 3, 4),
(52, 2, 1),
(52, 3, 5),
(53, 2, 4),
(53, 3, 2),
(54, 3, 2),
(55, 1, 4),
(56, 2, 2),
(57, 1, 2),
(57, 3, 3),
(58, 1, 5),
(58, 2, 3),
(58, 3, 6),
(58, 4, 2),
(59, 1, 2),
(59, 2, 3),
(59, 3, 3),
(60, 1, 2),
(61, 4, 1),
(62, 2, 3),
(62, 4, 4),
(63, 1, 1),
(63, 2, 4),
(63, 3, 4),
(63, 4, 4),
(64, 1, 2),
(64, 3, 3),
(65, 1, 6),
(65, 4, 2),
(66, 4, 5),
(67, 1, 1),
(67, 2, 3),
(67, 3, 6),
(68, 3, 3),
(69, 1, 6),
(70, 2, 3),
(70, 3, 4),
(71, 4, 5),
(72, 1, 5),
(72, 4, 5),
(73, 2, 6),
(74, 1, 2),
(74, 2, 4),
(74, 3, 1),
(75, 1, 5),
(75, 3, 1),
(76, 1, 6),
(76, 2, 4),
(76, 3, 6),
(77, 2, 3),
(77, 3, 1),
(78, 3, 5),
(79, 2, 1),
(79, 3, 3),
(80, 1, 1),
(80, 2, 3),
(80, 3, 6),
(80, 4, 3),
(81, 1, 3),
(81, 2, 5),
(81, 3, 1),
(82, 1, 4),
(82, 2, 3),
(82, 4, 1),
(83, 4, 4),
(84, 1, 1),
(84, 2, 1),
(84, 3, 4),
(84, 4, 2),
(85, 1, 6),
(85, 3, 1),
(86, 1, 4),
(86, 3, 5),
(87, 1, 6),
(87, 3, 1),
(88, 2, 3),
(88, 4, 6),
(89, 2, 6),
(89, 3, 1),
(90, 1, 3),
(90, 4, 6),
(91, 1, 3),
(91, 4, 5),
(92, 2, 3),
(92, 3, 6),
(93, 1, 6),
(93, 4, 1),
(94, 4, 3),
(95, 1, 2),
(95, 2, 4),
(95, 3, 2),
(95, 4, 3),
(96, 2, 5),
(96, 4, 3),
(97, 2, 6),
(97, 4, 3),
(98, 1, 1),
(98, 3, 2),
(99, 3, 2),
(99, 4, 3),
(100, 3, 6);

PRINT 'Populated Booking-Guest relationship table.';

/* ======================================
=  Filling out the payment purpose LUT  =
====================================== */

INSERT INTO
reservations.PaymentPurpose (
    PurposeName,
    PurposeDescription
)
VALUES

/* These are 13 different payment purposes
========================================== */

/* Guest payment purposes
===================================== */

('Booking Deposit', 'The initial partial down-payment for a booking, if the booking is not paid for in full.'),
('Booking Balance', 'The final (or only) payment collected prior to guest check-in that zeroes out the amount due.'),
('Instalment', 'One payment in a recurring payment schedule for long-term or split-payment bookings.'),
('Security Deposit Hold', 'A temporary financial deposit to protect against property damage, returned after the booking or used to repair customer-induced damage.'),
('Additional Charge', 'Post-booking adjustments or extensions during a booking''s stay.'),

/* Host withdrawals
===================================== */

('Payout', 'The main delivery of held payments to the property host after the appropriate time.'),
('Co-Host Payout', 'An automated secondary payout distributed directly to a designated co-host.'),
('Host Referral Bonus', 'Financial bonuses given to hosts for referring new hosts.'),

/* Correction or reimbursements
===================================== */

('Refund', 'A complete or partial return of funds to a guest after a cancellation, change in fees, or dispute resolution.'),
('Security Deposit Claim', 'Withdrawals from a Security Deposit Hold to reimburse a host for property damage.'),
('Resolution Payout', 'A financial adjustment or reimbursement mediated and distributed by customer support.'),

/* Platform or policy payments
===================================== */

('Platform Commission Fee', 'A small portion of internal transaction amounts given to the platform.'),
('Tax', 'Occupancy, tourist, or local taxes collected by the platform for legal purposes.');

PRINT 'Populated Payment Purpose LUT.';

/* =====================================
=  Filling out the payment status LUT  =
===================================== */

INSERT INTO
reservations.PaymentStatus (
    StatusName,
    StatusDescription
)
VALUES

/* These are 10 primary payment statuses
===================================== */

/* Usual/Correct statuses, often in order
======================================== */

('Pending', 'The payment request has been submitted but is pending authorisation by the bank network, wallet provider, or other platform.'),
('Authorized', 'The payment has been authorised by the platform but not withdrawn yet.'),
('Captured', 'The payment has been successfully withdrawn from the customer and and is with the platform.'),
('Delivered', 'The final payout has been successfully transferred to the host (or other target payee), and operations are complete.'),

/* Errored/Halted statuses
===================================== */

('Failed', 'The payment fell through from the payment gateway or bank due to system or processing errors.'),
('Cancelled', 'The payment process was intentionally cancelled by the user or system after the process had begun.'),

/* Corrective/Problematic statuses
===================================== */

('On Hold', 'The payment are temporarily held by risk operations or customer service during a dispute or other system error.'),
('Refunded', 'The payment has been returned to the original payer.'),
('Rolled Back', 'The payment authorisation was voided before the funds were delivered (but after they had been captured), aborting and rolling back the payment.'),
('Disputed', 'The payer or payee initiated a formal chargeback dispute with their financial provider, or there is a fund disagreement between both parties.');

PRINT 'Populated Payment Status LUT.';

/* =====================================
=    Filling out the payments table    =
===================================== */

INSERT INTO
reservations.Payments (
    AssocBookingId,
    PaymentMethodId,
    PaymentPurposeId,
    PaymentStatusId,
    PayerId,
    PayeeId,
    PaidAmount,
    PaidOn,
    PaymentComment
)
VALUES

/* These are 200 recorded payments
===================================== */

(
    1,
    28,
    7,
    3,
    23,
    3,
    2056.0,
    '2026-02-08 16:40:09',
    'Nulla mollis molestie lorem. Quisque ut erat.'
),
(
    2,
    7,
    10,
    1,
    20,
    2,
    3850.21,
    '2026-03-05 14:00:45',
    'Etiam vel augue. Vestibulum rutrum rutrum neque.'
),
(
    2,
    22,
    4,
    5,
    17,
    2,
    2487.18,
    '2026-08-12 14:49:27',
    ''
),
(
    3,
    43,
    11,
    4,
    16,
    8,
    3219.59,
    '2025-12-27 10:59:46',
    'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
),
(
    4,
    4,
    8,
    4,
    21,
    13,
    3396.81,
    '2026-05-27 15:41:53',
    ''
),
(
    5,
    4,
    4,
    9,
    18,
    22,
    2286.62,
    '2025-10-06 03:08:18',
    'Phasellus in felis. Donec semper sapien a libero.'
),
(
    5,
    3,
    8,
    8,
    10,
    22,
    4249.83,
    '2026-01-09 06:53:11',
    ''
),
(
    5,
    43,
    12,
    8,
    3,
    9,
    1722.44,
    '2026-03-01 02:07:28',
    ''
),
(
    7,
    49,
    3,
    7,
    13,
    15,
    2566.5,
    '2025-09-29 09:59:11',
    'Duis mattis egestas metus. Aenean fermentum.'
),
(
    7,
    21,
    9,
    3,
    24,
    13,
    4696.21,
    '2025-11-01 08:38:18',
    ''
),
(
    7,
    7,
    3,
    5,
    6,
    12,
    4352.1,
    '2026-02-01 10:44:33',
    'Maecenas rhoncus aliquam lacus.'
),
(
    8,
    3,
    5,
    3,
    13,
    3,
    215.17,
    '2025-09-08 23:06:22',
    'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.'
),
(
    8,
    5,
    3,
    6,
    10,
    21,
    3327.36,
    '2025-10-10 23:37:56',
    'Nullam porttitor lacus at turpis.'
),
(
    8,
    22,
    4,
    8,
    22,
    8,
    864.09,
    '2025-12-07 01:38:28',
    'Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.'
),
(
    8,
    43,
    8,
    10,
    12,
    25,
    3981.69,
    '2026-06-01 18:07:33',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.'
),
(
    9,
    36,
    6,
    7,
    25,
    12,
    3495.19,
    '2026-01-21 06:44:02',
    ''
),
(
    10,
    46,
    12,
    8,
    16,
    4,
    149.48,
    '2026-03-14 09:29:05',
    'Phasellus in felis. Donec semper sapien a libero. Nam dui.'
),
(
    10,
    11,
    11,
    2,
    3,
    5,
    3068.92,
    '2026-05-14 12:14:49',
    'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'
),
(
    10,
    9,
    3,
    2,
    18,
    22,
    2108.12,
    '2026-07-02 12:44:00',
    'Integer a nibh. In quis justo.'
),
(
    11,
    36,
    2,
    9,
    24,
    23,
    504.85,
    '2026-06-05 11:59:56',
    'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.'
),
(
    12,
    14,
    2,
    8,
    20,
    3,
    1235.65,
    '2026-01-14 16:02:50',
    ''
),
(
    13,
    14,
    12,
    1,
    20,
    11,
    3905.15,
    '2025-12-10 19:53:50',
    'Cras in purus eu magna vulputate luctus.'
),
(
    13,
    3,
    12,
    6,
    13,
    24,
    4531.2,
    '2026-06-10 21:39:13',
    'Curabitur convallis.'
),
(
    14,
    26,
    2,
    5,
    10,
    8,
    2925.09,
    '2026-01-07 02:49:16',
    'Etiam justo. Etiam pretium iaculis justo.'
),
(
    15,
    4,
    7,
    2,
    12,
    16,
    4633.39,
    '2025-10-09 14:46:41',
    'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.'
),
(
    16,
    27,
    9,
    4,
    9,
    1,
    106.05,
    '2025-09-15 08:29:50',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'
),
(
    16,
    28,
    2,
    6,
    18,
    16,
    1023.95,
    '2026-01-17 06:15:56',
    'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.'
),
(
    16,
    6,
    8,
    5,
    3,
    17,
    4563.36,
    '2026-07-26 07:14:20',
    'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.'
),
(
    17,
    1,
    4,
    6,
    4,
    14,
    1952.68,
    '2026-03-25 21:38:32',
    'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.'
),
(
    17,
    14,
    10,
    10,
    9,
    22,
    4498.48,
    '2026-05-13 18:38:46',
    'Pellentesque viverra pede ac diam.'
),
(
    18,
    36,
    10,
    7,
    23,
    3,
    662.06,
    '2025-09-13 08:22:12',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.'
),
(
    18,
    32,
    10,
    2,
    17,
    10,
    1014.33,
    '2025-10-30 10:10:36',
    ''
),
(
    19,
    39,
    9,
    7,
    7,
    24,
    1479.76,
    '2025-12-11 14:13:43',
    'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.'
),
(
    19,
    34,
    10,
    5,
    22,
    24,
    4482.69,
    '2026-05-07 02:06:22',
    'Aliquam erat volutpat. In congue. Etiam justo.'
),
(
    21,
    8,
    2,
    9,
    13,
    7,
    4715.88,
    '2026-01-21 10:00:57',
    'In sagittis dui vel nisl.'
),
(
    22,
    16,
    2,
    1,
    23,
    20,
    1149.14,
    '2026-01-18 11:24:45',
    'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.'
),
(
    23,
    19,
    5,
    3,
    11,
    21,
    2416.72,
    '2026-05-11 13:20:56',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.'
),
(
    26,
    19,
    11,
    2,
    7,
    5,
    604.19,
    '2025-10-31 11:23:28',
    'Suspendisse potenti. Cras in purus eu magna vulputate luctus.'
),
(
    26,
    26,
    4,
    4,
    24,
    20,
    2874.65,
    '2026-03-23 21:58:27',
    'Integer tincidunt ante vel ipsum.'
),
(
    26,
    23,
    10,
    8,
    16,
    10,
    2583.45,
    '2026-07-09 09:47:45',
    'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'
),
(
    26,
    23,
    8,
    8,
    24,
    22,
    2187.91,
    '2026-07-12 04:15:08',
    ''
),
(
    27,
    24,
    10,
    9,
    19,
    25,
    1380.67,
    '2025-12-16 16:28:54',
    'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.'
),
(
    27,
    36,
    8,
    9,
    11,
    24,
    559.8,
    '2026-05-06 22:36:43',
    'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'
),
(
    27,
    19,
    8,
    3,
    25,
    21,
    2169.92,
    '2026-07-05 21:39:23',
    'Vivamus in felis eu sapien cursus vestibulum.'
),
(
    28,
    15,
    4,
    2,
    17,
    3,
    2247.4,
    '2025-12-19 12:18:16',
    'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'
),
(
    29,
    15,
    9,
    2,
    25,
    12,
    2553.52,
    '2025-08-23 10:58:07',
    ''
),
(
    29,
    7,
    11,
    4,
    1,
    9,
    1475.51,
    '2025-09-11 05:49:11',
    'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.'
),
(
    30,
    5,
    7,
    7,
    13,
    11,
    3663.75,
    '2025-09-07 00:57:48',
    ''
),
(
    30,
    31,
    8,
    9,
    21,
    17,
    4754.49,
    '2026-01-22 18:28:26',
    ''
),
(
    30,
    17,
    6,
    2,
    6,
    8,
    3480.85,
    '2026-05-23 18:37:54',
    'Duis ac nibh.'
),
(
    30,
    44,
    3,
    9,
    4,
    13,
    407.99,
    '2026-07-18 22:18:33',
    ''
),
(
    31,
    10,
    8,
    10,
    4,
    17,
    2127.03,
    '2026-05-19 08:50:17',
    'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.'
),
(
    31,
    27,
    12,
    2,
    21,
    24,
    3693.36,
    '2026-02-26 22:02:31',
    ''
),
(
    31,
    35,
    2,
    1,
    17,
    24,
    825.5,
    '2026-07-13 03:41:25',
    'Curabitur in libero ut massa volutpat convallis.'
),
(
    32,
    38,
    6,
    9,
    19,
    5,
    3677.05,
    '2026-06-24 16:05:17',
    ''
),
(
    33,
    45,
    3,
    1,
    22,
    6,
    3985.69,
    '2026-01-09 02:09:45',
    'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.'
),
(
    34,
    42,
    9,
    6,
    5,
    2,
    3324.5,
    '2026-04-20 21:11:31',
    'Suspendisse accumsan tortor quis turpis. Sed ante.'
),
(
    35,
    48,
    6,
    9,
    6,
    16,
    507.74,
    '2025-11-20 19:07:58',
    'Nam tristique tortor eu pede.'
),
(
    35,
    8,
    5,
    9,
    22,
    15,
    3050.88,
    '2025-12-21 23:48:18',
    'Proin eu mi. Nulla ac enim.'
),
(
    35,
    8,
    1,
    6,
    2,
    19,
    1021.41,
    '2026-01-31 18:05:24',
    'Curabitur in libero ut massa volutpat convallis.'
),
(
    35,
    49,
    12,
    7,
    5,
    25,
    3594.96,
    '2026-02-27 07:29:26',
    'Fusce posuere felis sed lacus.'
),
(
    36,
    40,
    3,
    5,
    23,
    20,
    4816.23,
    '2026-08-08 01:58:04',
    'In sagittis dui vel nisl.'
),
(
    37,
    39,
    13,
    2,
    1,
    16,
    2048.88,
    '2025-11-08 06:31:41',
    'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'
),
(
    38,
    16,
    11,
    4,
    2,
    23,
    3918.97,
    '2025-09-02 03:01:24',
    'Nulla tellus.'
),
(
    39,
    48,
    11,
    8,
    11,
    14,
    1537.81,
    '2025-10-11 18:19:42',
    'Etiam faucibus cursus urna. Ut tellus.'
),
(
    39,
    6,
    8,
    8,
    3,
    5,
    3664.7,
    '2026-01-01 01:05:50',
    'Morbi non quam nec dui luctus rutrum.'
),
(
    40,
    7,
    10,
    5,
    10,
    5,
    1766.39,
    '2026-03-22 03:29:50',
    'Nulla nisl.'
),
(
    41,
    1,
    8,
    1,
    20,
    18,
    3165.26,
    '2026-03-19 18:51:38',
    'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.'
),
(
    41,
    39,
    4,
    1,
    18,
    3,
    3096.74,
    '2026-07-19 05:05:40',
    ''
),
(
    42,
    13,
    3,
    7,
    21,
    16,
    4181.35,
    '2025-11-08 01:40:32',
    ''
),
(
    42,
    12,
    11,
    10,
    1,
    16,
    3738.43,
    '2026-03-10 07:33:36',
    'Proin at turpis a pede posuere nonummy.'
),
(
    43,
    19,
    10,
    4,
    11,
    9,
    31.43,
    '2026-01-25 20:07:52',
    'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.'
),
(
    43,
    33,
    8,
    8,
    22,
    11,
    1046.27,
    '2026-08-10 14:36:39',
    'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.'
),
(
    44,
    29,
    10,
    10,
    20,
    8,
    576.26,
    '2026-01-03 14:56:03',
    'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.'
),
(
    44,
    50,
    13,
    5,
    4,
    23,
    2461.01,
    '2026-04-13 07:32:17',
    'Proin eu mi.'
),
(
    44,
    47,
    11,
    3,
    6,
    3,
    1518.04,
    '2026-06-22 15:03:42',
    'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.'
),
(
    45,
    18,
    8,
    2,
    20,
    13,
    710.17,
    '2025-11-08 01:28:03',
    ''
),
(
    45,
    46,
    12,
    4,
    23,
    20,
    4031.47,
    '2026-02-04 13:50:13',
    'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.'
),
(
    45,
    36,
    1,
    9,
    7,
    1,
    1414.34,
    '2026-02-18 10:22:04',
    'Praesent blandit.'
),
(
    45,
    16,
    13,
    9,
    22,
    19,
    702.9,
    '2026-02-21 10:53:40',
    ''
),
(
    45,
    1,
    2,
    5,
    24,
    21,
    3000.22,
    '2026-05-02 16:26:48',
    'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.'
),
(
    46,
    34,
    1,
    8,
    15,
    13,
    805.19,
    '2026-05-04 10:19:43',
    ''
),
(
    46,
    39,
    8,
    9,
    1,
    14,
    915.7,
    '2026-07-12 20:51:05',
    ''
),
(
    47,
    43,
    7,
    5,
    20,
    3,
    3708.66,
    '2026-05-14 08:53:46',
    'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'
),
(
    48,
    19,
    11,
    5,
    16,
    15,
    3808.73,
    '2026-08-06 08:06:49',
    'Curabitur in libero ut massa volutpat convallis.'
),
(
    48,
    49,
    5,
    8,
    24,
    2,
    1846.24,
    '2025-09-13 12:11:48',
    'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.'
),
(
    49,
    10,
    13,
    7,
    24,
    19,
    3794.43,
    '2026-03-16 20:11:54',
    'Pellentesque at nulla.'
),
(
    50,
    33,
    5,
    1,
    9,
    2,
    1010.63,
    '2026-04-06 14:49:02',
    'Praesent blandit.'
),
(
    50,
    32,
    5,
    8,
    23,
    2,
    3033.97,
    '2026-04-14 19:45:09',
    'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.'
),
(
    51,
    15,
    1,
    5,
    8,
    19,
    1369.24,
    '2026-04-27 01:36:17',
    'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'
),
(
    51,
    40,
    9,
    2,
    3,
    12,
    366.55,
    '2026-05-29 08:04:26',
    'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.'
),
(
    52,
    22,
    5,
    10,
    24,
    1,
    2221.96,
    '2026-06-13 23:47:45',
    'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.'
),
(
    53,
    46,
    13,
    10,
    1,
    9,
    763.7,
    '2026-01-24 16:07:28',
    'Nam dui.'
),
(
    53,
    33,
    8,
    5,
    4,
    17,
    1821.83,
    '2026-04-05 01:14:29',
    'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.'
),
(
    53,
    31,
    3,
    10,
    1,
    18,
    4925.95,
    '2026-04-23 13:22:27',
    'Morbi porttitor lorem id ligula.'
),
(
    54,
    23,
    9,
    3,
    1,
    2,
    3742.51,
    '2025-10-05 21:56:59',
    'In quis justo. Maecenas rhoncus aliquam lacus.'
),
(
    54,
    4,
    3,
    2,
    20,
    7,
    1922.73,
    '2025-11-06 10:34:31',
    'Mauris ullamcorper purus sit amet nulla.'
),
(
    54,
    35,
    4,
    10,
    11,
    2,
    3757.26,
    '2025-11-08 11:31:57',
    'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'
),
(
    54,
    4,
    2,
    9,
    9,
    21,
    840.0,
    '2026-01-25 07:15:51',
    'Etiam justo.'
),
(
    54,
    11,
    3,
    6,
    22,
    25,
    2216.64,
    '2026-03-14 15:21:44',
    'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'
),
(
    54,
    46,
    11,
    4,
    9,
    22,
    4829.18,
    '2026-04-20 06:13:31',
    ''
),
(
    54,
    42,
    13,
    9,
    21,
    17,
    4414.41,
    '2026-04-21 22:32:55',
    ''
),
(
    55,
    26,
    10,
    9,
    19,
    5,
    569.63,
    '2025-08-27 12:26:58',
    'Morbi a ipsum. Integer a nibh. In quis justo.'
),
(
    55,
    10,
    2,
    1,
    4,
    9,
    2115.94,
    '2026-01-23 07:58:36',
    ''
),
(
    55,
    14,
    2,
    2,
    17,
    3,
    2319.59,
    '2026-05-16 18:41:41',
    ''
),
(
    55,
    3,
    8,
    2,
    23,
    1,
    4560.87,
    '2026-05-28 19:41:07',
    'Duis mattis egestas metus. Aenean fermentum.'
),
(
    55,
    22,
    7,
    1,
    4,
    11,
    4434.6,
    '2026-06-04 21:55:28',
    'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.'
),
(
    56,
    23,
    8,
    6,
    24,
    25,
    803.71,
    '2025-10-08 16:44:50',
    'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.'
),
(
    57,
    47,
    4,
    5,
    7,
    22,
    4810.51,
    '2026-05-12 05:04:05',
    'Mauris lacinia sapien quis libero.'
),
(
    58,
    49,
    13,
    9,
    6,
    21,
    286.28,
    '2025-12-06 10:08:44',
    ''
),
(
    58,
    39,
    6,
    7,
    24,
    10,
    1369.19,
    '2026-06-07 08:56:49',
    'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.'
),
(
    59,
    9,
    3,
    3,
    11,
    12,
    1777.97,
    '2026-04-05 08:27:16',
    'Nunc purus. Phasellus in felis. Donec semper sapien a libero.'
),
(
    59,
    33,
    3,
    9,
    23,
    17,
    2434.17,
    '2026-05-28 02:34:11',
    'Maecenas rhoncus aliquam lacus.'
),
(
    60,
    4,
    4,
    7,
    4,
    23,
    2377.51,
    '2025-08-23 23:27:01',
    'Donec ut mauris eget massa tempor convallis.'
),
(
    60,
    9,
    1,
    1,
    1,
    21,
    3421.31,
    '2025-10-17 16:57:53',
    ''
),
(
    60,
    34,
    7,
    8,
    5,
    18,
    4921.14,
    '2025-10-24 23:23:23',
    'Duis consequat dui nec nisi volutpat eleifend.'
),
(
    62,
    11,
    13,
    7,
    7,
    8,
    54.11,
    '2026-01-06 18:22:35',
    ''
),
(
    62,
    3,
    6,
    2,
    14,
    12,
    428.48,
    '2026-01-23 14:55:36',
    ''
),
(
    62,
    39,
    1,
    8,
    20,
    25,
    3130.95,
    '2026-04-15 21:35:22',
    'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.'
),
(
    62,
    34,
    3,
    2,
    16,
    1,
    1454.93,
    '2026-05-05 16:51:01',
    'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'
),
(
    63,
    44,
    13,
    9,
    8,
    24,
    2759.36,
    '2025-10-19 04:42:17',
    'Ut at dolor quis odio consequat varius. Integer ac leo.'
),
(
    63,
    47,
    2,
    9,
    23,
    14,
    2912.5,
    '2025-10-29 17:01:59',
    'Duis mattis egestas metus. Aenean fermentum.'
),
(
    63,
    13,
    12,
    10,
    20,
    22,
    4321.7,
    '2026-03-30 11:01:28',
    'Duis at velit eu est congue elementum.'
),
(
    64,
    1,
    13,
    2,
    6,
    15,
    1369.88,
    '2026-01-24 13:18:46',
    ''
),
(
    64,
    5,
    2,
    7,
    25,
    18,
    952.39,
    '2026-03-13 07:00:55',
    'In hac habitasse platea dictumst.'
),
(
    64,
    19,
    10,
    5,
    20,
    13,
    4617.4,
    '2026-07-18 22:11:00',
    'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.'
),
(
    65,
    3,
    7,
    10,
    23,
    8,
    4205.3,
    '2025-08-28 19:58:12',
    ''
),
(
    65,
    6,
    1,
    2,
    12,
    24,
    788.41,
    '2025-08-31 02:13:29',
    ''
),
(
    65,
    44,
    9,
    1,
    13,
    3,
    4894.42,
    '2026-05-12 22:21:07',
    ''
),
(
    66,
    44,
    9,
    5,
    25,
    14,
    1476.37,
    '2026-04-21 19:04:48',
    'Aliquam non mauris.'
),
(
    68,
    43,
    1,
    4,
    10,
    9,
    707.01,
    '2025-12-26 03:43:11',
    'In eleifend quam a odio.'
),
(
    68,
    7,
    7,
    3,
    2,
    16,
    1383.58,
    '2026-01-08 08:57:33',
    'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.'
),
(
    70,
    7,
    11,
    9,
    4,
    21,
    528.06,
    '2025-12-21 22:30:12',
    'Morbi non lectus.'
),
(
    70,
    21,
    12,
    6,
    11,
    14,
    3719.73,
    '2026-06-06 06:58:09',
    'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.'
),
(
    71,
    35,
    1,
    6,
    6,
    21,
    1267.57,
    '2026-04-21 21:35:38',
    'Etiam vel augue.'
),
(
    72,
    43,
    11,
    1,
    16,
    25,
    2991.93,
    '2025-09-17 15:35:03',
    'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.'
),
(
    72,
    20,
    13,
    7,
    6,
    19,
    4380.89,
    '2025-11-10 14:11:45',
    'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.'
),
(
    72,
    26,
    7,
    10,
    17,
    23,
    1116.3,
    '2025-12-19 11:04:37',
    'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'
),
(
    72,
    31,
    7,
    1,
    9,
    12,
    3512.02,
    '2026-05-30 08:28:07',
    'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.'
),
(
    72,
    37,
    8,
    4,
    19,
    21,
    2975.49,
    '2026-06-09 10:28:21',
    'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.'
),
(
    72,
    39,
    2,
    3,
    5,
    1,
    3497.42,
    '2026-06-09 10:38:20',
    'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.'
),
(
    72,
    33,
    7,
    9,
    22,
    9,
    4360.73,
    '2026-06-16 22:33:02',
    'Curabitur convallis.'
),
(
    73,
    28,
    1,
    8,
    8,
    6,
    1862.64,
    '2025-11-10 01:53:53',
    'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'
),
(
    73,
    16,
    11,
    7,
    15,
    10,
    3165.76,
    '2025-11-10 11:25:19',
    'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'
),
(
    73,
    21,
    4,
    4,
    19,
    13,
    715.48,
    '2025-12-01 12:05:37',
    ''
),
(
    74,
    10,
    1,
    6,
    11,
    10,
    4936.55,
    '2026-03-22 07:20:39',
    'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.'
),
(
    74,
    20,
    11,
    9,
    21,
    6,
    216.99,
    '2026-03-26 19:16:39',
    'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'
),
(
    75,
    38,
    7,
    5,
    18,
    12,
    2595.3,
    '2025-10-25 21:26:34',
    ''
),
(
    75,
    44,
    7,
    9,
    10,
    16,
    1328.49,
    '2025-11-01 11:21:37',
    ''
),
(
    75,
    35,
    4,
    4,
    1,
    9,
    1519.4,
    '2025-12-19 14:30:59',
    'Donec ut dolor.'
),
(
    75,
    45,
    8,
    10,
    1,
    22,
    3882.86,
    '2026-02-06 05:13:07',
    'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.'
),
(
    75,
    19,
    11,
    4,
    19,
    24,
    1620.32,
    '2026-05-16 22:34:37',
    ''
),
(
    76,
    30,
    6,
    9,
    11,
    20,
    1215.17,
    '2025-10-05 02:55:25',
    'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.'
),
(
    76,
    20,
    1,
    4,
    10,
    4,
    107.72,
    '2025-11-19 04:31:03',
    ''
),
(
    76,
    43,
    2,
    8,
    7,
    11,
    2491.67,
    '2025-12-15 06:16:59',
    'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.'
),
(
    76,
    4,
    9,
    9,
    10,
    16,
    2669.06,
    '2026-06-11 16:24:12',
    'Mauris ullamcorper purus sit amet nulla.'
),
(
    77,
    23,
    3,
    1,
    17,
    25,
    2304.61,
    '2025-10-22 02:48:55',
    'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.'
),
(
    77,
    48,
    13,
    4,
    6,
    3,
    4582.5,
    '2026-02-10 16:37:12',
    'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'
),
(
    78,
    37,
    13,
    7,
    2,
    16,
    792.2,
    '2026-02-02 05:55:14',
    'In sagittis dui vel nisl. Duis ac nibh.'
),
(
    78,
    28,
    13,
    1,
    18,
    15,
    4352.14,
    '2026-04-10 14:37:52',
    'Curabitur in libero ut massa volutpat convallis.'
),
(
    79,
    25,
    13,
    2,
    13,
    19,
    319.73,
    '2026-05-23 02:01:59',
    'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'
),
(
    80,
    37,
    1,
    5,
    5,
    25,
    4006.2,
    '2026-01-03 13:46:23',
    'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'
),
(
    80,
    42,
    4,
    3,
    22,
    10,
    4500.21,
    '2026-02-05 11:20:15',
    'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
),
(
    80,
    30,
    3,
    9,
    6,
    17,
    4027.67,
    '2026-07-13 04:19:39',
    'Etiam vel augue. Vestibulum rutrum rutrum neque.'
),
(
    82,
    20,
    4,
    3,
    12,
    24,
    3024.08,
    '2025-10-15 05:33:16',
    'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.'
),
(
    82,
    48,
    8,
    10,
    23,
    15,
    3041.7,
    '2025-11-12 17:39:27',
    'Duis at velit eu est congue elementum.'
),
(
    83,
    3,
    9,
    3,
    18,
    7,
    1864.97,
    '2025-10-25 18:58:01',
    ''
),
(
    83,
    6,
    6,
    8,
    9,
    3,
    2281.78,
    '2025-11-07 09:58:16',
    ''
),
(
    84,
    9,
    4,
    6,
    21,
    17,
    3275.52,
    '2025-12-14 11:31:26',
    'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.'
),
(
    84,
    45,
    7,
    9,
    11,
    14,
    185.94,
    '2025-12-15 18:08:50',
    'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'
),
(
    85,
    6,
    12,
    1,
    9,
    10,
    4552.55,
    '2026-05-21 02:22:33',
    'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.'
),
(
    85,
    7,
    2,
    1,
    3,
    24,
    3021.73,
    '2026-05-26 23:21:51',
    'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.'
),
(
    86,
    15,
    3,
    4,
    3,
    11,
    2375.9,
    '2025-11-09 20:06:33',
    'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.'
),
(
    86,
    2,
    9,
    4,
    18,
    17,
    1680.84,
    '2026-04-09 01:36:26',
    'Nulla ut erat id mauris vulputate elementum.'
),
(
    87,
    3,
    4,
    5,
    16,
    6,
    1134.99,
    '2025-11-21 04:36:58',
    'Nulla mollis molestie lorem.'
),
(
    87,
    5,
    1,
    10,
    20,
    12,
    4756.01,
    '2025-09-20 15:19:43',
    ''
),
(
    87,
    27,
    7,
    2,
    6,
    13,
    667.75,
    '2026-04-15 05:49:12',
    'Phasellus id sapien in sapien iaculis congue.'
),
(
    87,
    38,
    10,
    3,
    4,
    18,
    2163.12,
    '2026-04-24 15:19:16',
    ''
),
(
    87,
    34,
    3,
    8,
    4,
    12,
    1736.19,
    '2026-05-16 07:32:48',
    'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.'
),
(
    87,
    22,
    4,
    1,
    7,
    20,
    522.99,
    '2026-07-24 02:42:47',
    'Suspendisse accumsan tortor quis turpis.'
),
(
    88,
    41,
    10,
    3,
    6,
    23,
    4287.49,
    '2025-12-20 14:38:09',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'
),
(
    88,
    33,
    10,
    1,
    12,
    22,
    3677.75,
    '2026-07-01 11:45:20',
    'Fusce consequat.'
),
(
    89,
    15,
    4,
    4,
    8,
    11,
    3913.2,
    '2026-02-24 13:25:23',
    'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.'
),
(
    90,
    45,
    5,
    5,
    3,
    17,
    3739.61,
    '2026-08-12 12:03:53',
    'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.'
),
(
    91,
    8,
    8,
    1,
    19,
    15,
    3614.16,
    '2026-02-16 11:04:15',
    'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.'
),
(
    92,
    3,
    13,
    6,
    5,
    13,
    1759.37,
    '2025-11-25 21:39:30',
    ''
),
(
    92,
    7,
    11,
    2,
    23,
    22,
    2838.9,
    '2025-11-28 05:09:01',
    ''
),
(
    92,
    10,
    5,
    7,
    21,
    18,
    1722.15,
    '2026-05-08 12:11:39',
    'Ut tellus.'
),
(
    93,
    3,
    9,
    8,
    21,
    20,
    948.56,
    '2025-09-02 10:09:28',
    'Nullam varius. Nulla facilisi.'
),
(
    93,
    21,
    11,
    4,
    9,
    15,
    630.72,
    '2025-12-09 18:39:42',
    'Aenean lectus. Pellentesque eget nunc.'
),
(
    93,
    39,
    4,
    6,
    4,
    1,
    1641.63,
    '2026-03-26 07:12:20',
    'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.'
),
(
    94,
    50,
    1,
    10,
    20,
    9,
    80.56,
    '2025-11-14 23:57:29',
    'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.'
),
(
    94,
    26,
    12,
    10,
    3,
    19,
    756.22,
    '2025-12-23 15:55:08',
    'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.'
),
(
    96,
    9,
    5,
    7,
    23,
    6,
    2199.81,
    '2026-04-30 15:16:39',
    'Praesent lectus.'
),
(
    97,
    47,
    12,
    5,
    8,
    1,
    1452.44,
    '2025-09-04 09:29:44',
    'Sed ante. Vivamus tortor. Duis mattis egestas metus.'
),
(
    97,
    10,
    5,
    8,
    18,
    3,
    1010.51,
    '2026-02-13 19:10:13',
    'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'
),
(
    98,
    26,
    5,
    5,
    3,
    4,
    2888.52,
    '2025-11-26 15:40:29',
    'Quisque id justo sit amet sapien dignissim vestibulum.'
),
(
    98,
    28,
    3,
    9,
    11,
    19,
    2362.33,
    '2026-06-02 09:07:39',
    'Suspendisse potenti.'
),
(
    99,
    43,
    9,
    1,
    20,
    4,
    4648.53,
    '2025-12-14 19:43:39',
    'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.'
),
(
    99,
    19,
    2,
    8,
    6,
    1,
    4803.25,
    '2026-07-15 07:44:51',
    'Nulla justo.'
);

PRINT 'Populated Payments table.';

/* ======================================
=  Filling out the review criteria LUT  =
====================================== */

INSERT INTO
reviews.ReviewCriteria (
    CriterionName,
    CriterionDescription,
    CriterionReviewWeight
)
VALUES

/* These are 7 review criteria
===================================== */

-- ! While the official Airbnb website has 6 criteria and the overall rating is a distinct one,
-- ! I have added the ability for different criteria to have different weight to more accurately portray
-- ! the experience. For example, rating 0 on all criteria but then putting a 5* rating as the overall
-- ! rating makes no sense. So, the "overall experience" is now a seventh criteria, and a true mathematical
-- ! overall rating is generated based on these criteria and their relevant weights.
-- ! (https://www.airbnb.com/resources/hosting-homes/a/why-reviews-matter-41)

('Check-in', 'How easy it was to find the location and get inside.', 1),
('Cleanliness:', 'How clean and ready the home was upon arrival, being prepared before the booking time/date.', 2.5),
('Accuracy', 'How much the property matched guest expectations based on the listing photos and description.', 3.5),
('Communication', 'How responsive and helpful the host was from booking to checkout.', 3),
('Location', 'How satisfied the guest was with the neighborhood and area.', 2),
('Value', 'How the value of the stay/property was based on the price paid - aka how "worth it" the property was.', 3.5),
('Experience', 'An overall rating about how the entire experience was.', 4.5);

PRINT 'Populated Property Review Criteria LUT.';

/* ===========================================
= Filling out the property review root table =
=========================================== */

INSERT INTO
reviews.PropertyReview (
    AssociatedBookingId,
    ReviewerId,
    ReviewTitle,
    ReviewComment,
    ReviewedOn
)
VALUES

/* These are 150 reviews connected to a large majority of the 100 bookings
========================================================================== */

(
    1,
    20,
    'Iaculis Justo In Hac Habitasse',
    'Sed sagittis.',
    '2025-12-19 18:04:33'
),
(
    2,
    7,
    'Aliquet Maecenas',
    'Donec vitae nisi.',
    '2025-11-18 06:40:32'
),
(
    2,
    14,
    'Donec Vitae Nisi Nam',
    'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.',
    '2026-08-13 01:54:12'
),
(
    4,
    18,
    'Ut At Dolor',
    'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.',
    '2026-02-11 23:37:40'
),
(
    5,
    13,
    'Nulla Nunc Purus Phasellus',
    'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.',
    '2026-03-14 06:36:03'
),
(
    5,
    19,
    'Eu Felis Fusce Posuere Felis',
    'Phasellus in felis. Donec semper sapien a libero.',
    '2026-01-13 16:38:05'
),
(
    8,
    2,
    'Id Mauris',
    'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.',
    '2026-01-31 12:22:00'
),
(
    8,
    13,
    'Eget Vulputate Ut Ultrices Vel',
    'Aenean lectus. Pellentesque eget nunc.',
    '2025-08-29 11:13:34'
),
(
    9,
    9,
    'Fusce Lacus Purus Aliquet',
    'Integer non velit.',
    '2026-08-12 02:06:46'
),
(
    9,
    25,
    'Mi Sit',
    'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',
    '2026-07-01 17:34:16'
),
(
    12,
    13,
    'Erat Quisque Erat Eros Viverra Eget',
    'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',
    '2025-11-22 11:21:32'
),
(
    12,
    16,
    'Tempus Semper Est',
    'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.',
    '2025-12-29 08:17:27'
),
(
    12,
    18,
    'Eget Tempus Vel',
    'Praesent id massa id nisl venenatis lacinia.',
    '2026-08-18 12:01:39'
),
(
    13,
    19,
    'Lacinia Sapien Quis',
    'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.',
    '2025-10-24 11:48:57'
),
(
    14,
    2,
    'Ut Mauris Eget Massa Tempor',
    'Pellentesque eget nunc.',
    '2025-08-21 16:21:58'
),
(
    14,
    8,
    'Lorem Vitae',
    'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',
    '2026-01-24 14:26:22'
),
(
    14,
    12,
    'Ante Vestibulum Ante Ipsum Primis In',
    'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',
    '2025-09-23 00:47:49'
),
(
    17,
    6,
    'Congue Risus Semper Porta Volutpat Quam',
    'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.',
    '2025-10-31 15:14:00'
),
(
    18,
    13,
    'Rutrum Rutrum Neque',
    'Aliquam non mauris. Morbi non lectus.',
    '2025-09-04 01:53:44'
),
(
    18,
    17,
    'Luctus Et Ultrices Posuere Cubilia',
    'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',
    '2025-09-10 15:51:50'
),
(
    18,
    20,
    'Ut Mauris Eget',
    'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',
    '2025-10-28 19:11:05'
),
(
    18,
    24,
    'Id Luctus Nec Molestie Sed Justo',
    'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',
    '2025-09-02 05:32:51'
),
(
    19,
    1,
    'Potenti In Eleifend Quam A Odio',
    'Nunc rhoncus dui vel sem.',
    '2025-08-29 03:53:04'
),
(
    19,
    8,
    'Volutpat Sapien Arcu Sed Augue',
    'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.',
    '2025-08-26 00:12:16'
),
(
    20,
    4,
    'Accumsan Felis Ut At Dolor Quis',
    'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.',
    '2026-06-04 17:01:49'
),
(
    20,
    5,
    'Imperdiet Et',
    'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',
    '2026-06-03 17:24:56'
),
(
    20,
    16,
    'Vel Lectus In Quam',
    'Sed accumsan felis. Ut at dolor quis odio consequat varius.',
    '2026-05-28 08:03:28'
),
(
    20,
    23,
    'Donec Odio Justo Sollicitudin Ut',
    'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.',
    '2026-07-29 17:39:48'
),
(
    21,
    4,
    'Consequat Lectus In Est Risus',
    'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.',
    '2025-08-29 09:23:46'
),
(
    21,
    10,
    'Dolor Morbi Vel',
    'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',
    '2025-10-11 09:28:27'
),
(
    21,
    18,
    'Vestibulum Ante',
    'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.',
    '2025-10-31 04:52:13'
),
(
    21,
    19,
    'Nulla Suspendisse Potenti',
    'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.',
    '2026-07-21 20:11:22'
),
(
    22,
    4,
    'In Porttitor',
    'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.',
    '2026-05-15 06:21:20'
),
(
    23,
    19,
    'Primis In Faucibus Orci',
    'Praesent blandit. Nam nulla.',
    '2026-03-30 23:52:01'
),
(
    24,
    21,
    'Sed Vel',
    'Aliquam sit amet diam in magna bibendum imperdiet.',
    '2026-08-14 02:07:50'
),
(
    26,
    1,
    'Cras In Purus Eu Magna',
    'Aenean fermentum. Donec ut mauris eget massa tempor convallis.',
    '2026-01-20 12:15:35'
),
(
    26,
    13,
    'Felis Sed Lacus Morbi Sem',
    'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.',
    '2026-05-12 10:34:18'
),
(
    28,
    10,
    'Velit Vivamus Vel Nulla',
    'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',
    '2025-09-29 15:53:34'
),
(
    28,
    12,
    'Ipsum Dolor',
    'Morbi vel lectus in quam fringilla rhoncus.',
    '2026-01-27 04:03:50'
),
(
    28,
    17,
    'Volutpat In Congue Etiam Justo',
    'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.',
    '2026-06-05 04:43:05'
),
(
    29,
    16,
    'Ut Odio Cras Mi Pede',
    'Nunc nisl.',
    '2025-08-30 02:28:35'
),
(
    30,
    7,
    'Cras Pellentesque Volutpat',
    'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',
    '2025-09-08 12:32:05'
),
(
    30,
    18,
    'Leo Maecenas Pulvinar Lobortis',
    'Donec ut mauris eget massa tempor convallis.',
    '2026-03-08 02:49:10'
),
(
    31,
    5,
    'Tempor Turpis Nec Euismod',
    'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',
    '2025-12-16 05:02:15'
),
(
    31,
    20,
    'Faucibus Orci',
    'Ut at dolor quis odio consequat varius. Integer ac leo.',
    '2026-07-03 04:28:50'
),
(
    31,
    24,
    'Enim In Tempor Turpis Nec Euismod',
    'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.',
    '2026-06-28 10:42:44'
),
(
    32,
    3,
    'Ligula Suspendisse Ornare',
    'Phasellus sit amet erat. Nulla tempus.',
    '2026-04-06 23:39:30'
),
(
    32,
    24,
    'Vestibulum Ante',
    'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.',
    '2026-07-09 06:36:27'
),
(
    33,
    7,
    'Nunc Viverra',
    'Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
    '2025-11-12 08:29:50'
),
(
    35,
    12,
    'Rhoncus Sed Vestibulum Sit Amet',
    'Nam dui.',
    '2026-07-26 12:40:50'
),
(
    35,
    17,
    'Nulla Quisque Arcu',
    'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.',
    '2026-06-12 14:31:21'
),
(
    37,
    2,
    'Elementum In Hac Habitasse',
    'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio.',
    '2026-01-11 04:06:05'
),
(
    38,
    4,
    'Erat Id Mauris',
    'Pellentesque ultrices mattis odio.',
    '2026-06-13 12:46:57'
),
(
    38,
    5,
    'Lectus Vestibulum Quam Sapien',
    'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.',
    '2025-11-02 18:39:05'
),
(
    38,
    7,
    'Primis In',
    'Cras pellentesque volutpat dui.',
    '2026-04-10 21:04:14'
),
(
    38,
    17,
    'Et Commodo Vulputate Justo In Blandit',
    'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',
    '2026-01-30 08:40:45'
),
(
    39,
    4,
    'Id Justo Sit Amet Sapien',
    'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
    '2026-07-20 12:13:36'
),
(
    40,
    5,
    'Eget Tempus Vel Pede Morbi',
    'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',
    '2025-09-09 16:59:25'
),
(
    40,
    19,
    'Id Pretium Iaculis Diam Erat',
    'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',
    '2025-11-26 05:36:59'
),
(
    41,
    6,
    'Nunc Commodo',
    'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',
    '2026-04-07 03:53:02'
),
(
    43,
    5,
    'Nibh In',
    'Duis aliquam convallis nunc.',
    '2025-09-25 01:46:16'
),
(
    44,
    2,
    'Libero Ut Massa Volutpat Convallis',
    'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.',
    '2026-08-13 13:31:13'
),
(
    44,
    13,
    'Turpis Elementum Ligula Vehicula Consequat Morbi',
    'Aliquam non mauris.',
    '2025-11-24 23:03:36'
),
(
    44,
    18,
    'Augue Vestibulum Rutrum Rutrum Neque',
    'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.',
    '2025-10-27 04:57:02'
),
(
    45,
    7,
    'Sit Amet Diam',
    'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.',
    '2025-11-01 03:28:28'
),
(
    45,
    10,
    'Odio Cras',
    'Nam tristique tortor eu pede.',
    '2026-07-22 23:23:54'
),
(
    45,
    18,
    'Ipsum Integer A Nibh In',
    'In sagittis dui vel nisl.',
    '2026-01-23 00:20:52'
),
(
    45,
    20,
    'Donec Posuere Metus Vitae',
    'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.',
    '2026-01-28 12:53:12'
),
(
    45,
    23,
    'Quam A Odio',
    'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',
    '2026-06-26 17:36:56'
),
(
    46,
    16,
    'Pede Lobortis Ligula Sit',
    'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam. Suspendisse potenti.',
    '2026-07-11 19:38:46'
),
(
    47,
    4,
    'Rutrum Nulla',
    'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',
    '2026-02-04 01:13:41'
),
(
    47,
    24,
    'Leo Rhoncus Sed',
    'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',
    '2026-03-10 18:29:15'
),
(
    50,
    2,
    'Volutpat Quam Pede Lobortis Ligula Sit',
    'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',
    '2025-09-03 03:05:23'
),
(
    50,
    3,
    'Pretium Iaculis Justo In Hac',
    'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio.',
    '2026-01-18 01:59:07'
),
(
    50,
    23,
    'In Sagittis Dui Vel Nisl',
    'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.',
    '2025-10-23 14:16:54'
),
(
    50,
    24,
    'In Faucibus',
    'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.',
    '2026-07-18 11:12:37'
),
(
    51,
    2,
    'Dolor Morbi',
    'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',
    '2026-07-25 21:03:54'
),
(
    54,
    3,
    'Quisque Id Justo',
    'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.',
    '2026-07-03 13:50:41'
),
(
    54,
    6,
    'Luctus Et Ultrices Posuere Cubilia',
    'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',
    '2025-12-05 09:50:34'
),
(
    54,
    12,
    'Cubilia Curae',
    'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.',
    '2026-06-05 06:57:12'
),
(
    54,
    14,
    'Neque Duis Bibendum',
    'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.',
    '2026-04-12 22:18:00'
),
(
    54,
    24,
    'In Purus Eu',
    'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.',
    '2025-09-07 10:00:03'
),
(
    56,
    14,
    'Posuere Cubilia Curae',
    'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.',
    '2025-12-03 13:45:04'
),
(
    57,
    9,
    'In Eleifend Quam',
    'Nulla ut erat id mauris vulputate elementum.',
    '2025-12-19 03:27:13'
),
(
    59,
    20,
    'Luctus Et',
    'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',
    '2025-10-11 04:27:45'
),
(
    60,
    7,
    'Primis In',
    'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',
    '2026-07-08 03:37:30'
),
(
    60,
    8,
    'Eu Tincidunt In Leo Maecenas Pulvinar',
    'Pellentesque at nulla.',
    '2026-04-12 08:08:45'
),
(
    60,
    15,
    'Lacus At Velit Vivamus Vel Nulla',
    'Duis mattis egestas metus.',
    '2026-03-22 11:32:25'
),
(
    60,
    17,
    'Accumsan Tellus',
    'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.',
    '2026-05-26 06:27:48'
),
(
    61,
    5,
    'Sociis Natoque Penatibus Et Magnis Dis',
    'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.',
    '2025-11-21 16:34:36'
),
(
    61,
    13,
    'Sagittis Sapien Cum Sociis',
    'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.',
    '2026-03-06 20:18:36'
),
(
    61,
    23,
    'Donec Dapibus Duis',
    'Sed accumsan felis. Ut at dolor quis odio consequat varius.',
    '2026-08-03 02:48:17'
),
(
    62,
    1,
    'Vel Dapibus At Diam Nam',
    'Nullam porttitor lacus at turpis.',
    '2026-08-14 22:38:52'
),
(
    62,
    6,
    'Proin Interdum Mauris Non Ligula Pellentesque',
    'Vivamus vel nulla eget eros elementum pellentesque.',
    '2026-01-08 18:47:19'
),
(
    63,
    10,
    'Felis Donec Semper Sapien A Libero',
    'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.',
    '2025-12-01 20:08:40'
),
(
    63,
    16,
    'Primis In Faucibus Orci',
    'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.',
    '2025-11-29 17:30:33'
),
(
    63,
    24,
    'Aliquam Quis Turpis Eget',
    'Sed ante. Vivamus tortor. Duis mattis egestas metus.',
    '2026-08-07 03:54:47'
),
(
    64,
    22,
    'Montes Nascetur Ridiculus Mus',
    'Vivamus vel nulla eget eros elementum pellentesque.',
    '2025-09-23 23:38:44'
),
(
    66,
    11,
    'Nulla Ut Erat Id',
    'Nullam molestie nibh in lectus. Pellentesque at nulla.',
    '2025-12-08 19:32:49'
),
(
    69,
    18,
    'Curabitur In Libero Ut Massa Volutpat',
    'Ut tellus.',
    '2025-12-19 07:29:06'
),
(
    70,
    23,
    'Ac Neque',
    'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.',
    '2025-11-25 13:58:07'
),
(
    71,
    14,
    'Nonummy Maecenas Tincidunt Lacus At Velit',
    'In congue. Etiam justo. Etiam pretium iaculis justo.',
    '2026-01-06 07:09:07'
),
(
    71,
    21,
    'Vulputate Luctus',
    'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',
    '2026-06-07 10:27:47'
),
(
    72,
    8,
    'In Sagittis Dui Vel',
    'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.',
    '2026-02-02 10:34:26'
),
(
    72,
    13,
    'Sed Tristique In Tempus',
    'Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.',
    '2026-01-18 11:44:57'
),
(
    73,
    23,
    'Non Velit Donec',
    'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.',
    '2026-06-26 14:52:00'
),
(
    74,
    13,
    'Faucibus Orci Luctus Et',
    'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',
    '2026-05-27 20:49:50'
),
(
    76,
    9,
    'Molestie Lorem Quisque Ut',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.',
    '2026-05-13 16:23:41'
),
(
    77,
    5,
    'Ante Vel Ipsum Praesent Blandit',
    'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.',
    '2025-11-29 09:41:56'
),
(
    77,
    14,
    'Proin Interdum Mauris Non Ligula',
    'Morbi a ipsum. Integer a nibh. In quis justo.',
    '2026-02-15 13:56:20'
),
(
    79,
    8,
    'Sapien A Libero Nam',
    'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.',
    '2026-08-07 16:41:54'
),
(
    79,
    24,
    'Vel Nisl Duis',
    'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',
    '2026-01-11 04:08:51'
),
(
    80,
    5,
    'Vestibulum Aliquet Ultrices',
    'Etiam justo. Etiam pretium iaculis justo.',
    '2026-01-06 15:33:33'
),
(
    81,
    5,
    'Id Mauris Vulputate Elementum Nullam Varius',
    'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',
    '2025-09-20 08:53:55'
),
(
    81,
    17,
    'Lorem Id',
    'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.',
    '2026-01-29 20:30:13'
),
(
    81,
    20,
    'Potenti Nullam',
    'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam. Suspendisse potenti.',
    '2026-03-22 23:06:04'
),
(
    82,
    4,
    'Iaculis Congue Vivamus Metus',
    'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.',
    '2025-12-31 21:59:01'
),
(
    82,
    10,
    'In Sapien Iaculis',
    'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.',
    '2026-06-20 13:03:37'
),
(
    83,
    3,
    'At Turpis A Pede',
    'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',
    '2025-09-13 04:52:46'
),
(
    83,
    7,
    'Mi Pede Malesuada',
    'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.',
    '2026-08-01 15:04:15'
),
(
    83,
    23,
    'Feugiat Non Pretium Quis',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.',
    '2025-12-01 14:50:51'
),
(
    84,
    4,
    'Sed Magna',
    'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',
    '2025-08-30 04:42:13'
),
(
    84,
    16,
    'Lorem Quisque Ut',
    'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',
    '2025-09-20 10:44:32'
),
(
    84,
    21,
    'In Purus',
    'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',
    '2025-10-20 21:51:15'
),
(
    86,
    4,
    'Quis Orci Eget Orci',
    'Praesent blandit. Nam nulla.',
    '2026-08-19 12:44:49'
),
(
    86,
    15,
    'Blandit Ultrices',
    'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',
    '2025-12-19 13:31:57'
),
(
    86,
    16,
    'Purus Aliquet',
    'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.',
    '2026-03-12 12:53:22'
),
(
    87,
    21,
    'Rutrum Ac',
    'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',
    '2026-03-10 12:28:32'
),
(
    88,
    2,
    'Suscipit A Feugiat',
    'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.',
    '2026-03-14 14:24:19'
),
(
    88,
    20,
    'Duis Aliquam Convallis Nunc Proin',
    'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.',
    '2025-09-09 06:55:48'
),
(
    89,
    3,
    'Primis In Faucibus Orci',
    'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.',
    '2026-04-01 08:50:58'
),
(
    89,
    13,
    'Orci Nullam Molestie Nibh In Lectus',
    'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.',
    '2025-10-27 05:14:47'
),
(
    89,
    15,
    'Congue Elementum In Hac Habitasse Platea',
    'Aenean lectus.',
    '2025-10-08 11:45:22'
),
(
    89,
    24,
    'Vulputate Luctus Cum Sociis Natoque Penatibus',
    'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.',
    '2025-11-14 02:10:06'
),
(
    91,
    4,
    'Eros Elementum',
    'Nullam molestie nibh in lectus. Pellentesque at nulla.',
    '2025-09-30 19:44:04'
),
(
    91,
    22,
    'Vestibulum Quam Sapien Varius',
    'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',
    '2026-02-01 12:59:32'
),
(
    93,
    2,
    'Lorem Vitae Mattis',
    'In congue. Etiam justo. Etiam pretium iaculis justo.',
    '2025-09-19 12:25:05'
),
(
    94,
    21,
    'Venenatis Lacinia Aenean Sit',
    'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.',
    '2025-10-28 04:59:07'
),
(
    95,
    18,
    'Id Nulla Ultrices Aliquet',
    'In quis justo. Maecenas rhoncus aliquam lacus.',
    '2025-09-27 17:03:58'
),
(
    96,
    4,
    'Aliquam Sit Amet Diam In Magna',
    'Quisque ut erat.',
    '2026-05-01 01:17:06'
),
(
    96,
    13,
    'At Feugiat Non Pretium Quis',
    'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.',
    '2026-07-26 16:24:14'
),
(
    96,
    18,
    'Maecenas Tincidunt',
    'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.',
    '2026-06-26 07:22:35'
),
(
    97,
    1,
    'Nec Dui Luctus Rutrum',
    'Morbi a ipsum. Integer a nibh.',
    '2026-02-28 17:51:36'
),
(
    97,
    14,
    'Pede Morbi Porttitor Lorem Id Ligula',
    'Morbi non lectus.',
    '2025-09-21 11:02:03'
),
(
    97,
    24,
    'Velit Eu Est Congue Elementum In',
    'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.',
    '2025-10-24 05:41:05'
),
(
    98,
    4,
    'Dui Vel Nisl Duis',
    'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.',
    '2026-05-06 03:25:51'
),
(
    98,
    22,
    'Quam Sollicitudin Vitae Consectetuer',
    'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.',
    '2025-10-21 11:36:05'
),
(
    99,
    4,
    'Sapien Placerat',
    'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',
    '2025-09-24 09:46:07'
),
(
    99,
    21,
    'Nulla Suspendisse Potenti Cras In Purus',
    'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.',
    '2025-10-22 03:15:59'
),
(
    100,
    13,
    'Nunc Proin At Turpis A',
    'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.',
    '2026-03-08 21:14:35'
);

PRINT 'Populated Property Review table.';

/* ==============================================
= Filling out the review criteria reviews table =
============================================== */

INSERT INTO
reviews.CriteriaRatings (
    ReviewId,
    CriterionId,
    Rating
)
VALUES

/* These are 245 ratings
===================================== */

-- ? 7 ratings per review (1 for each criterion)
-- ? * 35 random reviews chosen
-- ? = 245 total ratings

(29, 1, 1),
(29, 2, 4),
(29, 3, 3.5),
(29, 4, 1),
(29, 5, 3.5),
(29, 6, 0.5),
(29, 7, 5),
(7, 1, 2),
(7, 2, 0.5),
(7, 3, 2),
(7, 4, 2.5),
(7, 5, 1.5),
(7, 6, 4.5),
(7, 7, 3),
(71, 1, 4.5),
(71, 2, 2.5),
(71, 3, 3),
(71, 4, 0.5),
(71, 5, 1),
(71, 6, 1.5),
(71, 7, 2),
(63, 1, 2.5),
(63, 2, 2.5),
(63, 3, 1),
(63, 4, 0),
(63, 5, 0),
(63, 6, 2),
(63, 7, 3),
(58, 1, 4.5),
(58, 2, 2.5),
(58, 3, 2),
(58, 4, 3.5),
(58, 5, 4.5),
(58, 6, 1.5),
(58, 7, 2),
(36, 1, 5),
(36, 2, 0.5),
(36, 3, 1.5),
(36, 4, 4.5),
(36, 5, 2),
(36, 6, 2),
(36, 7, 3),
(27, 1, 4),
(27, 2, 3),
(27, 3, 4.5),
(27, 4, 2.5),
(27, 5, 3),
(27, 6, 2),
(27, 7, 1),
(140, 1, 3.5),
(140, 2, 0.5),
(140, 3, 3.5),
(140, 4, 0.5),
(140, 5, 0),
(140, 6, 1),
(140, 7, 4.5),
(23, 1, 3.5),
(23, 2, 3.5),
(23, 3, 2),
(23, 4, 4.5),
(23, 5, 3),
(23, 6, 5),
(23, 7, 0.5),
(109, 1, 1),
(109, 2, 0.5),
(109, 3, 3),
(109, 4, 3),
(109, 5, 2.5),
(109, 6, 0.5),
(109, 7, 4),
(9, 1, 1.5),
(9, 2, 4.5),
(9, 3, 2),
(9, 4, 0.5),
(9, 5, 1.5),
(9, 6, 1),
(9, 7, 1),
(8, 1, 0),
(8, 2, 1),
(8, 3, 0),
(8, 4, 0.5),
(8, 5, 3.5),
(8, 6, 5),
(8, 7, 2),
(24, 1, 1.5),
(24, 2, 4.5),
(24, 3, 3.5),
(24, 4, 0),
(24, 5, 0.5),
(24, 6, 0),
(24, 7, 2.5),
(56, 1, 0),
(56, 2, 3.5),
(56, 3, 1),
(56, 4, 0.5),
(56, 5, 0.5),
(56, 6, 4.5),
(56, 7, 5),
(60, 1, 4.5),
(60, 2, 1),
(60, 3, 4.5),
(60, 4, 4),
(60, 5, 2),
(60, 6, 2),
(60, 7, 1.5),
(130, 1, 0),
(130, 2, 4.5),
(130, 3, 2.5),
(130, 4, 0.5),
(130, 5, 3),
(130, 6, 3),
(130, 7, 4.5),
(15, 1, 1.5),
(15, 2, 0),
(15, 3, 0.5),
(15, 4, 4),
(15, 5, 4.5),
(15, 6, 0.5),
(15, 7, 0.5),
(144, 1, 0.5),
(144, 2, 1.5),
(144, 3, 0.5),
(144, 4, 5),
(144, 5, 3.5),
(144, 6, 1.5),
(144, 7, 3),
(51, 1, 4.5),
(51, 2, 2.5),
(51, 3, 1.5),
(51, 4, 1),
(51, 5, 2),
(51, 6, 3.5),
(51, 7, 0.5),
(142, 1, 0),
(142, 2, 5),
(142, 3, 2.5),
(142, 4, 3),
(142, 5, 3.5),
(142, 6, 5),
(142, 7, 5),
(108, 1, 4),
(108, 2, 2),
(108, 3, 2),
(108, 4, 4.5),
(108, 5, 1.5),
(108, 6, 3.5),
(108, 7, 4),
(57, 1, 1.5),
(57, 2, 3),
(57, 3, 4),
(57, 4, 2.5),
(57, 5, 5),
(57, 6, 4),
(57, 7, 1),
(115, 1, 4.5),
(115, 2, 1.5),
(115, 3, 1),
(115, 4, 0),
(115, 5, 4.5),
(115, 6, 5),
(115, 7, 1.5),
(72, 1, 1.5),
(72, 2, 5),
(72, 3, 1),
(72, 4, 2),
(72, 5, 3),
(72, 6, 1.5),
(72, 7, 0),
(2, 1, 1.5),
(2, 2, 0.5),
(2, 3, 5),
(2, 4, 4),
(2, 5, 0.5),
(2, 6, 0.5),
(2, 7, 1),
(41, 1, 3.5),
(41, 2, 1),
(41, 3, 0),
(41, 4, 3),
(41, 5, 4),
(41, 6, 3.5),
(41, 7, 4),
(129, 1, 3.5),
(129, 2, 4.5),
(129, 3, 2.5),
(129, 4, 2),
(129, 5, 0.5),
(129, 6, 0),
(129, 7, 0),
(88, 1, 0.5),
(88, 2, 3),
(88, 3, 0.5),
(88, 4, 3.5),
(88, 5, 4.5),
(88, 6, 2.5),
(88, 7, 0.5),
(73, 1, 0.5),
(73, 2, 3),
(73, 3, 5),
(73, 4, 0),
(73, 5, 1),
(73, 6, 3),
(73, 7, 5),
(40, 1, 1),
(40, 2, 3),
(40, 3, 3),
(40, 4, 2.5),
(40, 5, 1),
(40, 6, 3.5),
(40, 7, 5),
(55, 1, 4),
(55, 2, 4.5),
(55, 3, 4.5),
(55, 4, 5),
(55, 5, 5),
(55, 6, 4),
(55, 7, 4),
(87, 1, 2.5),
(87, 2, 5),
(87, 3, 0.5),
(87, 4, 4),
(87, 5, 3),
(87, 6, 3.5),
(87, 7, 4.5),
(37, 1, 1.5),
(37, 2, 3),
(37, 3, 2.5),
(37, 4, 0),
(37, 5, 4.5),
(37, 6, 4.5),
(37, 7, 4.5),
(28, 1, 4),
(28, 2, 1),
(28, 3, 0),
(28, 4, 4),
(28, 5, 0.5),
(28, 6, 1),
(28, 7, 0),
(98, 1, 4),
(98, 2, 5),
(98, 3, 1),
(98, 4, 4),
(98, 5, 0),
(98, 6, 1.5),
(98, 7, 1.5);

PRINT 'Populated Property Review Ratings table.';

/* =====================================
=  Filling out the user reviews table  =
===================================== */

INSERT INTO
reviews.UserReview (
    TargetId,
    ReviewerId,
    AssociatedBookingId,
    ReviewTitle,
    ReviewComment,
    Rating,
    ReviewedOn
)
VALUES

/* These are 50 user-user reviews linked with random bookings
============================================================= */

(
    5,
    9,
    11,
    'Erat Eros Viverra Eget',
    'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',
    4,
    '2025-09-17 00:50:50'
),
(
    2,
    20,
    23,
    'Duis Consequat Dui Nec',
    'Nulla mollis molestie lorem.',
    0.5,
    '2026-04-16 16:09:29'
),
(
    18,
    22,
    56,
    'In Ante',
    'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.',
    2.5,
    '2025-12-29 02:49:28'
),
(
    8,
    7,
    99,
    'Pede Morbi Porttitor Lorem Id',
    'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.',
    3.5,
    '2025-11-10 16:43:48'
),
(
    16,
    21,
    8,
    'Eu Mi Nulla Ac Enim In',
    'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',
    3.5,
    '2026-01-20 23:20:07'
),
(
    2,
    17,
    68,
    'Augue Quam Sollicitudin Vitae Consectetuer',
    'In eleifend quam a odio. In hac habitasse platea dictumst.',
    0.5,
    '2026-04-30 22:51:22'
),
(
    12,
    15,
    20,
    'Nibh Fusce Lacus',
    'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',
    3.5,
    '2025-11-08 23:41:08'
),
(
    17,
    20,
    66,
    'Odio Odio Elementum',
    'In quis justo.',
    1.5,
    '2026-07-20 12:56:34'
),
(
    8,
    22,
    56,
    'Integer Pede',
    'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',
    4.5,
    '2025-11-07 00:07:11'
),
(
    21,
    20,
    64,
    'Vulputate Elementum Nullam Varius Nulla Facilisi',
    'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',
    4.5,
    '2026-02-24 05:13:03'
),
(
    13,
    2,
    60,
    'Dolor Morbi Vel Lectus In Quam',
    'Duis bibendum. Morbi non quam nec dui luctus rutrum.',
    2,
    '2025-09-13 09:50:59'
),
(
    9,
    17,
    27,
    'Sit Amet Justo Morbi Ut Odio',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',
    2.5,
    '2026-06-06 19:02:25'
),
(
    25,
    23,
    59,
    'Odio Justo Sollicitudin Ut Suscipit A',
    'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.',
    5,
    '2026-02-23 12:02:29'
),
(
    4,
    12,
    3,
    'Eget Elit Sodales Scelerisque Mauris',
    'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.',
    3.5,
    '2026-03-11 17:45:46'
),
(
    13,
    12,
    26,
    'In Felis',
    'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.',
    3.5,
    '2025-10-10 15:24:46'
),
(
    2,
    9,
    43,
    'Mus Etiam Vel Augue Vestibulum',
    'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.',
    2,
    '2026-05-16 04:46:55'
),
(
    23,
    17,
    16,
    'Vestibulum Rutrum',
    'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',
    3,
    '2026-01-01 02:49:19'
),
(
    19,
    22,
    84,
    'Fusce Consequat Nulla Nisl',
    'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',
    3,
    '2026-03-30 02:13:16'
),
(
    23,
    12,
    53,
    'Rhoncus Mauris',
    'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.',
    0,
    '2026-07-19 14:59:17'
),
(
    13,
    20,
    94,
    'Erat Eros Viverra',
    'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',
    4,
    '2026-04-01 06:10:25'
),
(
    18,
    11,
    73,
    'Nisi Venenatis Tristique Fusce',
    'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.',
    3,
    '2025-12-13 16:51:10'
),
(
    24,
    11,
    31,
    'Quis Odio Consequat Varius Integer Ac',
    'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',
    1,
    '2025-09-09 18:04:13'
),
(
    3,
    16,
    59,
    'Ultrices Posuere Cubilia Curae Nulla',
    'Morbi non quam nec dui luctus rutrum. Nulla tellus.',
    2.5,
    '2025-09-01 06:29:26'
),
(
    23,
    8,
    63,
    'Rutrum Nulla',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.',
    3.5,
    '2026-08-05 23:25:06'
),
(
    23,
    20,
    7,
    'Vel Augue Vestibulum Ante Ipsum',
    'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',
    2.5,
    '2026-01-10 08:59:46'
),
(
    18,
    12,
    13,
    'Orci Eget Orci',
    'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',
    1,
    '2025-11-13 09:01:24'
),
(
    1,
    19,
    44,
    'Magnis Dis Parturient Montes Nascetur',
    'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',
    1,
    '2025-12-12 14:41:41'
),
(
    23,
    21,
    2,
    'Varius Ut',
    'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.',
    4.5,
    '2026-05-23 13:52:56'
),
(
    15,
    20,
    13,
    'Odio Cras',
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.',
    4,
    '2026-01-23 11:52:15'
),
(
    4,
    12,
    95,
    'Non Mi Integer',
    'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.',
    5,
    '2025-12-22 08:45:22'
),
(
    5,
    25,
    1,
    'Pede Ullamcorper Augue',
    'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.',
    1,
    '2025-12-15 20:04:20'
),
(
    22,
    17,
    26,
    'Quisque Id',
    'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.',
    5,
    '2026-04-26 11:15:58'
),
(
    12,
    5,
    18,
    'Consequat Dui Nec Nisi Volutpat Eleifend',
    'In blandit ultrices enim.',
    1.5,
    '2025-10-26 18:50:02'
),
(
    24,
    25,
    81,
    'Varius Ut Blandit Non Interdum',
    'Phasellus id sapien in sapien iaculis congue.',
    4.5,
    '2026-01-29 04:32:20'
),
(
    25,
    16,
    65,
    'Nunc Nisl Duis Bibendum',
    'Nullam molestie nibh in lectus. Pellentesque at nulla.',
    3.5,
    '2026-08-16 01:56:41'
),
(
    16,
    19,
    18,
    'Tristique Fusce',
    'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.',
    1.5,
    '2025-09-05 23:09:08'
),
(
    20,
    13,
    45,
    'Libero Ut Massa',
    'Etiam pretium iaculis justo.',
    2,
    '2026-04-27 00:35:59'
),
(
    10,
    18,
    2,
    'Adipiscing Elit Proin',
    'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.',
    4,
    '2025-12-20 03:37:39'
),
(
    20,
    24,
    61,
    'Morbi Vestibulum Velit',
    'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.',
    2.5,
    '2025-10-02 16:54:39'
),
(
    10,
    11,
    27,
    'Vehicula Condimentum Curabitur In Libero Ut',
    'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.',
    1,
    '2026-01-01 19:09:33'
),
(
    7,
    9,
    86,
    'Pellentesque Volutpat Dui Maecenas Tristique',
    'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',
    2,
    '2026-02-06 22:01:22'
),
(
    22,
    20,
    7,
    'Tempus Vel Pede Morbi',
    'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',
    2,
    '2026-07-16 17:42:42'
),
(
    9,
    8,
    2,
    'Vivamus Metus Arcu Adipiscing Molestie Hendrerit',
    'Mauris lacinia sapien quis libero.',
    1,
    '2026-04-30 00:33:23'
),
(
    10,
    23,
    65,
    'Interdum Mauris Non Ligula Pellentesque',
    'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.',
    3.5,
    '2026-03-09 04:34:10'
),
(
    11,
    19,
    78,
    'Amet Consectetuer Adipiscing',
    'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
    4,
    '2026-03-01 23:41:09'
),
(
    25,
    2,
    54,
    'Tincidunt Lacus',
    'Praesent lectus.',
    5,
    '2026-02-23 14:05:17'
),
(
    11,
    3,
    54,
    'Mauris Sit',
    'Nulla tempus.',
    2,
    '2026-04-27 06:19:26'
),
(
    14,
    13,
    45,
    'Ridiculus Mus Etiam Vel',
    'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',
    0.5,
    '2025-11-23 08:37:25'
),
(
    13,
    11,
    97,
    'Sollicitudin Mi',
    'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.',
    5,
    '2025-10-27 22:53:24'
),
(
    1,
    15,
    38,
    'Congue Diam Id Ornare Imperdiet',
    'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.',
    3.5,
    '2026-07-08 13:28:51'
);

PRINT 'Populated User Review table.';

