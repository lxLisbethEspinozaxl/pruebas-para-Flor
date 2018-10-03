CREATE FUNCTION MONTHS_BETWEEN (@date1 DATETIME, @date2 DATETIME) 
	RETURNS FLOAT
   AS
   BEGIN
     DECLARE @months FLOAT = DATEDIFF(month, @date2, @date1);
 
     -- Both dates does not point to the same day of month
     IF DAY(@date1) <> DAY(@date2) AND
        -- Both dates does not point to the last day of month
        (MONTH(@date1) = MONTH(@date1 + 1) OR MONTH(@date2) = MONTH(@date2 + 1))
     BEGIN
        -- Correct to include full months only and calculate fraction
        IF DAY(@date1) < DAY(@date2)
          SET @months = @months + CONVERT(FLOAT, 31 - DAY(@date2) + DAY(@date1)) / 31 - 1;
        ELSE    
          SET @months = @months + CONVERT(FLOAT, DAY(@date1) - DAY(@date2)) / 31;
     END
     RETURN @months; 
   END;
