CREATE PROCEDURE [dbo].[spInsertNews]
	@id int OUTPUT,
	@seasonId int,
	@divisionId int,
	@week int,
	@playerId int,
	@teamId int,
	@newsText nvarchar(max)
AS
	DEClARE @result int
	INSERT INTO [News] ([SeasonId], [DivisionId], [Week], [PlayerId], [TeamId], [NewsText])
	VALUES (@seasonId, @divisionId, @week, @playerId, @teamId, @newsText)


		SELECT @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

  RETURN @result
