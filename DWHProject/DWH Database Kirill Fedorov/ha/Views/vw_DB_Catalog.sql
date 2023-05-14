
create   view ha.vw_DB_Catalog
as
select
	try_cast(c.CatalogID as int) as CatalogID
	,c.SkuCode
	,try_cast(c.SkuID as int) as SkuID
	,c.SkuName
	,d.ID as ID_DateCreated
from sa.DB_Catalog as c
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, c.DateCreated)
