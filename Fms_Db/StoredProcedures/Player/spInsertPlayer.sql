CREATE PROCEDURE [dbo].[spInsertPlayer]
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int,
	@gameDetailsId int,
	@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [Player] ([Name], [Age], [Rating], [Position], [TeamId], [Value], [Retired], [InjuredWeeks], [GameDetailsId])
	VALUES (@name, @age, @rating, @position, @teamId, @value, @retired, @injuredWeeks, @gameDetailsId)

	SET @id = SCOPE_IDENTITY()

    SET @result  = @@ERROR  
	SELECT @result
RETURN @result