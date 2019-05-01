CREATE PROCEDURE [dbo].[spGetPlayerById]
	@id int
AS
	SELECT * FROM [Player] WHERE [Id] = @id
RETURN 0
