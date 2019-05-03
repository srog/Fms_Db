CREATE PROCEDURE [dbo].[spInsertSeason]
	@id int OUTPUT,
	@gameDetailsId int ,
	@startYear int,
	@completed bit = 0
AS
	DECLARE @result int

	INSERT INTO [Season] ([GameDetailsId], [StartYear], [Completed])
	VALUES (@gameDetailsId, @startYear, @completed)

	SELECT @id = SCOPE_IDENTITY()
			
    SET @result  = @@ERROR  
	SELECT @result
RETURN @result