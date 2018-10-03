CREATE FUNCTION dbo.trunc (@input datetime)
	RETURNS datetime
AS 
BEGIN
	DECLARE @fecha datetime,
		@fechastring varchar(10)
	SET @fechastring = CONVERT(varchar(10),@input, 103)
	SET @fecha = CONVERT(datetime, @fechastring, 103)
	RETURN @fecha 
END
