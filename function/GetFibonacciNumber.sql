SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Kirill Cheremisin
-- =============================================
ALTER FUNCTION [dbo].[GetFibonacciNumber]
(
	@N integer,
	@limit integer
)
RETURNS integer
AS
BEGIN
	DECLARE @value1 Integer;
	DECLARE @value2 Integer;

	IF @N = 1
		RETURN 0
	IF @N = 2
		RETURN 1

	SET @value1 = [dbo].[GetFibonacciNumber](@N-1,@limit)
	SET @value2 = [dbo].[GetFibonacciNumber](@N-2,@limit)

	IF @value1 + @value2 <= @limit
		RETURN @value1 + @value2

	IF @value1 <= @limit
		RETURN @value1

	IF @value2 <= @limit
		RETURN @value2

	RETURN [dbo].[GetFibonacciNumber](@N-3,@limit)
END
