CREATE PROCEDURE [dbo].[spInsertTeamSeason]

	@teamId int,
	@gameDetailsId int,
	@divisionId int,
	@seasonId int,	
	@position int,
	@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [TeamSeason] ([GameDetailsId], [SeasonId], [TeamId], [DivisionId], 
				[Played], [Won], [Drawn], [Lost], [Points], [GoalsFor], [GoalsAgainst], [Position])
	VALUES (@gameDetailsId, @seasonId, @teamId, @divisionId, 0,0,0,0,0,0,0,@position)

	SET @id = SCOPE_IDENTITY()

    SET @result  = @@ERROR  
	SELECT @result
RETURN @result
