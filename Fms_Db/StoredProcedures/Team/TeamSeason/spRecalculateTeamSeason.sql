CREATE PROCEDURE [dbo].[spRecalculateTeamSeason]
	@id int
AS
	DECLARE @teamId int
	DECLARE @seasonId int
	DECLARE @gameDetailsId int
	DECLARE @divisionId int

	DECLARE @played int
	DECLARE @won int
	DECLARE @drawn int
	DECLARE @lost int
	DECLARE @points int
	DECLARE @goalsFor int
	DECLARE @goalsAgainst int

	SELECT @teamId = [TeamId], @gameDetailsId = [GameDetailsId], @seasonId = [SeasonId], @divisionId = [DivisionId]
	FROM [TeamSeason]
	WHERE [Id] = @id

	SELECT @played = 
				COUNT(*) 
				FROM [Match] 
				WHERE ([HomeTeamId] = @teamId OR [AwayTeamId] = @teamId)
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1

	DECLARE @wonhome int, @wonaway int

	SELECT @wonhome = 
				COUNT(*) 
				FROM [Match] 
				WHERE [HomeTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
				AND [HomeTeamScore] > [AwayTeamScore]

	SELECT @wonaway =
				COUNT(*) 
				FROM [Match] 
				WHERE [AwayTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
				AND [HomeTeamScore] < [AwayTeamScore]

	SET @won = @wonhome + @wonaway

	DECLARE @losthome int, @lostaway int

	SELECT @losthome = 
				COUNT(*) 
				FROM [Match] 
				WHERE [HomeTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
				AND [HomeTeamScore] < [AwayTeamScore]

	SELECT @lostaway =
				COUNT(*) 
				FROM [Match] 
				WHERE [AwayTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
				AND [HomeTeamScore] > [AwayTeamScore]

	SET @lost = @losthome + @lostaway

	SELECT @drawn = 
				COUNT(*) 
				FROM [Match] 
				WHERE ([HomeTeamId] = @teamId OR [AwayTeamId] = @teamId)
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
				AND [HomeTeamScore] = [AwayTeamScore]

	DECLARE @homegoalsfor int, @awaygoalsfor int
	SELECT @homegoalsfor = 
				SUM([HomeTeamScore]) 
				FROM [Match] 
				WHERE [HomeTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
	SELECT @awaygoalsfor = 
				SUM([AwayTeamScore]) 
				FROM [Match] 
				WHERE [AwayTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
	SET @goalsFor = @homegoalsfor + @awaygoalsfor

	DECLARE @homegoalsagainst int, @awaygoalsagainst int
	SELECT @homegoalsagainst = 
				SUM([AwayTeamScore]) 
				FROM [Match] 
				WHERE [HomeTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
	SELECT @awaygoalsagainst = 
				SUM([HomeTeamScore]) 
				FROM [Match] 
				WHERE [AwayTeamId] = @teamId 
				AND [SeasonId] = @seasonId 
				AND [GameDetailsId] = @gameDetailsId
				AND [DivisionId] = @divisionId
				AND [Completed] = 1
	SET @goalsAgainst = @homegoalsagainst + @awaygoalsagainst
	
	SET @points = (@won * 3) + @drawn

	UPDATE [TeamSeason] 
	SET [Played] = @played,
		[Won] = @won,
		[Drawn] = @drawn,
		[Lost] = @lost,
		[GoalsFor] = @goalsFor,
		[GoalsAgainst] = @goalsAgainst,
		[Points] = @points
	WHERE [Id] = @id


RETURN 0
