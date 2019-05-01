CREATE PROCEDURE [dbo].[spAdvanceAllPlayerAges]
	@gameDetailsId int
AS
	UPDATE [Player] SET [Age] = [Age] + 1
		WHERE [GameDetailsId] = @gameDetailsId
RETURN 0
