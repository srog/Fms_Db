CREATE PROCEDURE [dbo].[spUpdateMatchEvent]
	@id int,
	@matchId int,
	@eventType int,
	@minute int,
	@playerId int,
	@teamId int
AS
	UPDATE [MatchEvent] 
	SET [MatchId] = @matchId, 
	[EventType] = @eventType, 
	[Minute] = @minute, 
	[PlayerId] = @playerId, 
	[TeamId] = @teamId
	WHERE [Id] = @id
RETURN 0

