/**
*
* This file contains utility functions, such as regex matching/checking to be used
* across the database.
*
*/

/* =====================================
=              VALIDATORS              =
===================================== */

/**
*
* This function checks an input string according to regular expressions to verify its validity as a URL.
*
*/
CREATE
OR ALTER
FUNCTION dbo.FN_IsValidURL(@InputText nvarchar(4000)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN
    -- ? If the input text is null, then it's technically a valid URL.
    -- ? This takes into account when social accounts are not linked for users, for example,
    -- ? thus being able to be used as the only constraint for that column, not requiring an
    -- ? additional `CHECK( x IS NULL OR IsValidUrl(x) = 1)` for each column
    IF @InputText IS NULL
        RETURN 1;

    -- * The input trimmed from whitespace (copying URLs can sometimes end up with trailing or leading spaces)
    DECLARE @TrimmedInput nvarchar(4000) = TRIM(@InputText);

    -- ? If the input is too long. A limit of 1500 was originally set by Internet Explorer (RIP), but we
    -- ? use it as a baseline, but we have to drop under 1700 to account for the constraints containing
    -- ? URLs
    IF LEN(@TrimmedInput) > 1500
        RETURN 0;

    -- * The regular expression that validates urls with either an `http` or an `https` protocol at the beginning
    DECLARE @URLWithProtocol nvarchar(256) = N'^https?://(www\.)?[a-zA-Z0-9][-a-zA-Z0-9.]*\.[a-zA-Z]{2,6}(/[-a-zA-Z0-9()@:%_+.~#?&/=]*)?$';

    -- * The regular expression that validates urls without any protocol at the beginning (such as `google.com`)
    DECLARE @URLWithoutProtocol nvarchar(256) = N'^[a-zA-Z0-9][-a-zA-Z0-9.]*\.[a-zA-Z]{2,6}(/[-a-zA-Z0-9()@:%_+.~#?&/=]*)?$';

    RETURN CASE
        -- ? If either regex successfully matches against the trimmed input, then it is a valid URL
        WHEN
            REGEXP_LIKE(@TrimmedInput, @URLWithProtocol)
            OR REGEXP_LIKE(@TrimmedInput, @URLWithoutProtocol) THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created URL REGEX validation function.';

GO

/**
*
* This function checks an input string to verify its validity as an international Phone Number.
* This includes both numbers with and without country codes (+).
*
*/
CREATE
OR ALTER
FUNCTION dbo.FN_IsValidPhoneNumber(@InputText nvarchar(50)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Since the phone number must be submitted when signing up, being NULL is NOT valid here

    DECLARE @TrimmedInput nvarchar(50) = TRIM(@InputText);

    -- ? Since there is no definite short-circuiting in SQL, check and immediately return if it's too long
    -- ? The longest phone numbers are 15 (and very rarely 17) numbers long, so this should account
    -- ? for the country code 00/+, parentheses, and/or dashes
    IF LEN(@TrimmedInput) > 22
        RETURN 0;

    -- * The regexp that outlines the format of phone numbers, with or without:
    -- * 1. Country codes
    -- * 2. Single spaces
    -- * 3. Dashes
    -- * 4. Parentheses
    DECLARE @InternationalPhoneNumber nvarchar(200) = N'^(?:\+|00)[1-9]\d{0,2}[-.\s]?(?:\(\d{3}\)|\d{3})[-.\s]?(\d[-.\s]?){6,9}\d$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression, then it's a valid phone number
            REGEXP_LIKE(@TrimmedInput, @InternationalPhoneNumber) THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created phone number REGEX validation function.';

GO

/**
*
* This function checks an input string to verify its validity as an email address.
*
*/
CREATE
OR ALTER
FUNCTION dbo.FN_IsValidEmail(@InputText nvarchar(512)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Since the email must be submitted when signing up, being NULL is NOT valid here

    DECLARE @TrimmedInput nvarchar(512) = TRIM(@InputText);

    -- ? Conventions and RFC 3696 often cap emails between 254 and 320 characters, so we will go with the safe`
    -- ? limit of bounding the length under 250
    IF (LEN(@TrimmedInput) > 250)
        RETURN 0;

    -- * The regexp that outlines the format of an email address
    DECLARE @Email nvarchar(200) = N'^[A-Za-z0-9_%+-]+(?:\.[A-Za-z0-9_%+-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression, then it's a valid email address
            REGEXP_LIKE(@TrimmedInput, @Email) THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created email address REGEX validation function.';

GO

/**
*
* This function checks an input string to verify its validity as a name, either for the first/last
* names or the billing names.
*
*/
CREATE
OR ALTER
FUNCTION dbo.FN_IsValidName(@InputText nvarchar(100)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Since the name is, well, a name, being NULL is NOT valid here

    DECLARE @TrimmedInput nvarchar(100) = TRIM(@InputText);

    -- ? If the name is too short - we consolidate the checks here as well
    IF (LEN(@TrimmedInput) < 2)
        RETURN 0;

    -- * The regexp that outlines the allowed format/characters in a name/identifier,
    -- * which allows letters, spaces, apostrophes, hyphens, and underscores (in the case of a
    -- * business name or other identifier for online wallets, etc.)
    DECLARE @Name nvarchar(30) = N'^[A-Za-z ''_-]+$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression
            REGEXP_LIKE(@TrimmedInput, @Name)
            -- ? And there are no consecutive spaces
            AND NOT REGEXP_LIKE(@TrimmedInput, '  ')
            -- ? Then we are good
            THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created name REGEX validation function.';

GO

/**
*
* This function checks an input string to verify its validity as a username, slightly different than
* regular names/identifiers above
*
*/
CREATE
OR ALTER
FUNCTION dbo.FN_IsValidUsername(@InputText nvarchar(100)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN

    -- ? Usernames being null are not valid

    DECLARE @TrimmedInput nvarchar(100) = TRIM(@InputText);

    -- ? If the name is too short/long - we consolidate the checks here as well
    IF (LEN(@TrimmedInput) < 2 OR LEN(@TrimmedInput) > 30)
        RETURN 0;

    -- * The regexp that outlines the allowed format/characters in a technical username,
    -- * which allows letters, numbers, hyphens, and underscores, and starting with an @
    DECLARE @Username nvarchar(30) = N'^@[A-Za-z0-9_-]{1,29}$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression
            REGEXP_LIKE(@TrimmedInput, @Username)
            -- ? Then we are good
            THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created username REGEX validation function.';

GO

/**
*
* This function checks an input string to verify its legitimacy as a credit card number
* It uses both length/regex validations and the Luhn Algorithm (https://www.geeksforgeeks.org/dsa/luhn-algorithm/)
*
*/
CREATE
OR ALTER
FUNCTION dbo.FN_IsValidCardNumber(@InputText varchar(30)) RETURNS bit
WITH SCHEMABINDING
AS
BEGIN
    -- * Clears any spaces or hyphens from the inputted sequence (we are still not sure if they are only numeric)
    -- * but these two characters are okay
    DECLARE @TrimmedCardNumber varchar(30) = REPLACE(REPLACE(@InputText, ' ', ''), '-', '');

    -- * Other immediate fail conditions, so we don't have to do the complex Luhn algorithm. return false immediately if:
    IF
        -- ? (1) The input is null, which in this case should not be allowed,
        -- ? as this would be when entering necessary card details
        @TrimmedCardNumber IS NULL
        -- ? (2) There is any non-digit character in the sequence
        OR @TrimmedCardNumber LIKE '%[^0-9]%'
        -- ? (3) The card number is not between 12-19
        -- *    Note: While Visa and MC are 15/16, different providers internationally can span between 12 and 19
        OR LEN(@TrimmedCardNumber) NOT BETWEEN 12 AND 19
        RETURN 0;

    -- ~ Now, we need to set up SQL loop.
    -- ! While in real life this would be handled much easier with a dedicated server written in .NET, Express,
    -- ! or any other language, or even handled in the frontend, both of those sections are beyond the scope of this
    -- ! project, so I am doing as much as I can in SQL.
    -- *                                                     ↓ Here, we start at the last index instead
    DECLARE @Sum int = 0, @Digit int, @ShouldDouble bit = 0, @Index int = LEN(@TrimmedCardNumber);

    -- * Loop
    WHILE @Index > 0
        BEGIN
            -- ? First, extract and cast the digit to an integer so we can perform math on it
            SET @Digit = CAST(SUBSTRING(@TrimmedCardNumber, @Index, 1) AS int);

            -- ? If we are on one of the digits we should double (every second digit from the right)
            IF @ShouldDouble = 1
                BEGIN
                    -- ? Double the digit
                    SET @Digit *= 2;

                    -- ? If the doubled result is greater than 9, remove 9
                    IF @Digit > 9
                        SET @Digit -= 9;
                END;

            -- ? Add the digit (either doubled and fixed to under 9 or still single)
            SET @Sum += @Digit;

            -- ? Flip the doubling flag and decrement the index
            SET @ShouldDouble = ~@ShouldDouble;
            SET @Index -= 1;
        END;

    RETURN CASE
        WHEN
            -- ? If the sum ends in 0 (aka is divisible by 10), then it was a valid number
            @Sum % 10 = 0 THEN 1
        ELSE 0
    END;
END;

GO

PRINT 'Created identification number validation function.';

/* =====================================
=     Calculators & other Utilities    =
===================================== */
