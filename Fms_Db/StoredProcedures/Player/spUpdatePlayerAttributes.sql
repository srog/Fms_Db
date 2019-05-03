CREATE PROCEDURE [dbo].[spUpdatePlayerAttributes]
	@playerId int,
	@aggression int,
	@crossing int,
	@defending int,
	@form int,
	@handling int,
	@happiness int,
	@morale int,
	@passing int,
	@shooting int = 0,
	@skills int,
	@speed int,
	@stamina int,
	@strength int,
	@tackling int
AS
DECLARE @result int
	UPDATE [PlayerAttributes]  SET 
	[Aggression] = @aggression, 
	[Crossing] = @crossing, 
	[Defending] = @defending, 
	[Form] = @form, 
	[Handling] = @handling,
	[Happiness] = @happiness, 
	[Morale] = @morale, 
	[Passing] = @passing, 
	[Shooting] = @shooting, 
	[Skills] = @skills, 
	[Speed] = @speed, 
	[Stamina] = @stamina, 
	[Strength] = @strength, 
	[Tackling] = @tackling
	WHERE [PlayerId] = @playerId

		IF @@ERROR = 0 
     SET @result  = 1
  ELSE SET @result = 0

	RETURN @result
