CREATE PROCEDURE [dbo].[spUpdatePlayerAttribute]
	@id int,
	@attributeValue int
AS
	UPDATE [PlayerAttribute] 
	SET  [AttributeValue] = @attributeValue
	WHERE [Id] = @id

RETURN 0