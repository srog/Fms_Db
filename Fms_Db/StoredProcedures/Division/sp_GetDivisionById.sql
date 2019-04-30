CREATE PROCEDURE [dbo].[sp_GetDivisionById]
	@id int
AS
	SELECT * FROM [Division] WHERE [Id] = @id
RETURN 0
