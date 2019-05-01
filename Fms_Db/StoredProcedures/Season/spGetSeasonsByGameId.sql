CREATE PROCEDURE [dbo].[spGetSeasonsByGameId]
	@gameDetailsId int
AS

	SELECT * FROM [Season] WHERE [GameDetailsId] = @gameDetailsId
RETURN 0
