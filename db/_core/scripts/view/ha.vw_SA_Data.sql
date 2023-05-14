create or alter view ha.vw_CSV_Facts
as
select
	d.ID_YearMonth as nPartYearMonth
	,try_cast(f.FactID as int) as FactID
	,try_cast(f.CatalogID as int) as CatalogID
	,try_cast(f.DocID as int) as DocID
	,try_cast(f.Quantity as int) as Quantity
	,try_cast(f.AmountBP as decimal(18, 4)) as AmountBP
	,try_cast(f.AmountCP as decimal(18, 4)) as AmountCP
	,d.ID as ID_DateCreated
from sa.CSV_Facts as f
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, f.DateCreated)
go

create or alter view ha.vw_CSV_Documents
as
select
	dc.ID_YearMonth as nPartYearMonth
	,try_cast(doc.DocID as int) as DocID
	,try_cast(doc.ClientID as int) as ClientID
	,doc.DocNumber
	,dd.ID as ID_DocDate
	,dc.ID as ID_DateCreated
from sa.CSV_Documents as doc
	inner join dim.D_Date as dd on convert(date, dd.Date) = try_convert(date, doc.DocDate)
	inner join dim.D_Date as dc on convert(date, dc.Date) = try_convert(date, doc.DateCreated)
go

create or alter view ha.vw_CSV_Contractors
as
select
	try_cast(c.ClientID as int) as ClientID
	,c.ClientCode
	,try_cast(c.ChainID as int) as ChainID
	,c.ClientName
	,d.ID as ID_DateCreated
from sa.CSV_Contractors as c
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, c.DateCreated)
go

create or alter view ha.vw_CSV_Chain
as
select
	try_cast(ChainID as int) as ChainID
	,ChainName
	,Code
from sa.CSV_Chain
go

create or alter view ha.vw_CSV_Catalog
as
select
	try_cast(c.CatalogID as int) as CatalogID
	,c.SkuCode
	,try_cast(c.SkuID as int) as SkuID
	,c.SkuName
	,try_cast(c.BrandID as int) as BrandID
	,d.ID as ID_DateCreated
from sa.CSV_Catalog as c
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, c.DateCreated, 105)
go

create or alter view ha.vw_CSV_Brand
as
select
	try_cast(BrandID as int) as BrandID
	,BrandName
	,Code
from sa.CSV_Brand
go

create or alter view ha.vw_DB_Fact
as
select
	d.ID_YearMonth as nPartYearMonth
	,try_cast(f.FactID as int) as FactID
	,try_cast(f.CatalogID as int) as CatalogID
	,try_cast(f.DocID as int) as DocID
	,try_cast(f.Quantity as int) as Quantity
	,try_cast(f.AmountBP as decimal(18, 4)) as AmountBP
	,try_cast(f.AmountCP as decimal(18, 4)) as AmountCP
	,d.ID as ID_DateCreated
from sa.DB_Fact as f
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, f.DateCreated)
go

create or alter view ha.vw_DB_Documents
as
select
	dc.ID_YearMonth as nPartYearMonth
	,try_cast(doc.DocID as int) as DocID
	,try_cast(doc.ClientID as int) as ClientID
	,doc.DocNumber
	,dd.ID as ID_DocDate
	,dc.ID as ID_DateCreated
from sa.DB_Documents as doc
	inner join dim.D_Date as dd on convert(date, dd.Date) = try_convert(date, doc.DocDate)
	inner join dim.D_Date as dc on convert(date, dc.Date) = try_convert(date, doc.DateCreated)
go

create or alter view ha.vw_DB_Contractors
as
select
	try_cast(c.ClientID as int) as ClientID
	,c.ClientCode
	,c.ClientName
	,d.ID as ID_DateCreated
from sa.DB_Contractors as c
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, c.DateCreated)
go

create or alter view ha.vw_DB_Catalog
as
select
	try_cast(c.CatalogID as int) as CatalogID
	,c.SkuCode
	,try_cast(c.SkuID as int) as SkuID
	,c.SkuName
	,d.ID as ID_DateCreated
from sa.DB_Catalog as c
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, c.DateCreated)
