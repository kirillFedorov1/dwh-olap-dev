
create   view fact.vw_Fact
as
select
	f.nPartYearMonth
	,f.FactID
	,f.ID_CatalogHierarchy
	,f.DocID
	,f.Quantity
	,f.AmountBP
	,f.AmountCP
	,f.AmountBP / f.Quantity as AmountBPQ
	,f.AmountCP / f.Quantity as AmountCPQ
	,f.AmountBP * 0.85 as AmountBPWithoutTax
	,f.AmountCP * 0.85 as AmountCPWithoutTax
	,f.ID_DateCreated
	,f.ID_mapping_DataSource
from fact.DB_Fact as f
