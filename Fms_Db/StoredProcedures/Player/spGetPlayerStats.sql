CREATE PROCEDURE [dbo].[spGetPlayerStats]
	@id int
AS
	SELECT * FROM [PlayerStats] WHERE [PlayerId] = @id
RETURN 0
