CREATE PROCEDURE [dbo].[spInsertNews]
	@seasonId int = null,
	@divisionId int = null,
	@week int = null,
	@playerId int = null,
	@teamId int = null,
	@gameDetailsId int = null,
	@newsText nvarchar(max),
	@id int OUTPUT
AS
	DECLARE @result int
	INSERT INTO [News] ([SeasonId], [DivisionId], [Week], [PlayerId], [TeamId], [NewsText], [GameDetailsId])
	VALUES (@seasonId, @divisionId, @week, @playerId, @teamId, @newsText, @gameDetailsId)


		SELECT @id = SCOPE_IDENTITY()

	   SET @result  = @@ERROR  
	SELECT @result

  RETURN @result
