CREATE PROCEDURE [dbo].[spRetirePlayer]
	@id int
AS
	UPDATE [Player] SET [Retired] = 1 WHERE [Id] = @id
RETURN 0
