
create   view fact.vw_DB_Fact
as
select
	f.nPartYearMonth
	,f.FactID
	,ch.ID as ID_CatalogHierarchy
	,f.DocID
	,f.Quantity
	,f.AmountBP
	,f.AmountCP
	,f.ID_DateCreated
	,m.ID as ID_mapping_DataSource
from ha.DB_Facts as f
	inner join mdt.MappingDataSource as m on m.Code = 'DB'
	inner join mdt.Catalog as c on c.UID_DS = f.CatalogID
		and c.ID_mapping_DataSource = m.ID
		and c.MDT_FlagActive = 1
	inner join dim.CatalogHierarchy as ch on ch.ID = c.ID
		and ch.Level = 'Catalog'
	inner join fact.DB_Documents as d on d.DocID = f.DocID
