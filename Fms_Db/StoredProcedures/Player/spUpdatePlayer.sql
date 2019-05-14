CREATE PROCEDURE [dbo].[spUpdatePlayer]
	@id int = 0,
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int,
	@teamSelection int
AS
DECLARE @result int

	UPDATE [Player]
	SET [Name] = @name,
		[Rating] = @rating,
		[Age] = @age,
		[Position] = @position,
		[TeamId] = @teamId,
		[Value] = @value,
		[Retired] = @retired,
		[InjuredWeeks] = @injuredWeeks,
		[TeamSelection] = @teamSelection
		WHERE [Id] = @id
	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
