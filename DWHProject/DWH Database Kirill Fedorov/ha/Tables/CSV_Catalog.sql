CREATE TABLE [ha].[CSV_Catalog] (
    [ID_Batch]       INT           NOT NULL,
    [LoadDate]       DATETIME      NOT NULL,
    [CatalogID]      INT           NOT NULL,
    [SkuCode]        VARCHAR (255) NULL,
    [SkuName]        VARCHAR (255) NULL,
    [SkuID]          INT           NULL,
    [BrandID]        VARCHAR (255) NULL,
    [ID_DateCreated] INT           NULL,
    CONSTRAINT [PK_CSV_Catalog] PRIMARY KEY CLUSTERED ([CatalogID] ASC)
);

