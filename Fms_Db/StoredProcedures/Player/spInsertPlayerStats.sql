CREATE PROCEDURE [dbo].[spInsertPlayerStats]
	@assists int,
	@cleanSheets int,
	@games int,
	@goals int,
	@playerId int,
	@redCards int,
	@yellowCards int,
		@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [PlayerStats] ([Assists], [CleanSheets], [Games], [Goals], [PlayerId], [RedCards], [YellowCards])
	VALUES (@assists, @cleanSheets, @games, @goals, @playerId, @redCards, @yellowCards)
SET @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
