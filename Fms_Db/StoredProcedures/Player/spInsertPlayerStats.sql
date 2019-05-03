CREATE PROCEDURE [dbo].[spInsertPlayerStats]
	@playerId int,
		@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [PlayerStats] ([Assists], [CleanSheets], [Games], [Goals], [PlayerId], [RedCards], [YellowCards])
	VALUES (0, 0, 0, 0, @playerId, 0, 0)

	SET @id = SCOPE_IDENTITY()

    SET @result  = @@ERROR  
	SELECT @result
RETURN @result
