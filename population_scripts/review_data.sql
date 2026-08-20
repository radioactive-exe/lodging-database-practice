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
