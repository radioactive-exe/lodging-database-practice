CREATE OR ALTER FUNCTION dbo.fn_IsValidURL(@InputText nvarchar(4000))
RETURNS bit
WITH SCHEMABINDING
AS
BEGIN
    DECLARE
        @URLWithProtocol nvarchar(100) = N'^https?:\\/\\/(?:www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b(?:[-a-zA-Z0-9()@:%_\\+.~#?&\\/=]*)$';
    DECLARE @URLWithoutProtocol nvarchar(100) = N'^[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b(?:[-a-zA-Z0-9()@:%_\\+.~#?&//=]*)$';
    RETURN CASE
        WHEN REGEXP_LIKE(@InputText, @URLWithProtocol) OR REGEXP_LIKE(@InputText, @URLWithoutProtocol) THEN 1
        ELSE 0
    END;
END;
