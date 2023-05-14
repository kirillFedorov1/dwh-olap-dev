
create   view dim.vw_CatalogHierarchy
as
select
	'Catalog' as Level
	,c.ID
	,c.ID as ID_Catalog
	,c.UID_DS as CatalogUID_DS
	,c_map.[Name] as CatalogName
	,c_map.Code as CatalogCode
	,c_map.SkuID
	,c.ID_DateCreated as CatalogID_DateCreated
	,b.ID as ID_Brand
	,b.UID_DS as BrandUID_DS
	,b.Code as BrandCode
	,b.[Name] as BrandName
	,c.MDT_FlagActive
	,c.ID_mapping_DataSource
from dim.Catalog as c
	left join dim.Catalog as c_map on c_map.ID = c.ID_mapping_MDT
	left join dim.Brand as b on b.ID = c_map.ID_Brand
union all

select
	'Brand' as Level
	,b.ID
	,c.ID as ID_Catalog
	,c.UID_DS as CatalogUID_DS
	,c.[Name] as CatalogName
	,c.Code as CatalogCode
	,c.SkuID
	,c.ID_DateCreated as CatalogID_DateCreated
	,b.ID as ID_Brand
	,b.UID_DS as BrandUID_DS
	,b_map.Code as BrandCode
	,b_map.[Name] as BrandName
	,b.MDT_FlagActive
	,b.ID_mapping_DataSource
from dim.Brand as b
	left join dim.Brand as b_map on b_map.ID = b.ID_mapping_MDT
	inner join dim.Catalog as c on c.ID = -1
