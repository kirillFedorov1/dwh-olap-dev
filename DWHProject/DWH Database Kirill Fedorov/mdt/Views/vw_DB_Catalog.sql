
create   view mdt.vw_DB_Catalog
as
select
	c.CatalogID as UID_DS
	,c.SkuCode as Code
	,c.SkuName as [Name]
	,c.SkuID
	,c.ID_DateCreated
	,'DB' as DataSource
from ha.DB_Catalog as c
