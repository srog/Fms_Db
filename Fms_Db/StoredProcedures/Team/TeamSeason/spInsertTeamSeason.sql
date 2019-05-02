CREATE PROCEDURE [dbo].[spInsertTeamSeason]

	@teamId int,
	@gameDetailsId int,
	@divisionId int,
	@seasonId int,	
	@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [TeamSeason] ([GameDetailsId], [SeasonId], [TeamId], [DivisionId], 
				[Played], [Won], [Drawn], [Lost], [Points], [GoalsFor], [GoalsAgainst], [Position])
	VALUES (@gameDetailsId, @seasonId, @teamId, @divisionId, 0,0,0,0,0,0,0,0)

	SET @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result