CREATE PROCEDURE [dbo].[spGetMatchGoal]
	@id int
AS
	SELECT * FROM [MatchGoal] WHERE [Id] = @id
RETURN 0