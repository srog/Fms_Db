CREATE PROCEDURE [dbo].[spUpdateMatchGoal]
	@id int,
	@matchId int,
	@minute int,
	@playerId int,
	@teamId int,
	@assistPlayerId int,
	@ownGoal bit

AS
	UPDATE [MatchGoal]
	SET [MatchId] = @matchId,
		[Minute] = @minute,
		[PlayerId] = @playerId,
		[TeamId] = @teamId,
		[AssistPlayerId] = @assistPlayerId,
		[OwnGoal] = @ownGoal
	WHERE [Id] = @id
RETURN 0
