CREATE PROCEDURE [dbo].[spInsertGameDetails]
	@id int OUTPUT,
	@teamId int,
	@managerName nvarchar(250),
	@currentSeasonid int
AS
	DECLARE @result int
	INSERT INTO [GameDetails] ([TeamId], [ManagerName], [CurrentSeasonId], [CurrentWeek])
	VALUES (@teamId, @managerName,2020, 0)

	SELECT @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

RETURN @result
