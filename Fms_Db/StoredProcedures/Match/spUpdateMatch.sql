CREATE PROCEDURE [dbo].[spUpdateMatch]
	@id int,
	@homeTeamScore int,
	@awayTeamScore int,
	@completed bit
AS
	UPDATE [Match] 
	SET [HomeTeamScore] = @homeTeamScore, 
	[AwayTeamScore] = @awayTeamScore, 
	[Completed] = @completed
	WHERE [Id] = @id
RETURN 0
