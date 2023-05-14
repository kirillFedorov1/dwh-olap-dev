CREATE TABLE [dim].[Catalog] (
    [ID]                    INT           NOT NULL,
    [UID_DS]                INT           NOT NULL,
    [Code]                  VARCHAR (255) NULL,
    [Name]                  VARCHAR (255) NULL,
    [SkuID]                 INT           NULL,
    [ID_Brand]              INT           NULL,
    [ID_DateCreated]        INT           NULL,
    [MDT_FlagActive]        BIT           NOT NULL,
    [ID_mapping_DataSource] INT           NOT NULL,
    [ID_mapping_MDT]        INT           NULL,
    CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [FK_Catalog_ID_Brand_Brand] FOREIGN KEY ([ID_Brand]) REFERENCES [dim].[Brand] ([ID])
);


GO
ALTER TABLE [dim].[Catalog] NOCHECK CONSTRAINT [FK_Catalog_ID_Brand_Brand];

