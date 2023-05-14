create or alter view dim.vw_ContractorsHierarchy
as
select
	'Contractor' as Level
	,c.ID
	,c.ID as ID_Contractor
	,c.UID_DS as ContractorUID_DS
	,c_map.[Name] as ContractorName
	,c_map.Code as ContractorCode
	,c.ID_DateCreated as ContractorID_DateCreated
	,ch.ID as ID_Chain
	,ch.UID_DS as ChainUID_DS
	,ch.Code as ChainCode
	,ch.[Name] as ChainName
	,c.MDT_FlagActive
	,c.ID_mapping_DataSource
from dim.Contractors as c
	left join dim.Contractors as c_map on c_map.ID = c.ID_mapping_MDT
	left join dim.Chain as ch on ch.ID = c_map.ID_Chain

union all

select
	'Chain' as Level
	,ch.ID
	,c.ID as ID_Contractor
	,c.UID_DS as ContractorUID_DS
	,c.[Name] as ContractorName
	,c.Code as ContractorCode
	,c.ID_DateCreated as ContractorID_DateCreated
	,ch.ID as ID_Chain
	,ch.UID_DS as ChainUID_DS
	,ch_map.Code as ChainCode
	,ch_map.[Name] as ChainName
	,ch.MDT_FlagActive
	,ch.ID_mapping_DataSource
from dim.Chain as ch
	left join dim.Chain as ch_map on ch_map.ID = ch.ID_mapping_MDT
	inner join dim.Contractors as c on c.ID = - 1
go

create or alter view dim.vw_CatalogHierarchy
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
