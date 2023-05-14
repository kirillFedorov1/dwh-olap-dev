create   view fact.vw_CSV_Documents
as
select
	d.nPartYearMonth
	,d.DocID
	,ch.ID as ID_ContractorsHierarchy
	,d.DocNumber
	,d.ID_DocDate
	,d.ID_DateCreated
	,m.ID as ID_mapping_DataSource
from ha.CSV_Documents as d
	inner join mdt.MappingDataSource as m on m.Code = 'CSV'
	inner join mdt.Contractors as c on c.UID_DS = d.ClientID
		and c.ID_mapping_DataSource = m.ID
		and c.MDT_FlagActive = 1
	inner join dim.ContractorsHierarchy as ch on ch.ID = c.ID
		and ch.Level = 'Contractor'
