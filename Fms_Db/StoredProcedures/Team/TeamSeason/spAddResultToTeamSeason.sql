CREATE PROCEDURE [dbo].[spAddResultToTeamSeason]
	@id int,
	@scoreFor int,
	@scoreAgainst int
AS

	DECLARE @currentPlayed int
	DECLARE @currentWon int
	DECLARE @currentDrawn int
	DECLARE @currentLost int
	DECLARE @currentPoints int
	DECLARE @currentGoalsFor int
	DECLARE @currentGoalsAgainst int
	
	SELECT 
		@currentPlayed = [Played],
		@currentWon = [Won],
		@currentDrawn = [Drawn],
		@currentLost = [Lost],
		@currentPoints = [Points],
		@currentGoalsFor = [GoalsFor],
		@currentGoalsAgainst = [GoalsAgainst]	
	FROM [TeamSeason] WHERE [Id] = @id 

	IF @scoreFor > @scoreAgainst 
	BEGIN
		SET @currentWon = @currentWon + 1
		SET @currentPoints = @currentPoints + 3
	END

	IF @scoreFor < @scoreAgainst 
	BEGIN
		SET @currentLost = @currentLost + 1
	END

	IF @scoreFor = @scoreAgainst 
	BEGIN
		SET @currentDrawn = @currentDrawn + 1
		SET @currentPoints = @currentPoints + 1
	END

	SET @currentGoalsFor = @currentGoalsFor + @scoreFor
	SET @currentGoalsAgainst = @currentGoalsAgainst + @scoreAgainst


	UPDATE [TeamSeason]
	SET [Played] = @currentPlayed + 1,
		[Won] = @currentWon,
		[Drawn] = @currentDrawn,
		[Lost] = @currentLost,
		[Points] = @currentPoints,
		[GoalsFor] = @currentGoalsFor,
		[GoalsAgainst] = @currentGoalsAgainst
	WHERE [Id] = @id

RETURN 0
