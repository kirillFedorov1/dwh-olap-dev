CREATE TABLE [dim].[Contractors] (
    [ID]                    INT           NOT NULL,
    [UID_DS]                INT           NOT NULL,
    [Code]                  VARCHAR (255) NULL,
    [Name]                  VARCHAR (255) NULL,
    [ID_Chain]              INT           NULL,
    [ID_DateCreated]        INT           NULL,
    [MDT_FlagActive]        BIT           NOT NULL,
    [ID_mapping_DataSource] INT           NOT NULL,
    [ID_mapping_MDT]        INT           NULL,
    CONSTRAINT [PK_Contractors] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [FK_Contractors_ID_Chain_Chain] FOREIGN KEY ([ID_Chain]) REFERENCES [dim].[Chain] ([ID])
);


GO
ALTER TABLE [dim].[Contractors] NOCHECK CONSTRAINT [FK_Contractors_ID_Chain_Chain];

