CREATE PROCEDURE [dbo].[spInsertPlayerStats]
	@assists int = 0,
	@cleanSheets int = 0,
	@games int = 0,
	@goals int = 0,
	@playerId int,
		@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [PlayerStats] ([Assists], [CleanSheets], [Games], [Goals], [PlayerId])
	VALUES (@assists, @cleanSheets, @games, @goals, @playerId)
SET @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
