CREATE PROCEDURE [dbo].[spUpdateMatch]
	@id int,
	@homeTeamScore int,
	@awayTeamScore int,
	@attendance int,
	@completed bit
AS
	UPDATE [Match] 
	SET [HomeTeamScore] = @homeTeamScore, 
	[AwayTeamScore] = @awayTeamScore, 
	[Attendance] = @attendance,
	[Completed] = @completed
	WHERE [Id] = @id
RETURN 0
