
create   view olap.vw_Documents
as
select
	d.nPartYearMonth
	,d.DocID
	,d.ID_ContractorsHierarchy
	,d.DocNumber
	,d.ID_DocDate
	,d.ID_DateCreated
	,d.ID_mapping_DataSource
from fact.Documents as d
