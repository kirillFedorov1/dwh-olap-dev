if not exists (select 1 from sys.schemas where name = 'sa')
begin
	exec ('create schema sa')
end

if object_id('sa.DB_Contractors') is null
begin
	create table sa.DB_Contractors (
		ID_Batch int not null
		,LoadDate datetime not null
		,ClientID varchar(255) null
		,ClientCode varchar(255) null
		,ClientName varchar(255) null
		,DateCreated varchar(255) null
	)
end

if object_id('sa.DB_Catalog') is null
begin
	create table sa.DB_Catalog (
		ID_Batch int not null
		,LoadDate datetime not null
		,CatalogID varchar(255) null
		,SkuCode varchar(255) null
		,SkuName varchar(255) null
		,SkuID varchar(255) null
		,DateCreated varchar(255) null
	)
end

if object_id('sa.DB_Documents') is null
begin
	create table sa.DB_Documents (
		ID_Batch int not null
		,LoadDate datetime not null
		,DocID varchar(255) null
		,ClientID varchar(255) null
		,DocNumber varchar(255) null
		,DocDate varchar(255) null
		,DateCreated varchar(255) null
	)
end

if object_id('sa.DB_Fact') is null
begin
	create table sa.DB_Fact (
		ID_Batch int not null
		,LoadDate datetime not null
		,FactID varchar(255) null
		,CatalogID varchar(255) null
		,DocID varchar(255) null
		,Quantity varchar(255) null
		,AmountBP varchar(255) null
		,AmountCP varchar(255) null
		,DateCreated varchar(255) null
	)
end

if object_id('sa.CSV_Contractors') is null
begin
	create table sa.CSV_Contractors (
		ID_Batch int not null
		,LoadDate datetime not null
		,ClientID varchar(255) null
		,ClientCode varchar(255) null
		,ChainID varchar(255) null
		,ClientName varchar(255) null
		,DateCreated varchar(255) null
	)
end

if object_id('sa.CSV_Catalog') is null
begin
	create table sa.CSV_Catalog (
		ID_Batch int not null
		,LoadDate datetime not null
		,CatalogID varchar(255) null
		,SkuCode varchar(255) null
		,SkuName varchar(255) null
		,SkuID varchar(255) null
		,DateCreated varchar(255) null
		,BrandID varchar(255) null
	)
end

if object_id('sa.CSV_Brand') is null
begin
	create table sa.CSV_Brand (
		ID_Batch int not null
		,LoadDate datetime not null
		,BrandID varchar(255)null
		,BrandName varchar(255) null
		,Code varchar(255) null
	)
end

if object_id('sa.CSV_Chain') is null
begin
	create table sa.CSV_Chain (
		ID_Batch int not null
		,LoadDate datetime not null
		,ChainID varchar(255) null
		,ChainName varchar(255) null
		,Code varchar(255) null
	)
end

if object_id('sa.CSV_Documents') is null
begin
	create table sa.CSV_Documents (
		ID_Batch int not null
		,LoadDate datetime not null
		,DocID varchar(255) null
		,ClientID varchar(255) null
		,DocNumber varchar(255) null
		,DocDate varchar(255) null
		,DateCreated varchar(255) null
	)
end

if object_id('sa.CSV_Facts') is null
begin
	create table sa.CSV_Facts (
		ID_Batch int not null
		,LoadDate datetime not null
		,FactID varchar(255) null
		,CatalogID varchar(255) null
		,DocID varchar(255) null
		,Quantity varchar(255) null
		,AmountBP varchar(255) null
		,AmountCP varchar(255) null
		,DateCreated varchar(255) null
	)
end
