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
