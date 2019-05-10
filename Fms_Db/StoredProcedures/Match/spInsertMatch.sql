﻿CREATE PROCEDURE [dbo].[spInsertMatch]
	@gameDetailsId int,
	@seasonId int,
	@divisionId int,
	@week int,
	@homeTeamId int,
	@awayTeamId int,
	@homeTeamScore int,
	@awayTeamScore int,
	@id int OUTPUT
AS
DECLARE @result int

	INSERT INTO [Match] ([GameDetailsId], [SeasonId], [DivisionId], [Week], [HomeTeamId], [AwayTeamId], [HomeTeamScore], [AwayTeamScore], [Completed])
		VALUES (@gameDetailsId, @seasonId, @divisionId, @week, @homeTeamId, @awayTeamId, @homeTeamScore, @awayTeamScore, 0)
SET @id = SCOPE_IDENTITY()

	SET @result  = @@ERROR  
	SELECT @result

	RETURN @result
