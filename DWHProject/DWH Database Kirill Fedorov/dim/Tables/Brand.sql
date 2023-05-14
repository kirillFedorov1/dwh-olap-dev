CREATE TABLE [dim].[Brand] (
    [ID]                    INT           NOT NULL,
    [UID_DS]                INT           NOT NULL,
    [Code]                  VARCHAR (255) NULL,
    [Name]                  VARCHAR (255) NULL,
    [MDT_FlagActive]        BIT           NOT NULL,
    [ID_mapping_DataSource] INT           NOT NULL,
    [ID_mapping_MDT]        INT           NULL,
    CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

