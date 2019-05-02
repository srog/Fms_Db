CREATE PROCEDURE [dbo].[spGetTeamSeasons]
	@teamId int = null,
	@seasonId int  = null,
	@gameDetailsId int = null,
	@divisionId int = null
AS
	SELECT * FROM [TeamSeason]
	WHERE 
	([TeamId] = @teamId OR @teamId IS NULL) AND
	([SeasonId] = @seasonId OR @seasonId IS NULL) AND
	([GameDetailsId] = @gameDetailsId OR @gameDetailsId IS NULL) AND
	([DivisionId] = @divisionId OR @divisionId IS NULL) 
	
	
RETURN 0
