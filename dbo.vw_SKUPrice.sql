create view dbo.vw_SKUPrice as
select *, dbo.GetSKUPrice(ID) as price_per_one from SKU