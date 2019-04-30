CREATE PROCEDURE [dbo].[sp_InsertPlayer]
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int,
	@id int OUTPUT
AS
	INSERT INTO [Player] ([Name], [Age], [Rating], [Position], [TeamId], [Value], [Retired], [InjuredWeeks])
	VALUES (@name, @age, @rating, @position, @teamId, @value, @retired, @injuredWeeks)

	SET @id = SCOPE_IDENTITY()
RETURN 0
