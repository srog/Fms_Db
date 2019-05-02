CREATE PROCEDURE [dbo].[spGetTeamSeasonById]
	@id int
AS
	SELECT * FROM [TeamSeason] WHERE [Id] = @id
RETURN 0
