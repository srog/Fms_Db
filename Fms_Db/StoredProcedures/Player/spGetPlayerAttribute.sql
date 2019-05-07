CREATE PROCEDURE [dbo].[spGetPlayerAttribute]
	@id int
AS
	SELECT * FROM [PlayerAttribute] WHERE [Id] = @id
RETURN 0
