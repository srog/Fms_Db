CREATE PROCEDURE [dbo].[spInsertMatch]
	@gameDetailsId int,
	@seasonId int,
	@divisionId int,
	@week int,
	@homeTeamId int,
	@awayTeamId int,
	@homeTeamScore int,
	@awayTeamScore int,
	@completed bit,
	@id int OUTPUT
AS
DECLARE @result int

	INSERT INTO [Match] ([GameDetailsId], [SeasonId], [DivisionId], [Week], [HomeTeamId], [AwayTeamId], [HomeTeamScore], [AwayTeamScore], [Completed])
		VALUES (@gameDetailsId, @seasonId, @divisionId, @week, @homeTeamId, @awayTeamId, @homeTeamScore, @awayTeamScore, @completed)
SET @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
