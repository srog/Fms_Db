CREATE PROCEDURE [dbo].[spInsertTeam]

@name nvarchar(250),
	@divisionId int,
	@cash int,
	@stadiumCapacity int,
	@yearFormed int,
	@gameDetailsId int,
	@formationId int,
	@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [Team] ([Cash], [DivisionId], [Name], [StadiumCapacity], [YearFormed], [GameDetailsId], [FormationId])
	VALUES (@cash, @divisionId, @name, @stadiumCapacity, @yearFormed, @gameDetailsId, @formationId)

	SET @id = SCOPE_IDENTITY()

    SET @result  = @@ERROR  
	SELECT @result
RETURN @result
