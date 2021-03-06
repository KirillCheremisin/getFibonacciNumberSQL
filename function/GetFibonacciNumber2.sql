SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Kirill Cheremisin
-- Example:		SELECT [dbo].[GetFibonacciNumber2] (32,999999999,default,default,default)
-- =============================================
ALTER FUNCTION [dbo].[GetFibonacciNumber2]
(
	@N integer,
	@limit integer,
	@currentN integer = 0,
	@currentValue integer = 0,
	@prevValue integer = 0
)
RETURNS integer
AS
BEGIN
	IF @currentN = 0
		SET @currentN = 1

	IF @currentN = 1
		SET @currentValue = 0
	IF @currentN = 2
		SET @currentValue = 1

	IF @currentN = @N BEGIN
		IF @currentValue > @limit
			RETURN @prevValue

		RETURN @currentValue
	END

	IF @currentValue > @limit
		RETURN @prevValue

	RETURN [dbo].[GetFibonacciNumber2](@N,@limit,@currentN + 1,@currentValue + @prevValue,@currentValue)
END
