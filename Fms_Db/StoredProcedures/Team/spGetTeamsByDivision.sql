CREATE PROCEDURE [dbo].[spGetTeamsByDivision]
	@divisionId int
AS
	SELECT * FROM [Team] WHERE [DivisionId] = @divisionId
RETURN 0
