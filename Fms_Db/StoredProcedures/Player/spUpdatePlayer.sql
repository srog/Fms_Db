﻿CREATE PROCEDURE [dbo].[spUpdatePlayer]
	@id int = 0,
	@name nvarchar(250),
	@rating int,
	@age int,
	@position int,
	@teamId int,
	@value int,
	@retired bit,
	@injuredWeeks int,
	@suspendedWeeks int,
	@teamSelection int
AS
DECLARE @result int

	UPDATE [Player]
	SET [Name] = @name,
		[Rating] = @rating,
		[Age] = @age,
		[Position] = @position,
		[TeamId] = @teamId,
		[Value] = @value,
		[Retired] = @retired,
		[InjuredWeeks] = @injuredWeeks,
		[SuspendedWeeks] = @suspendedWeeks,
		[TeamSelection] = @teamSelection
		WHERE [Id] = @id
	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
