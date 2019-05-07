CREATE PROCEDURE [dbo].[spInsertPlayerAttribute]
	@playerId int,
	@attributeId int,
	@attributeValue int,
	@id int OUTPUT
AS
DECLARE @result int
	INSERT INTO [PlayerAttribute] ([PlayerId], [AttributeId], [AttributeValue])
	VALUES (@playerId, @attributeId, @attributeValue)

	SET @id = SCOPE_IDENTITY()

    SET @result  = @@ERROR  
	SELECT @result
RETURN @result
