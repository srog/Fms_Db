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

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

RETURN @result