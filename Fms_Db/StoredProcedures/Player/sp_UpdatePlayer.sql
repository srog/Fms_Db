CREATE PROCEDURE [dbo].[sp_UpdatePlayer]
	@id int = 0,
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int
AS
	UPDATE [Player]
	SET [Name] = @name,
		[Rating] = @rating,
		[Age] = @age,
		[Position] = @position,
		[TeamId] = @teamId,
		[Value] = @value,
		[Retired] = @retired,
		[InjuredWeeks] = @injuredWeeks
		WHERE [Id] = @id
RETURN 0
