CREATE PROCEDURE [dbo].[spUpdateTeam]
	@id int,
	@name nvarchar(250),
	@divisionId int,
	@cash int,
	@stadiumCapacity int,
	@yearFormed int,
	@gameDetailsId int
AS
	UPDATE [Team] 
	SET [Name] = @name,
	[DivisionId] = @divisionId,
	[Cash] = @cash,
	[StadiumCapacity] = @stadiumCapacity,
	[YearFormed] = @yearFormed,
	[GameDetailsId] = @gameDetailsId
	WHERE [Id] = @id
RETURN 0
