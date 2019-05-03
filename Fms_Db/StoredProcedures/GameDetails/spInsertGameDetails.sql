CREATE PROCEDURE [dbo].[spInsertGameDetails]
	@id int OUTPUT,
	@managerName nvarchar(250)

AS
	DECLARE @result int
	INSERT INTO [GameDetails] ([TeamId], [ManagerName], [CurrentSeasonId], [CurrentWeek])
	VALUES (0, @managerName,0, 0)

	SELECT @id = SCOPE_IDENTITY()

    SET @result  = @@ERROR  
	SELECT @result
RETURN @result
