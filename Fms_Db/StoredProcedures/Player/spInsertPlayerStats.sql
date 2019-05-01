CREATE PROCEDURE [dbo].[spInsertPlayerStats]
	@assists int = 0,
	@cleanSheets int = 0,
	@games int = 0,
	@goals int = 0,
	@playerId int
AS
	INSERT INTO [PlayerStats] ([Assists], [CleanSheets], [Games], [Goals], [PlayerId])
	VALUES (@assists, @cleanSheets, @games, @goals, @playerId)
RETURN 0
