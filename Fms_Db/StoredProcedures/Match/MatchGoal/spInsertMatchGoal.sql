CREATE PROCEDURE [dbo].[spInsertMatchGoal]
	@matchId int,
	@minute int,
	@playerId int,
	@teamId int,
	@assistPlayerId int,
	@ownGoal bit,
	@id int OUTPUT

AS
	DECLARE @result int

	INSERT INTO [MatchGoal] ([MatchId], [Minute], [PlayerId], [TeamId], [AssistPlayerId], [OwnGoal])
	VALUES (@matchId, @minute, @playerId, @teamId, @assistPlayerId, @ownGoal)

SET @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
