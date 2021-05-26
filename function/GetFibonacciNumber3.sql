SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Kirill Cheremisin
-- =============================================

ALTER FUNCTION GetFibonacciNumber3
(
	@N Integer,
	@limit Integer
)
RETURNS Integer
AS
BEGIN
	DECLARE @currentValue Integer = 0;
	DECLARE @prevValue Integer = 0;
	DECLARE @i Integer = 0;

	IF @N = 1
		RETURN 0

	IF @N = 2
		RETURN 1

	WHILE @i < @N
	BEGIN
		SET @i += 1

		IF @i = 1
			SET @currentValue = 0

		IF @i= 2
			SET @currentValue = 1

		SET @currentValue = @currentValue + @prevValue
		SET @prevValue = @currentValue - @prevValue

		IF @currentValue > @limit
			RETURN @prevValue
	END

	RETURN @currentValue

END
GO

