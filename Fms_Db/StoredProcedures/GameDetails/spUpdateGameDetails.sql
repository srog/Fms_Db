CREATE PROCEDURE [dbo].[spUpdateGameDetails]
	@id int,
	@currentYear int,
	@currentWeek int,
	@managerName nvarchar(250),
	@teamId int
AS
	UPDATE [GameDetails] 
	SET [CurrentYear] = @currentYear,
		[CurrentWeek] = @currentWeek,
		[ManagerName] = @managerName,
		[TeamId] = @teamId
	WHERE [Id] = @id
RETURN 0
