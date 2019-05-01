CREATE PROCEDURE [dbo].[spGetNews]
	@seasonId int = null,
	@divisionId int = null,
	@week int = null,
	@playerId int = null,
	@teamId int = null
AS
	SELECT * FROM [News]
	WHERE [SeasonId] = @seasonId
	AND [DivisionId] = @divisionId
	AND [Week] = @week
	AND [PlayerId] = @playerId
	AND [TeamId] = @teamId
	ORDER BY [SeasonId] desc, [DivisionId], [Week] desc, [Id] desc
RETURN 0
