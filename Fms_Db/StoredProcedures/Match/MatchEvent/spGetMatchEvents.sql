CREATE PROCEDURE [dbo].[spGetMatchEvents]
	@matchId int = null,
	@eventType int = null,
	@minute int = null,
	@playerId int = null,
	@teamId int = null
AS
	SELECT * FROM [MatchEvent] WHERE
	([MatchId] = @matchId OR @matchId IS NULL) AND
	([EventType] = @eventType OR @eventType IS NULL) AND
	([Minute] = @minute OR @minute IS NULL) AND
	([PlayerId] = @playerId OR @playerId IS NULL) AND
	([TeamId] = @teamId OR @teamId IS NULL) 
RETURN 0
