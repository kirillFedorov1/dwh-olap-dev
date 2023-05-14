if not exists (select 1 from sys.schemas where name = 'sa')
begin
	exec ('create schema sa')
end

if object_id('sa.CSV_Brand') is null
begin
	create table sa.CSV_Brand
	(
		UID_DS int not null
		,[Name] varchar(255) null
		,Code varchar(255) null
		,DataSource sysname not null
	)
end

if object_id('sa.CSV_Catalog') is null
begin
	create table sa.CSV_Catalog
	(
		UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,SkuID int null
		,ID_DateCreated int null
		,UID_DS_Brand int null
		,DataSource sysname not null
	)
end

if object_id('sa.CSV_Chain') is null
begin
	create table sa.CSV_Chain
	(
		UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,DataSource sysname not null
	)
end


if object_id('sa.CSV_Contractors') is null
begin
	create table sa.CSV_Contractors
	(
		UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_DateCreated int null
		,UID_DS_Chain int null
		,DataSource sysname not null
	)
end

if object_id('sa.DB_Contractors') is null
begin
	create table sa.DB_Contractors
	(
		UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_DateCreated int null
		,DataSource sysname not null
	)
end

if object_id('sa.DB_Catalog') is null
begin
	create table sa.DB_Catalog
	(
		UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,SkuID int null
		,ID_DateCreated int null
		,DataSource sysname not null
	)
end

if object_id('dbo.Brand') is null
begin
	create table dbo.Brand
	(
		ID int not null identity(1, 1)
		,constraint PK_Brand primary key clustered (ID asc)
		,UID_DS int not null
		,[Name] varchar(255) null
		,Code varchar(255) null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_ID_PrincipalCreatedBy int not null
		,MDT_DateCreate datetime not null
	)
	alter table dbo.Brand
		add constraint FK_Brand_ID_mapping_DataSource_DataSource foreign key(ID_mapping_DataSource) references mapping.DataSource(ID)
	alter table dbo.Brand
		add constraint FK_Brand_ID_mapping_MDT_Brand foreign key(ID_mapping_MDT) references dbo.Brand(ID)
	alter table dbo.Brand
		add constraint FK_Brand_MDT_ID_PrincipalCreatedBy_Principal foreign key (MDT_ID_PrincipalCreatedBy) references mdt.Principal(ID)
	alter table dbo.Brand
		add constraint UK_Brand_UID_DS unique nonclustered (UID_DS asc, ID_mapping_DataSource asc)
	alter table dbo.Brand
		add constraint DF_Brand_MDT_ID_PrincipalCreatedBy_Principal default mdt.ID_User() for MDT_ID_PrincipalCreatedBy
	alter table dbo.Brand
		add constraint DF_Brand_MDT_DateCreate default getdate() for MDT_DateCreate
end

if object_id('dbo.Catalog') is null
begin
	create table dbo.Catalog
	(
		ID int not null identity(1, 1)
		,constraint PK_Catalog primary key clustered (ID asc)
		,UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,SkuID int null
		,ID_DateCreated int null
		,ID_Brand int null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_ID_PrincipalCreatedBy int not null
		,MDT_DateCreate datetime not null
	)
	alter table dbo.Catalog
		add constraint FK_Catalog_ID_Brand_Brand foreign key (ID_Brand) references dbo.Brand(ID)
	alter table dbo.Catalog
		add constraint FK_Catalog_ID_mapping_DataSource_DataSource foreign key(ID_mapping_DataSource) references mapping.DataSource(ID)
	alter table dbo.Catalog
		add constraint FK_Catalog_ID_mapping_MDT_Catalog foreign key(ID_mapping_MDT) references dbo.Catalog(ID)
	alter table dbo.Catalog
		add constraint FK_Catalog_MDT_ID_PrincipalCreatedBy_Principal foreign key (MDT_ID_PrincipalCreatedBy) references mdt.Principal(ID)
	alter table dbo.Catalog
		add constraint UK_Catalog_UID_DS unique nonclustered (UID_DS asc, ID_mapping_DataSource asc)
	alter table dbo.Catalog
		add constraint DF_Catalog_MDT_ID_PrincipalCreatedBy_Principal default mdt.ID_User() for MDT_ID_PrincipalCreatedBy
	alter table dbo.Catalog
		add constraint DF_Catalog_MDT_DateCreate default getdate() for MDT_DateCreate
end

if object_id('dbo.Chain') is null
begin
	create table dbo.Chain
	(
		ID int not null identity(1, 1)
		,constraint PK_Chain primary key clustered (ID asc)
		,UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_ID_PrincipalCreatedBy int not null
		,MDT_DateCreate datetime not null
	)
	alter table dbo.Chain
		add constraint FK_Chain_ID_mapping_DataSource_DataSource foreign key(ID_mapping_DataSource) references mapping.DataSource(ID)
	alter table dbo.Chain
		add constraint FK_Chain_ID_mapping_MDT_Chain foreign key(ID_mapping_MDT) references dbo.Chain(ID)
	alter table dbo.Chain
		add constraint FK_Chain_MDT_ID_PrincipalCreatedBy_Principal foreign key (MDT_ID_PrincipalCreatedBy) references mdt.Principal(ID)
	alter table dbo.Chain
		add constraint UK_Chain_UID_DS unique nonclustered (UID_DS asc, ID_mapping_DataSource asc)
	alter table dbo.Chain
		add constraint DF_Chain_MDT_ID_PrincipalCreatedBy_Principal default mdt.ID_User() for MDT_ID_PrincipalCreatedBy
	alter table dbo.Chain
		add constraint DF_Chain_MDT_DateCreate default getdate() for MDT_DateCreate
end

if object_id('dbo.Contractors') is null
begin
	create table dbo.Contractors
	(
		ID int not null identity(1, 1)
		,constraint PK_Contractors primary key clustered (ID asc)
		,UID_DS int not null
		,Code varchar(255) null
		,[Name] varchar(255) null
		,ID_DateCreated int null
		,ID_Chain int null
		,ID_mapping_DataSource int not null
		,ID_mapping_MDT int null
		,MDT_ID_PrincipalCreatedBy int not null
		,MDT_DateCreate datetime not null
	)
	alter table dbo.Contractors
		add constraint FK_Contractors_ID_Chain_Chain foreign key (ID_Chain) references dbo.Chain(ID)
	alter table dbo.Contractors
		add constraint FK_Contractors_ID_mapping_DataSource_DataSource foreign key(ID_mapping_DataSource) references mapping.DataSource(ID)
	alter table dbo.Contractors
		add constraint FK_Contractors_ID_mapping_MDT_Contractors foreign key(ID_mapping_MDT) references dbo.Contractors(ID)
	alter table dbo.Contractors
		add constraint FK_Contractors_MDT_ID_PrincipalCreatedBy_Principal foreign key (MDT_ID_PrincipalCreatedBy) references mdt.Principal(ID)
	alter table dbo.Contractors
		add constraint UK_Contractors_UID_DS unique nonclustered (UID_DS asc, ID_mapping_DataSource asc)
	alter table dbo.Contractors
		add constraint DF_Contractors_MDT_ID_PrincipalCreatedBy_Principal default mdt.ID_User() for MDT_ID_PrincipalCreatedBy
	alter table dbo.Contractors
		add constraint DF_Contractors_MDT_DateCreate default getdate() for MDT_DateCreate
end
