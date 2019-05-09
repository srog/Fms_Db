CREATE PROCEDURE [dbo].[spGetAllPlayers]
	@gameDetailsId int
AS	
	SELECT * FROM [Player] WHERE [GameDetailsId] = @gameDetailsId
RETURN 0
