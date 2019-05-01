CREATE PROCEDURE [dbo].[spGetGameDetails]
	@id int
AS
	SELECT * FROM [GameDetails] WHERE [Id] = @id
RETURN 0
