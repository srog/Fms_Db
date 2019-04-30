CREATE PROCEDURE [dbo].[sp_GetTeamsByDivision]
	@divisionId int
AS
	SELECT * FROM [Team] WHERE [Division] = @divisionId
RETURN 0
