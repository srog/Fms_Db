CREATE PROCEDURE [dbo].[spDeleteGameDetails]
	@id int
AS
	DELETE FROM [GameDetails] WHERE [Id] = @id
RETURN 0
