CREATE PROCEDURE [dbo].[spGetMatchGoals]
	@matchId int = null,
	@minute int = null,
	@playerId int = null,
	@teamId int = null,
	@assistPlayerId int = null,
	@ownGoal bit = null
AS

	SELECT * FROM [MatchGoal]
	WHERE 
	([MatchId] = @matchId OR @matchId IS NULL) AND
	([Minute] = @minute OR @minute IS NULL) AND
	([PlayerId] = @playerId OR @playerId IS NULL) AND
	([TeamId] = @teamId OR @teamId IS NULL) AND
	([AssistPlayerId] = @assistPlayerId OR @assistPlayerId IS NULL) AND
	([OwnGoal] = @ownGoal OR @ownGoal IS NULL) 

RETURN 0
