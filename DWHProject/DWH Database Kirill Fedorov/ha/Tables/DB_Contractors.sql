CREATE TABLE [ha].[DB_Contractors] (
    [ID_Batch]       INT           NOT NULL,
    [LoadDate]       DATETIME      NOT NULL,
    [ClientID]       INT           NOT NULL,
    [ClientCode]     VARCHAR (255) NULL,
    [ClientName]     VARCHAR (255) NULL,
    [ID_DateCreated] INT           NULL,
    CONSTRAINT [PK_DB_Contractors] PRIMARY KEY CLUSTERED ([ClientID] ASC)
);

