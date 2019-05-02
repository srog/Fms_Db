CREATE PROCEDURE [dbo].[spUpdateMatch]
	@id int,
	@gameDetailsId int,
	@seasonId int,
	@divisionId int,
	@week int,
	@homeTeamId int,
	@awayTeamId int,
	@homeTeamScore int,
	@awayTeamScore int,
	@completed bit
AS
	UPDATE [Match] 
	SET [GameDetailsId] = @gameDetailsId, 
	[SeasonId] = @seasonId, 
	[DivisionId] = @divisionId, 
	[Week] = @week, 
	[HomeTeamId] = @homeTeamId, 
	[AwayTeamId] = @awayTeamId, 
	[HomeTeamScore] = @homeTeamScore, 
	[AwayTeamScore] = @awayTeamScore, 
	[Completed] = @completed
	WHERE [Id] = @id
RETURN 0
