CREATE PROCEDURE [dbo].[spGetPlayerAttributes]
	@playerId int
AS
	SELECT * FROM [PlayerAttributes] WHERE [PlayerId] = @playerId
RETURN 0
