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
