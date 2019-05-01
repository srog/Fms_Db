CREATE PROCEDURE [dbo].[spUpdateSeason]
	@id int,
	@gameDetailsId int,
	@startYear int,
	@completed bit
AS
	UPDATE [Season]
	SET [GameDetailsId] = @gameDetailsId,
		[StartYear] = @startYear,
		[Completed] = @completed
	WHERE [Id] = @id
RETURN 0
