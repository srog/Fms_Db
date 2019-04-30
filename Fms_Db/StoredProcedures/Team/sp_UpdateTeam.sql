CREATE PROCEDURE [dbo].[sp_UpdateTeam]
	@id int,
	@name nvarchar(250),
	@division int,
	@cash int,
	@stadiumCapacity int
AS
	UPDATE [Team] 
	SET [Name] = @name,
	[Division] = @division,
	[Cash] = @cash,
	[StadiumCapacity] = @stadiumCapacity
	WHERE [Id] = @id
RETURN 0
