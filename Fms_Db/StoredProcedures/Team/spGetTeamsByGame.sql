CREATE PROCEDURE [dbo].[spGetTeamsByGame]
	@gameDetailsId int
AS
	SELECT * FROM [Team] WHERE [GameDetailsId] = @gameDetailsId
RETURN 0
