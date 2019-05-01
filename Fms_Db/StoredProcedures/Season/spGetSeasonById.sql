CREATE PROCEDURE [dbo].[spGetSeasonById]
	@id int
AS
	SELECT * FROM [Season] WHERE [Id] = @id
RETURN 0
