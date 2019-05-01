CREATE PROCEDURE [dbo].[spGetPlayersByTeam]
	@teamId int
AS
	SELECT * FROM [Player] WHERE [TeamId] = @teamId
RETURN 0
