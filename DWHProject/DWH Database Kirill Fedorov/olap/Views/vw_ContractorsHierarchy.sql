create   view olap.vw_ContractorsHierarchy
as
select
	ch.ID
	,ch.ID_Contractor
	,ch.ContractorUID_DS
	,ch.ContractorCode
	,ch.ContractorName
	,ch.ContractorID_DateCreated
	,ch.ID_Chain
	,ch.ChainUID_DS
	,ch.ChainCode
	,ch.ChainName
	,ch.ID_mapping_DataSource
from dim.ContractorsHierarchy as ch
where ch.[Level] = 'Contractor'
