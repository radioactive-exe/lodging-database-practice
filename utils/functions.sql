/**
*
* This file contains utility functions, such as regex matching/checking to be used
* across the database.
*
*/

/**
*
* This function checks an input string according to regular expressions to verify its validity as a URL.
*
*/
CREATE
OR ALTER
FUNCTION dbo.fn_IsValidURL(@InputText nvarchar(4000)) RETURNS bit
WITH SCHEMABINDING
BEGIN
    -- ? If the input text is null, then it's technically a valid URL.
    -- ? This takes into account when social accounts are not linked for users, for example,
    -- ? thus being able to be used as the only constraint for that column, not requiring an
    -- ? additional `CHECK( x IS NULL OR IsValidUrl(x) = 1)` for each column
    IF @InputText IS NULL
        RETURN 1;

    -- * The input trimmed from whitespace (copying URLs can sometimes end up with trailing or leading spaces)
    DECLARE @TrimmedInput nvarchar(4000) = TRIM(@InputText);

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
FUNCTION dbo.fn_IsValidPhoneNumber(@InputText nvarchar(50)) RETURNS bit
WITH SCHEMABINDING
BEGIN

    -- ? Since the phone number must be submitted when signing up, being NULL is NOT valid here

    DECLARE @TrimmedInput nvarchar(50) = TRIM(@InputText);

    -- * The regexp that outlines the format of phone numbers, with or without:
    -- * 1. Country codes
    -- * 2. Single spaces
    -- * 3. Dashes
    -- * 4. Parentheses
    DECLARE @InternationalPhoneNumber nvarchar(200) = N'^\+?(\d{1,3})?[-.\s]?(?:\(\d{3}\)|\d{3})[-.\s]?(\d[-.\s]?){6,9}\d$';

    RETURN CASE
        WHEN
            -- ? If the input matches the regular expression, then it's a valid phone number
            REGEXP_LIKE(@TrimmedInput, @InternationalPhoneNumber) THEN 1
        ELSE 0
    END;
END;

GO
PRINT 'Created phone number REGEX validation function.';
