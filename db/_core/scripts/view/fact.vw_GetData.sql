create or alter view fact.vw_CSV_Documents
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
go

create or alter view fact.vw_CSV_Fact
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
from ha.CSV_Facts as f
	inner join mdt.MappingDataSource as m on m.Code = 'CSV'
	inner join mdt.Catalog as c on c.UID_DS = f.CatalogID
		and c.ID_mapping_DataSource = m.ID
		and c.MDT_FlagActive = 1
	inner join dim.CatalogHierarchy as ch on ch.ID = c.ID
		and ch.Level = 'Catalog'
	inner join fact.CSV_Documents as d on d.DocID = f.DocID
go

create or alter view fact.vw_DB_Documents
as
select
	d.nPartYearMonth
	,d.DocID
	,ch.ID as ID_ContractorsHierarchy
	,d.DocNumber
	,d.ID_DocDate
	,d.ID_DateCreated
	,m.ID as ID_mapping_DataSource
from ha.DB_Documents as d
	inner join mdt.MappingDataSource as m on m.Code = 'DB'
	inner join mdt.Contractors as c on c.UID_DS = d.ClientID
		and c.ID_mapping_DataSource = m.ID
		and c.MDT_FlagActive = 1
	inner join dim.ContractorsHierarchy as ch on ch.ID = c.ID
		and ch.Level = 'Contractor'
go

create or alter view fact.vw_DB_Fact
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
go

create or alter view fact.vw_Documents
as
select
	d.nPartYearMonth
	,d.DocID
	,d.ID_ContractorsHierarchy
	,d.DocNumber
	,d.ID_DocDate
	,d.ID_DateCreated
	,d.ID_mapping_DataSource
from fact.DB_Documents as d
go

create or alter view fact.vw_Fact
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
go
