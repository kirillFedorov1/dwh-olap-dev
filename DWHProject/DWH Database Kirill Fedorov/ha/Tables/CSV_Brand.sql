CREATE TABLE [ha].[CSV_Brand] (
    [ID_Batch]  INT           NOT NULL,
    [LoadDate]  DATETIME      NOT NULL,
    [BrandID]   INT           NOT NULL,
    [BrandName] VARCHAR (255) NULL,
    [Code]      VARCHAR (255) NULL,
    CONSTRAINT [PK_CSV_Brand] PRIMARY KEY CLUSTERED ([BrandID] ASC)
);

