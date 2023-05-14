CREATE TABLE [sa].[DB_Fact] (
    [ID_Batch]    INT           NOT NULL,
    [LoadDate]    DATETIME      NOT NULL,
    [FactID]      VARCHAR (255) NULL,
    [CatalogID]   VARCHAR (255) NULL,
    [DocID]       VARCHAR (255) NULL,
    [Quantity]    VARCHAR (255) NULL,
    [AmountBP]    VARCHAR (255) NULL,
    [AmountCP]    VARCHAR (255) NULL,
    [DateCreated] VARCHAR (255) NULL
);

