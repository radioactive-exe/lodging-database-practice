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
('Home', '1324 Nevada Hill', 'Suite 89', NULL, 14),
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

PRINT 'Filled out User Billing Address table.';

GO

/* =====================================
=Filling out the Payment Method Type LUT=
===================================== */

INSERT INTO
reservations.PaymentMethodType (TypeName, TypeDescription)
VALUES
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

PRINT 'Filled out Payment Method Type LUT.';
