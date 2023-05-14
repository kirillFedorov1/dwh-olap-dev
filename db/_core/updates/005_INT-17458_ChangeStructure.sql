if not exists (select 1 from sys.schemas where name = 'mdt')
begin
	exec('create schema mdt')
end

if not exists (select 1 from sys.schemas where name = 'dim')
begin
	exec('create schema dim')
end

if object_id('mdt.MappingDataSource') is null
begin
	create table mdt.MappingDataSource
	(
		ID int not null
		,Code sysname not null
		,[Description] varchar(255) null
		,MDT_FlagActive bit not null constraint DF_mdt_MappingDataSource_FlagActive default (1)
		,MDT_DateDeleted date null
		,constraint PK_MappingDataSource primary key clustered (ID asc)
	)
end

if object_id('mdt.Brand') is null
begin
	create table mdt.Brand
	(
		UID_DS int not null
		,ID int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_DateCreate datetime not null
		,MDT_FlagActive bit not null
		,MDT_DateDeleted date null
		,constraint PK_Brand primary key clustered (ID asc)
	)
	alter table mdt.Brand
		add constraint DF_Brand_ID_mapping_Datasource default (1) for ID_mapping_DataSource
	alter table mdt.Brand
		add constraint DF_Brand_FlagActive default (1) for MDT_FlagActive
end

if object_id('mdt.Chain') is null
begin
	create table mdt.Chain
	(
		UID_DS int not null
		,ID int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_DateCreate datetime not null
		,MDT_FlagActive bit not null
		,MDT_DateDeleted date null
		,constraint PK_Chain primary key clustered (ID asc)
	)
	alter table mdt.Chain
		add constraint DF_Chain_ID_mapping_Datasource default (1) for ID_mapping_Datasource
	alter table mdt.Chain
		add constraint DF_Chain_FlagActive default (1) for MDT_FlagActive
end

if object_id('mdt.Contractors') is null
begin
	create table mdt.Contractors
	(
		UID_DS int not null
		,ID int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_DateCreated int null
		,ID_Chain int null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_DateCreate datetime not null
		,MDT_FlagActive bit not null
		,MDT_DateDeleted date null
		,constraint PK_Contractors primary key clustered (ID asc)
	)
	alter table mdt.Contractors
		add constraint DF_Contractors_ID_mapping_Datasource default (1) for ID_mapping_Datasource
	alter table mdt.Contractors
		add constraint DF_Contractors_FlagActive default (1) for MDT_FlagActive
	alter table mdt.Contractors
		add constraint FK_Contractors_ID_Chain_Chain foreign key (ID_Chain) references mdt.Chain (ID)
end

if object_id('mdt.Catalog') is null
begin
	create table mdt.Catalog
	(
		UID_DS int not null
		,ID int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,SkuID int null
		,ID_DateCreated int null
		,ID_Brand int null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_DateCreate datetime not null
		,MDT_FlagActive bit not null
		,MDT_DateDeleted date null
		,constraint PK_Catalog primary key clustered (ID asc)
	)
	alter table mdt.Catalog
		add constraint DF_DataSource_ID_mapping_Datasource default (1) for ID_mapping_Datasource
	alter table mdt.Catalog
		add constraint DF_Catalog_FlagActive default (1) for MDT_FlagActive
	alter table mdt.Catalog
		add constraint FK_Catalog_ID_Brand_Brand foreign key (ID_Brand) references mdt.Brand (ID)
end

if object_id('dim.Brand') is null
begin
	create table dim.Brand
	(
		ID int not null
		,UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,MDT_FlagActive bit not null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,constraint PK_Brand primary key clustered (ID asc)
	)
end

if object_id('dim.Chain') is null
begin
	create table dim.Chain
	(
		ID int not null
		,UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,MDT_FlagActive bit not null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,constraint PK_Chain primary key clustered (ID asc)
	)
end

if object_id('dim.Contractors') is null
begin
	create table dim.Contractors
	(
		ID int not null
		,UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_Chain int null
		,ID_DateCreated int null
		,MDT_FlagActive bit not null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,constraint PK_Contractors primary key clustered (ID asc)
	)
	alter table dim.Contractors
		add constraint FK_Contractors_ID_Chain_Chain foreign key (ID_Chain) references dim.Chain (ID)
	alter table dim.Contractors nocheck constraint FK_Contractors_ID_Chain_Chain;
end
go

if object_id('dim.Catalog') is null
begin
	create table dim.Catalog
	(
		ID int not null
		,UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,SkuID int null
		,ID_Brand int null
		,ID_DateCreated int null
		,MDT_FlagActive bit not null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,constraint PK_Catalog primary key clustered (ID asc)
	)
	alter table dim.Catalog
		add constraint FK_Catalog_ID_Brand_Brand foreign key (ID_Brand) references dim.Brand (ID)
	alter table dim.Catalog nocheck constraint FK_Catalog_ID_Brand_Brand;
end
go

if object_id('dim.ContractorsHierarchy') is null
begin
	create table dim.ContractorsHierarchy
	(
		[Level] varchar (255) not null
		,ID int not null
		,ID_Contractor int null
		,ContractorUID_DS int null
		,ContractorCode varchar(255) null
		,ContractorName varchar(255) null
		,ContractorID_DateCreated int null
		,ID_Chain int null
		,ChainUID_DS int null
		,ChainCode varchar(255) null
		,ChainName varchar(255) null
		,MDT_FlagActive bit not null
		,ID_mapping_DataSource int not null
		,constraint PK_ContractorsHierarchy primary key clustered ([Level] asc, ID asc)
	)
	alter table dim.ContractorsHierarchy
		add constraint FK_ContractorsHierarchy_ID_Contractor_Contractors foreign key (ID_Contractor) references dim.Contractors (ID)
	alter table dim.ContractorsHierarchy
		add constraint FK_ContractorsHierarchy_ID_Chain_Chain foreign key (ID_Chain) references dim.Chain (ID)
	alter table dim.ContractorsHierarchy nocheck constraint FK_ContractorsHierarchy_ID_Contractor_Contractors;
	alter table dim.ContractorsHierarchy nocheck constraint FK_ContractorsHierarchy_ID_Chain_Chain;
end
go

if object_id('dim.CatalogHierarchy') is null
begin
	create table dim.CatalogHierarchy
	(
		[Level] varchar (255) not null
		,ID int not null
		,ID_Catalog int null
		,CatalogUID_DS int null
		,CatalogCode varchar(255) null
		,CatalogName varchar(255) null
		,SkuID int null
		,CatalogID_DateCreated int null
		,ID_Brand int null
		,BrandUID_DS int null
		,BrandCode varchar(255) null
		,BrandName varchar(255) null
		,MDT_FlagActive bit not null
		,ID_mapping_DataSource int not null
		,constraint PK_CatalogHierarchy primary key clustered ([Level] asc, ID asc)
	)
	alter table dim.CatalogHierarchy
		add constraint FK_CatalogHierarchy_ID_Catalog_Catalog foreign key (ID_Catalog) references dim.Catalog (ID)
	alter table dim.CatalogHierarchy
		add constraint FK_CatalogHierarchy_ID_Brand_Brand foreign key (ID_Brand) references dim.Brand (ID)
	alter table dim.CatalogHierarchy nocheck constraint FK_CatalogHierarchy_ID_Catalog_Catalog;
	alter table dim.CatalogHierarchy nocheck constraint FK_CatalogHierarchy_ID_Brand_Brand;
end
go
