CREATE PROCEDURE [dbo].[spInsertTeam]

@name nvarchar(250),
	@divisionId int,
	@cash int,
	@stadiumCapacity int,
	@yearFormed int,
	@gameDetailsId int,
	@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [Team] ([Cash], [DivisionId], [Name], [StadiumCapacity], [YearFormed], [GameDetailsId])
	VALUES (@cash, @divisionId, @name, @stadiumCapacity, @yearFormed, @gameDetailsId)

	SET @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result