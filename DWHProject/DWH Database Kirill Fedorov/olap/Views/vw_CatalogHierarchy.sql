
create   view olap.vw_CatalogHierarchy
as
select
	ch.ID
	,ch.ID_Catalog
	,ch.CatalogUID_DS
	,ch.CatalogCode
	,ch.CatalogName
	,iif(ch.SkuID = 0, -1, ch.SkuID) as SkuID
	,ch.CatalogID_DateCreated
	,ch.ID_Brand
	,ch.BrandUID_DS
	,ch.BrandCode
	,ch.BrandName
	,ch.ID_mapping_DataSource
from dim.CatalogHierarchy as ch
where ch.[Level] = 'Catalog'
