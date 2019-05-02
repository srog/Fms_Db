CREATE PROCEDURE [dbo].[spGetMatchEventById]
	@id int
AS
	SELECT * FROM [MatchEvent] WHERE [Id] = @id
RETURN 0
