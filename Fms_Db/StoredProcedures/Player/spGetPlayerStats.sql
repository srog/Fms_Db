CREATE PROCEDURE [dbo].[spGetPlayerStats]
	@playerId int
AS
	SELECT * FROM [PlayerStats] WHERE [PlayerId] = @playerId
RETURN 0
