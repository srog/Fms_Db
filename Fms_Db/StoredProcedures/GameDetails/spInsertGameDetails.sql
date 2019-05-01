CREATE PROCEDURE [dbo].[sp_InsertGameDetails]
	@teamId int,
	@managerName nvarchar(250)
AS
	INSERT INTO [GameDetails] ([TeamId], [ManagerName], [CurrentYear], [CurrentWeek])
	VALUES (@teamId, @managerName,2020, 0)
RETURN 0
