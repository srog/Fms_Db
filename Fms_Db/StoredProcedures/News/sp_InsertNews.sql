CREATE PROCEDURE [dbo].[sp_InsertNews]
	@seasonId int,
	@divisionId int,
	@week int,
	@playerId int,
	@teamId int,
	@newsText nvarchar(max)
AS
	INSERT INTO [News] ([SeasonId], [DivisionId], [Week], [PlayerId], [TeamId], [NewsText])
	VALUES (@seasonId, @divisionId, @week, @playerId, @teamId, @newsText)
RETURN 0
