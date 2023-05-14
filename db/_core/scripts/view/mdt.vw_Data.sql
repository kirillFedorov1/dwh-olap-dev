if not exists (select 1 from sys.schemas where name = 'mdt')
begin
	exec('create schema mdt')
end
go

create or alter view mdt.vw_CSV_Brand
as
select
	b.BrandID as UID_DS
	,b.BrandName as [Name]
	,b.Code
	,'CSV' as DataSource
from ha.CSV_Brand as b
go

create or alter view mdt.vw_CSV_Catalog
as
select
	c.CatalogID as UID_DS
	,c.SkuCode as Code
	,c.SkuName as [Name]
	,c.SkuID
	,c.ID_DateCreated
	,c.BrandID as UID_DS_Brand
	,'CSV' as DataSource
from ha.CSV_Catalog as c
go

create or alter view mdt.vw_CSV_Chain
as
select
	c.ChainID as UID_DS
	,c.ChainName as [Name]
	,c.Code
	,'CSV' as DataSource
from ha.CSV_Chain as c
go

create or alter view mdt.vw_CSV_Contractors
as
select
	c.ClientID as UID_DS
	,c.ClientCode as Code
	,c.ChainID as UID_DS_Chain
	,c.ClientName as [Name]
	,c.ID_DateCreated
	,'CSV' as DataSource
from ha.CSV_Contractors as c
go

create or alter view mdt.vw_DB_Catalog
as
select
	c.CatalogID as UID_DS
	,c.SkuCode as Code
	,c.SkuName as [Name]
	,c.SkuID
	,c.ID_DateCreated
	,'DB' as DataSource
from ha.DB_Catalog as c
go

create or alter view mdt.vw_DB_Contractors
as
select
	c.ClientID as UID_DS
	,c.ClientCode as Code
	,c.ClientName as [Name]
	,c.ID_DateCreated
	,'DB' as DataSource
from ha.DB_Contractors as c
go
