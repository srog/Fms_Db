CREATE PROCEDURE [dbo].[spGetMatches]
	@gameDetailsId int = null,
	@seasonId int = null,
	@divisionId int = null,
	@week int = null,
	@homeTeamId int = null,
	@awayTeamId int = null,
	@completed bit = null

AS
	SELECT * FROM [Match] 
	WHERE 
	([GameDetailsId] = @gameDetailsId OR @gameDetailsId IS NULL) AND
	([SeasonId] = @seasonId OR @seasonId IS NULL) AND
	([DivisionId] = @divisionId OR @divisionId IS NULL) AND
	([Week] = @week OR @week IS NULL) AND
	([HomeTeamId] = @homeTeamId OR @homeTeamId IS NULL) AND
	([AwayTeamId] = @awayTeamId OR @awayTeamId IS NULL) AND
	([Completed] = @completed OR @completed IS NULL)
RETURN 0
