if not exists (select 1 from sys.schemas where name = 'ha')
begin
	exec ('create schema ha')
end

if not exists (select 1 from sys.schemas where name = 'tmp')
begin
	exec('create schema tmp')
end

declare
	@startYear int = 1900
	,@endYear int = 2100
	,@month int
	,@boundaryList nvarchar(max) = N''

declare @year int = @startYear

while @year <= @endYear
begin
	set @month = 1
	while @month <= 12
	begin
		set @boundaryList += cast((@year * 100) + @month as nvarchar(6)) + N', '
		set @month += 1
	end
	set @year += 1
end

set @boundaryList = left(@boundaryList, len(@boundaryList) - 2);

exec('create partition function [pf_Range_Fact_nPartYearMonth](int) as range left for values (' + @boundaryList + ')')

create partition scheme [ps_Range_Fact_nPartYearMonth] as partition [pf_Range_Fact_nPartYearMonth] all to ([PRIMARY])

if object_id('ha.CSV_Contractors') is null
begin
	create table ha.CSV_Contractors (
		ID_Batch int not null
		,LoadDate datetime not null
		,ClientID int not null
		,ClientCode varchar(255) null
		,ChainID int null
		,ClientName varchar(255) null
		,ID_DateCreated int null
		,constraint PK_CSV_Contractors primary key (ClientID)
	)
end

if object_id('ha.CSV_Catalog') is null
begin
	create table ha.CSV_Catalog (
		ID_Batch int not null
		,LoadDate datetime not null
		,CatalogID int not null
		,SkuCode varchar(255) null
		,SkuName varchar(255) null
		,SkuID int null
		,BrandID varchar(255) null
		,ID_DateCreated int null
		,constraint PK_CSV_Catalog primary key (CatalogID)
	)
end

if object_id('ha.CSV_Brand') is null
begin
	create table ha.CSV_Brand (
		ID_Batch int not null
		,LoadDate datetime not null
		,BrandID int not null
		,BrandName varchar(255) null
		,Code varchar(255) null
		,constraint PK_CSV_Brand primary key (BrandID)
	)
end

if object_id('ha.CSV_Chain') is null
begin
	create table ha.CSV_Chain(
		ID_Batch int not null
		,LoadDate datetime not null
		,ChainID int not null
		,ChainName varchar(255) null
		,Code varchar(255) null
		,constraint PK_CSV_Chain primary key (ChainID)
	)
end


if object_id('ha.CSV_Documents') is null
begin
	create table ha.CSV_Documents (
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,DocID int not null
		,ClientID int null
		,DocNumber varchar(255) null
		,ID_DocDate int null
		,ID_DateCreated int null
		,constraint PK_CSV_Documents primary key clustered (nPartYearMonth, DocID) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth);
end

if object_id('ha.CSV_Facts') is null
begin
	create table ha.CSV_Facts (
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,FactID int not null
		,CatalogID int null
		,DocID int null
		,Quantity int null
		,AmountBP decimal(18, 4) null
		,AmountCP decimal(18, 4) null
		,ID_DateCreated int null
		,constraint PK_CSV_Facts primary key clustered (nPartYearMonth, FactID) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth);
end

if object_id('ha.DB_Contractors') is null
begin
	create table ha.DB_Contractors (
		ID_Batch int not null
		,LoadDate datetime not null
		,ClientID int not null
		,ClientCode varchar(255) null
		,ClientName varchar(255) null
		,ID_DateCreated int null
		,constraint PK_DB_Contractors primary key (ClientID)
	)
end

if object_id('ha.DB_Catalog') is null
begin
	create table ha.DB_Catalog (
		ID_Batch int not null
		,LoadDate datetime not null
		,CatalogID int not null
		,SkuCode varchar(255) null
		,SkuName varchar(255) null
		,SkuID int null
		,ID_DateCreated int null
		,constraint PK_DB_Catalog primary key (CatalogID)
	)
end

if object_id('ha.DB_Documents') is null
begin
	create table ha.DB_Documents (
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,DocID int not null
		,ClientID int null
		,DocNumber varchar(255) null
		,ID_DocDate int null
		,ID_DateCreated int null
		,constraint PK_DB_Documents primary key clustered (nPartYearMonth, DocID) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth);
end

if object_id('ha.DB_Facts') is null
begin
	create table ha.DB_Facts (
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,FactID int not null
		,CatalogID int null
		,DocID int null
		,Quantity int null
		,AmountBP decimal(18, 4) null
		,AmountCP decimal(18, 4) null
		,ID_DateCreated int null
		,constraint PK_DB_Fact primary key clustered (nPartYearMonth, FactID) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth);
end

if object_id('dbo.CheckLog') is null
begin
	create table dbo.CheckLog (
		ID int not null identity(1, 1)
		,ID_Batch int not null
		,Number int not null
		,ID_Record int not null
		,MessageType varchar(255) not null
		,ErrorMessage varchar(255) not null
		,ErrorDate datetime not null
	)
end