CREATE PROCEDURE [dbo].[spGetAllFreeAgents]
AS
	SELECT * FROM [Player] WHERE [TeamId] = 0 
RETURN 0
