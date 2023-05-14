create or alter view olap.vw_ContractorsHierarchy
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
go

create or alter view olap.vw_CatalogHierarchy
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
go

create or alter view olap.vw_Documents
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
go

create or alter view olap.vw_Fact
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
go

create or alter view dim.vw_D_Date
as
select distinct
	d.ID_YearMonth as nPartYearMonth
	,d.MonthName
	,d.ID_Month
	,d.ID_Quarter
	,d.ID_Year
from dim.D_Date as d
