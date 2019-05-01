CREATE PROCEDURE [dbo].[spGetPlayersByGame]
	@gameDetailsId int
AS
	SELECT * FROM [Player] WHERE [GameDetailsId] = @gameDetailsId
RETURN 0
