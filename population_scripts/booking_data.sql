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
