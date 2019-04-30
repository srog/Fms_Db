CREATE PROCEDURE [dbo].[sp_UpdatePlayerStats]
	@assists int,
	@cleanSheets int,
	@games int,
	@goals int,
	@playerId int
AS
	UPDATE [PlayerStats] SET 
	[Assists] = @assists, 
	[CleanSheets] = @cleanSheets, 
	[Games] = @games, 
	[Goals] = @goals 
	WHERE [PlayerId] = @playerId
RETURN 0
