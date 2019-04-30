CREATE PROCEDURE [dbo].[sp_GetPlayersByTeam]
	@teamId int
AS
	SELECT * FROM [Player] WHERE [TeamId] = @teamId
RETURN 0
