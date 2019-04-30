CREATE PROCEDURE [dbo].[sp_GetTeamById]
	@id int
AS
	SELECT * FROM [Team] WHERE [Id] = @id
RETURN 0
