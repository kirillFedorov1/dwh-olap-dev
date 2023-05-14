﻿
create   view olap.vw_Fact
as
select
	f.nPartYearMonth
	,f.FactID
	,f.ID_CatalogHierarchy
	,f.DocID
	,f.Quantity
	,f.AmountBP
	,f.AmountCP
	,f.AmountBPQ
	,f.AmountCPQ
	,f.AmountBPWithoutTax
	,f.AmountCPWithoutTax
	,f.ID_DateCreated
	,f.ID_mapping_DataSource
from fact.Fact as f
