CREATE TABLE [mdt].[Catalog] (
    [UID_DS]                INT           NOT NULL,
    [ID]                    INT           NOT NULL,
    [Code]                  VARCHAR (255) NULL,
    [Name]                  VARCHAR (255) NULL,
    [SkuID]                 INT           NULL,
    [ID_DateCreated]        INT           NULL,
    [ID_Brand]              INT           NULL,
    [ID_mapping_DataSource] INT           CONSTRAINT [DF_DataSource_ID_mapping_Datasource] DEFAULT ((1)) NOT NULL,
    [ID_mapping_MDT]        INT           NULL,
    [MDT_DateCreate]        DATETIME      NOT NULL,
    [MDT_FlagActive]        BIT           CONSTRAINT [DF_Catalog_FlagActive] DEFAULT ((1)) NOT NULL,
    [MDT_DateDeleted]       DATE          NULL,
    CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [FK_Catalog_ID_Brand_Brand] FOREIGN KEY ([ID_Brand]) REFERENCES [mdt].[Brand] ([ID])
);

