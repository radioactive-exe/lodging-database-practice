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
