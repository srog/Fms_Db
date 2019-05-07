CREATE PROCEDURE [dbo].[spGetPlayerAttributes]
	@playerId int
AS
	SELECT * FROM [PlayerAttribute] WHERE [PlayerId] = @playerId
RETURN 0
