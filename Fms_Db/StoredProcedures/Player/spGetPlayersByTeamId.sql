CREATE PROCEDURE [dbo].[spGetPlayersByTeamId]
	@teamId int
AS
	SELECT * FROM [Player] WHERE [TeamId] = @teamId
RETURN 0
