
create   view mdt.vw_CSV_Catalog
as
select
	c.CatalogID as UID_DS
	,c.SkuCode as Code
	,c.SkuName as [Name]
	,c.SkuID
	,c.ID_DateCreated
	,c.BrandID as UID_DS_Brand
	,'CSV' as DataSource
from ha.CSV_Catalog as c
