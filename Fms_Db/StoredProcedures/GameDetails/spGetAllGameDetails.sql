CREATE PROCEDURE [dbo].[spGetAllGameDetails]

AS
	SELECT * FROM [GameDetails] WHERE [TeamId] > 0
RETURN 0
