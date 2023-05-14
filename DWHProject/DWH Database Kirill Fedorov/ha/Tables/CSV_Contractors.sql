CREATE TABLE [ha].[CSV_Contractors] (
    [ID_Batch]       INT           NOT NULL,
    [LoadDate]       DATETIME      NOT NULL,
    [ClientID]       INT           NOT NULL,
    [ClientCode]     VARCHAR (255) NULL,
    [ChainID]        INT           NULL,
    [ClientName]     VARCHAR (255) NULL,
    [ID_DateCreated] INT           NULL,
    CONSTRAINT [PK_CSV_Contractors] PRIMARY KEY CLUSTERED ([ClientID] ASC)
);

