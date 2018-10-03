CREATE FUNCTION LPAD
(
@string VARCHAR(MAX),
@length INT,
@pad CHAR
)
RETURNS VARCHAR(MAX)
AS
BEGIN
RETURN REPLICATE(@pad, @length - LEN(@string)) + @string;
END