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
    UserCountry,
    HostingSince
)
VALUES

/* These are 25 users
===================================== */

(
    2,
    'aaddlestone0@behance.net',
    '$2a$04$Be6k0xf5UQwFH2lAcaliReH7xC.FBpC.vVU0wRlzD5lQi0GsbOUz.',
    '+63 (465) 957-7301',
    11,
    NULL
),
(
    8,
    'clairdcraig1@behance.net',
    '$2a$04$YI5tI2d9yLWaXsQTsZhNlO.RIZC0hYcAoSdOSYzcmwSd2Y.50841C',
    '+62 (564) 962-0421',
    4,
    '2026-04-11'
),
(
    5,
    'sgemnett2@bloomberg.com',
    '$2a$04$nCqoEsEyzbSAz7CK/0u1XuGU.Rha6x.S9BUhffsrvlQatEPS68/FC',
    '+63 (473) 213-1507',
    10,
    '2026-05-14'
),
(
    4,
    'fmordue3@msn.com',
    '$2a$04$baWceSKZmTlm05YqUFqbYux9MsbHODHrQhJqWMKIQHnbSfGl59HRO',
    '+31 (557) 140-5223',
    16,
    NULL
),
(
    8,
    'ksandsallan4@webs.com',
    '$2a$04$MkhMmuygTU2B6S.grdsPJOZc.tHe3hpvFUFqcE/z.dZW4rb06Wzde',
    '+55 (918) 854-7400',
    14,
    '2025-12-01'
),
(
    5,
    'hcopnell5@biblegateway.com',
    '$2a$04$TMIc8tbsdOJgDf8puq37xOTACapGJXowdstB29iR/UXC4NyjPNUTS',
    '+354 (547) 644-7915',
    13,
    '2025-10-07'
),
(
    6,
    'backermann6@marketwatch.com',
    '$2a$04$j8W00JHet1umrqkdAcP9cu975OxDNn4kPV8g2SctZo.kCQgEua4uC',
    '+7 (822) 862-0355',
    1,
    '2026-08-23'
),
(
    1,
    'mablitt7@behance.net',
    '$2a$04$sm4MX/GOPuMWU87H3UhR9e4BB.dxvcFRGiLEDf4qlbGX05SYyExKu',
    '+593 (625) 710-6487',
    11,
    NULL
),
(
    2,
    'rronchi8@pbs.org',
    '$2a$04$D45/31/rPeFQJoB2rxfvae4ICTHN9eGk1Swj8ntEFKeFewpsVFR6C',
    '+86 (611) 122-6518',
    4,
    NULL
),
(
    8,
    'kedington9@craigslist.org',
    '$2a$04$Y5UiRcYvZSMeocdFoNKds.CTtpMQkIEmRx2Kwz6ryVNiXf22TJIIu',
    '+370 (606) 868-3696',
    18,
    '2026-05-17'
),
(
    8,
    'rbullinghama@deliciousdays.com',
    '$2a$04$43xkrIB9L1LdsjDRsh/1GOTS2WJXl1FCbaJRD2aSOVnVGOdkEm66S',
    '+212 (633) 784-7540',
    20,
    '2026-01-21'
),
(
    6,
    'khowkinsb@purevolume.com',
    '$2a$04$EPP5lFWAH8kS69HzU7aaZOFVPVW5SgdKRo1T/Q/1wPd5x927cq22q',
    '+86 (426) 988-4641',
    17,
    '2025-09-26'
),
(
    2,
    'cmazonowiczc@amazonaws.com',
    '$2a$04$PjfIg4Pbu4rk7XXP4niPJu7.zNOB.eaUJETNtSs1JvDyAcDD0hxXG',
    '+7 (731) 893-7165',
    8,
    NULL
),
(
    5,
    'jkebelld@blogger.com',
    '$2a$04$VFh.HJF5OiGW/oZQFBH4DOGDVPJhPs8M/H7HJYhzN/uTTEsz2W/re',
    '+595 (973) 799-9384',
    6,
    '2025-10-01'
),
(
    2,
    'nrassmanne@deviantart.com',
    '$2a$04$FhzymmYV9EGqyXVRJKhCO.OI9Rafh5WaEdqFMnMh028halb2XdSlq',
    '+359 (870) 925-6942',
    15,
    NULL
),
(
    2,
    'rcumberlandf@ning.com',
    '$2a$04$0kcWdHPXgLvSvtRADjqsuu0CwHJFKsGGQIz2dc4rWH1SMFjPkhVl2',
    '+66 (442) 597-1482',
    9,
    NULL
),
(
    5,
    'slevesleyg@gov.uk',
    '$2a$04$PNKc2BK94FM.eaIyaHBAX.qV5ACk53IgCZdvdog0FDlKPhX2UgKCe',
    '+86 (858) 465-1151',
    20,
    '2026-02-05'
),
(
    1,
    'gsatfordh@angelfire.com',
    '$2a$04$eRD10D9VnF8p7j6JdEv9zecrdcvSX9NjLBMwixl8XAlHTfUXwYv8y',
    '+62 (970) 773-4508',
    10,
    NULL
),
(
    8,
    'adebruijnei@digg.com',
    '$2a$04$0Jh106wTOj0G07DmlUKXnuUGSrW1pZzhLpwDc9q70AwMjyFcyq7Hu',
    '+86 (837) 330-9582',
    12,
    '2026-06-18'
),
(
    5,
    'hbursnellj@va.gov',
    '$2a$04$gls/XUowC.B0AOveBweSSOzEgVfS4cRTotLzkH5SXB2F6plMhTy5q',
    '+62 (240) 732-8430',
    3,
    '2026-07-26'
),
(
    6,
    'fcoldhamk@umn.edu',
    '$2a$04$IgF/ib1s2BUsK/Ny7xru7.YTzmniI3A7MU.AhqjEgVV4kufTGZyIy',
    '+994 (280) 865-6257',
    21,
    '2025-10-17'
),
(
    5,
    'fcuffel@artisteer.com',
    '$2a$04$M.TOUPIeYmItRvEO/U1N0eMBMMy0xo3eOD35HMWJGaG/Wy42MGvg.',
    '+7 (487) 883-9045',
    15,
    '2026-04-01'
),
(
    5,
    'ofleurym@oracle.com',
    '$2a$04$gbAQ9yknQht73kZjl15YieqnuVQDea/DoZm9NjY8kdS1/ZxcfZ7Om',
    '+1 (861) 316-7392',
    5,
    '2026-03-24'
),
(
    5,
    'wlomasnyn@skyrock.com',
    '$2a$04$QWnSn0TWEPnebt2pHSm0Fuku4tIDxLeGSDmJpr6ZzaQImgq7int8K',
    '+501 (396) 344-0601',
    13,
    '2026-06-03'
),
(
    5,
    'adevinno@nationalgeographic.com',
    '$2a$04$7jttyiyBtXfF4cPrn81eBuUdnr7I07l.Knz0v1SE2pInmmCA0aoM6',
    '+33 (654) 636-1330',
    6,
    '2026-03-17'
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
