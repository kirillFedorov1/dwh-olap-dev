CREATE TABLE [ha].[CSV_Chain] (
    [ID_Batch]  INT           NOT NULL,
    [LoadDate]  DATETIME      NOT NULL,
    [ChainID]   INT           NOT NULL,
    [ChainName] VARCHAR (255) NULL,
    [Code]      VARCHAR (255) NULL,
    CONSTRAINT [PK_CSV_Chain] PRIMARY KEY CLUSTERED ([ChainID] ASC)
);

