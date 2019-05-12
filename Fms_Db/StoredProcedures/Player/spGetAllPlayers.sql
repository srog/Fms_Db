CREATE PROCEDURE [dbo].[spGetAllPlayers]
	@gameDetailsId int = null,
	@teamId int = null
AS	
	SELECT * FROM [Player] WHERE 
	(([GameDetailsId] = @gameDetailsId OR @gameDetailsId IS NULL) AND
	([TeamId] = @teamId OR @teamId IS NULL))
RETURN 0
