if not exists (select 1 from sys.schemas where name = 'fact')
begin
	exec('create schema fact');
end

if object_id('fact.CSV_Documents') is null
begin
	create table fact.CSV_Documents
	(
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,DocID int not null
		,ID_ContractorsHierarchy int null
		,DocNumber varchar(255) not null
		,ID_DocDate int not null
		,ID_DateCreated int not null
		,ID_mapping_DataSource int null
		,constraint PK_fact_CSV_Documents primary key clustered (nPartYearMonth asc, DocID asc) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
end

if object_id('fact.CSV_Fact') is null
begin
	create table fact.CSV_Fact
	(
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,FactID int not null
		,DocID int null
		,ID_CatalogHierarchy int null
		,Quantity int null
		,AmountBP decimal(18, 4) null
		,AmountCP decimal(18, 4) null
		,ID_DateCreated int not null
		,ID_mapping_DataSource int null
		,constraint PK_fact_CSV_Fact primary key clustered (nPartYearMonth asc, FactID asc) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
end

if object_id('fact.DB_Documents') is null
begin
	create table fact.DB_Documents
	(
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,DocID int not null
		,ID_ContractorsHierarchy int null
		,DocNumber varchar(255) not null
		,ID_DocDate int not null
		,ID_DateCreated int not null
		,ID_mapping_DataSource int null
		,constraint PK_fact_DB_Documents primary key clustered (nPartYearMonth asc, DocID asc) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
end

if object_id('fact.DB_Fact') is null
begin
	create table fact.DB_Fact
	(
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,FactID int not null
		,DocID int null
		,ID_CatalogHierarchy int null
		,Quantity int null
		,AmountBP decimal(18, 4) null
		,AmountCP decimal(18, 4) null
		,ID_DateCreated int not null
		,ID_mapping_DataSource int null
		,constraint PK_fact_DB_Fact primary key clustered (nPartYearMonth asc, FactID asc) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
end

if object_id('fact.Fact') is null
begin
	create table fact.Fact
	(
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,FactID int not null
		,ID_CatalogHierarchy int null
		,DocID int null
		,Quantity int null
		,AmountBP decimal(18, 4) null
		,AmountCP decimal(18, 4) null
		,AmountBPQ decimal(18, 4) null
		,AmountCPQ decimal(18, 4) null
		,AmountBPWithoutTax decimal(18, 4) null
		,AmountCPWithoutTax decimal(18, 4) null
		,ID_DateCreated int not null
		,ID_mapping_DataSource int null
		,constraint PK_fact_Fact primary key clustered (nPartYearMonth asc, FactID asc) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth);
end

if object_id('fact.Documents') is null
begin
	create table fact.Documents
	(
		nPartYearMonth int not null
		,ID_Batch int not null
		,LoadDate datetime not null
		,DocID int not null
		,ID_ContractorsHierarchy int null
		,DocNumber varchar(255) not null
		,ID_DocDate int not null
		,ID_DateCreated int not null
		,ID_mapping_DataSource int null
		,constraint PK_fact_Documents primary key clustered (nPartYearMonth asc, DocID asc) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
	) on ps_Range_Fact_nPartYearMonth (nPartYearMonth)
end
