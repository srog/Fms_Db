CREATE PROCEDURE [dbo].[spRecalculateDivisionPositions]
	@seasonId int,
	@divisionId int
AS
	CREATE TABLE #tempdivision
	(
		Id int,
		Points int,
		GoalDiff int,
		GoalsScored int,
		Position int
	)

	INSERT INTO #tempdivision
	SELECT [Id], [Points], ([GoalsFor] - [GoalsAgainst]), [GoalsFor], [Position]
	FROM [TeamSeason] 
	WHERE [SeasonId] = @seasonId
	AND [DivisionId] = @divisionId

	UPDATE td  
	SET td.[Position] = 
		((SELECT COUNT(*) FROM #tempdivision WHERE [Points] > td.Points ) + 
		(SELECT COUNT(*) FROM #tempdivision WHERE [Points] = td.Points AND [GoalDiff] > td.[GoalDiff] ) + 
		(SELECT COUNT(*) FROM #tempdivision WHERE [Points] = td.Points AND [GoalDiff] = td.[GoalDiff] AND [GoalsScored] > td.[GoalsScored]) + 
		(SELECT COUNT(*) FROM #tempdivision WHERE [Points] = td.Points AND [GoalDiff] = td.[GoalDiff] AND [GoalsScored] = td.[GoalsScored] AND [Id] > td.[Id] ) + 
		1)
	
	FROM #tempdivision td

	UPDATE ts
	SET [Position] = (SELECT [Position] FROM #tempdivision WHERE [Id] = ts.[Id])
	FROM [TeamSeason] ts 
	INNER JOIN #tempdivision td on td.Id = ts.Id

RETURN 0
