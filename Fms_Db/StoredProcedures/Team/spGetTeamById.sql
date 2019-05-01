CREATE PROCEDURE [dbo].[spGetTeamById]
	@id int
AS
	SELECT * FROM [Team] WHERE [Id] = @id
RETURN 0
