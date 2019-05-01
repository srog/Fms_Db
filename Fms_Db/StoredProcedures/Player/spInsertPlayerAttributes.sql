﻿CREATE PROCEDURE [dbo].[spInsertPlayerAttributes]
	@playerId int,
	@aggression int = 0,
	@crossing int = 0,
	@defending int = 0,
	@form int = 0,
	@handling int = 0,
	@happinness int = 0,
	@morale int = 0,
	@passing int = 0,
	@shooting int = 0,
	@skills int = 0,
	@speed int = 0,
	@stamina int = 0,
	@strength int = 0,
	@tackling int = 0,
		@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [PlayerAttributes] ([Aggression], [Crossing], [Defending], [Form], [Handling], 
				[Happinness], [Morale], [Passing], [PlayerId], [Shooting], [Skills], [Speed], [Stamina], [Strength], [Tackling])
				VALUES (@aggression, @crossing, @defending, @form, @handling, @happinness, @morale, @passing, @playerId,
						@shooting, @skills, @speed, @stamina, @strength, @tackling)
SET @id = SCOPE_IDENTITY()

	IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
