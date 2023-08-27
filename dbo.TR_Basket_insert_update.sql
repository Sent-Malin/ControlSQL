create trigger dbo.TR_Basket_insert_update on dbo.Basket
after insert
as
declare @count_ins int
declare @max_id int
declare @IDRequired table(ID_SKU int, quantity int)
set @count_ins=(select count(*) from inserted)
set @max_id=(select max(ID) from inserted)
insert into @IDRequired 
select ID_SKU, count(*) as quantity from inserted group by ID_SKU having count(*)>1
if (select count(*) from @IDRequired)>0
update Basket set DiscountValue=Value*0.05
where ID_SKU in(select ID_SKU from @IDRequired) 
and ID>@max_id-@count_ins
