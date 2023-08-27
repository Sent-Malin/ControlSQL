create procedure usp_MakeFamilyPurchase
	@FamilySurName varchar(20)
as
declare @sum money
declare @id_family int = -1
select @id_family=ID from Family where SurName=@FamilySurName
if @id_family != -1
begin
	select @sum=sum(Value) from Basket where ID_Family=@id_family
	update dbo.Family set BudgetValue=BudgetValue-@sum where SurName=@FamilySurName
end
else
begin
	print('Enter family is not exist')
end