CREATE PROCEDURE [dbo].[spInsertNews]
	@seasonId int,
	@divisionId int,
	@week int,
	@playerId int,
	@teamId int,
	@gameDetailsId int,
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
