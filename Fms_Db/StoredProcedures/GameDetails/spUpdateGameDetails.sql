CREATE PROCEDURE [dbo].[spUpdateGameDetails]
	@id int,
	@currentSeasonId int,
	@currentWeek int,
	@managerName nvarchar(250),
	@teamId int
AS
	UPDATE [GameDetails] 
	SET [CurrentSeasonid] = @currentSeasonId,
		[CurrentWeek] = @currentWeek,
		[ManagerName] = @managerName,
		[TeamId] = @teamId
	WHERE [Id] = @id
RETURN 0
