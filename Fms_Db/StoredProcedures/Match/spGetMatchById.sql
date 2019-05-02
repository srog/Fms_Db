CREATE PROCEDURE [dbo].[spGetMatchById]
	@id int
AS
	SELECT * FROM [Match] WHERE [Id] = @id
RETURN 0
