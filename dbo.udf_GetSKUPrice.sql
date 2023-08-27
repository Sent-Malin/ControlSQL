create function dbo.GetSKUPrice (@ID_SKU int)
returns decimal(18,2)
as
begin
	declare @price decimal(18,2);
	declare @value money;
	declare @quantity int;
	select @value=sum(Value), @quantity=sum(Quantity) from Basket where ID_SKU=@ID_SKU;
	set @price=@value/@quantity;
	return(@price)
end;