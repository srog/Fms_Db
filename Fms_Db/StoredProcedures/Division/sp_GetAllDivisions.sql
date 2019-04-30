CREATE PROCEDURE [dbo].[sp_GetAllDivisions]
AS
	SELECT [Id], [Name] FROM [Division]
RETURN 0
