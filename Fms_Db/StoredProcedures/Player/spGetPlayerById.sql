CREATE PROCEDURE [dbo].[spGetPlayerById]
	@id int = 0
AS
	SELECT * FROM [Player] WHERE [Id] = @id
RETURN 0
