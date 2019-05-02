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

	IF @completed = 1
	BEGIN
		DECLARE @teamSeasonIdHome int, @teamSeasonIdAway int
		SELECT @teamSeasonIdHome = [Id]
			FROM [TeamSeason] 
			WHERE [GameDetailsId] = @gameDetailsId
			AND [SeasonId] = @seasonId
			AND [DivisionId] = @divisionId
			AND [TeamId] = @homeTeamId

		SELECT @teamSeasonIdAway = [Id]
			FROM [TeamSeason] 
			WHERE [GameDetailsId] = @gameDetailsId
			AND [SeasonId] = @seasonId
			AND [DivisionId] = @divisionId
			AND [TeamId] = @awayTeamId
			
		EXEC spRecalculateTeamSeason @teamSeasonIdHome
		EXEC spRecalculateTeamSeason @teamSeasonIdAway
	END

RETURN 0
