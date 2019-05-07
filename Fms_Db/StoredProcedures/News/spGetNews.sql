CREATE PROCEDURE [dbo].[spGetNews]
	@seasonId int = null,
	@divisionId int = null,
	@week int = null,
	@playerId int = null,
	@teamId int = null,
	@gameDetailsId int = null
AS
	SELECT * FROM [News]
	WHERE ([SeasonId] = @seasonId OR @seasonId IS NULL)
	AND ([DivisionId] = @divisionId OR @divisionId IS NULL)
	AND ([Week] = @week OR @week IS NULL)
	AND ([PlayerId] = @playerId OR @playerId IS NULL)
	AND ([TeamId] = @teamId OR @teamId IS NULL)
	AND ([GameDetailsId] = @gameDetailsId OR @gameDetailsId IS NULL)
	ORDER BY [SeasonId] desc, [DivisionId], [Week] desc, [Id] desc
RETURN 0
