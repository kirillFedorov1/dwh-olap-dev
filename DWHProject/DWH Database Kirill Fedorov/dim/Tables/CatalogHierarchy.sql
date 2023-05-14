CREATE TABLE [dim].[CatalogHierarchy] (
    [Level]                 VARCHAR (255) NOT NULL,
    [ID]                    INT           NOT NULL,
    [ID_Catalog]            INT           NULL,
    [CatalogUID_DS]         INT           NULL,
    [CatalogCode]           VARCHAR (255) NULL,
    [CatalogName]           VARCHAR (255) NULL,
    [SkuID]                 INT           NULL,
    [CatalogID_DateCreated] INT           NULL,
    [ID_Brand]              INT           NULL,
    [BrandUID_DS]           INT           NULL,
    [BrandCode]             VARCHAR (255) NULL,
    [BrandName]             VARCHAR (255) NULL,
    [MDT_FlagActive]        BIT           NOT NULL,
    [ID_mapping_DataSource] INT           NOT NULL,
    CONSTRAINT [PK_CatalogHierarchy] PRIMARY KEY CLUSTERED ([Level] ASC, [ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [FK_CatalogHierarchy_ID_Brand_Brand] FOREIGN KEY ([ID_Brand]) REFERENCES [dim].[Brand] ([ID]),
    CONSTRAINT [FK_CatalogHierarchy_ID_Catalog_Catalog] FOREIGN KEY ([ID_Catalog]) REFERENCES [dim].[Catalog] ([ID])
);


GO
ALTER TABLE [dim].[CatalogHierarchy] NOCHECK CONSTRAINT [FK_CatalogHierarchy_ID_Brand_Brand];


GO
ALTER TABLE [dim].[CatalogHierarchy] NOCHECK CONSTRAINT [FK_CatalogHierarchy_ID_Catalog_Catalog];

