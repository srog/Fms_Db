CREATE PROCEDURE [dbo].[spInsertMatchEvent]
	@matchId int,
	@eventType int,
	@minute int,
	@playerId int,
	@teamId int,
	@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [MatchEvent] ([MatchId], [EventType], [Minute], [PlayerId], [TeamId])
	VALUES (@matchId, @eventType, @minute, @playerId, @teamId)
SET @id = SCOPE_IDENTITY()

    SET @result  = @@ERROR  
	SELECT @result


	RETURN @result
