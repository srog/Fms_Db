CREATE PROCEDURE [dbo].[spUpdatePlayerStats]
	@assists int,
	@cleanSheets int,
	@games int,
	@goals int,
	@redCards int,
	@yellowCards int,
	@playerId int
AS
	DECLARE @result int

	UPDATE [PlayerStats] SET 
	[Assists] = @assists, 
	[CleanSheets] = @cleanSheets, 
	[Games] = @games, 
	[Goals] = @goals ,
	[RedCards] = @redCards,
	[YellowCards] = @yellowCards
	WHERE [PlayerId] = @playerId

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
