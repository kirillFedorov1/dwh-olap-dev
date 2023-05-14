CREATE TABLE [mdt].[Chain] (
    [UID_DS]                INT           NOT NULL,
    [ID]                    INT           NOT NULL,
    [Code]                  VARCHAR (255) NULL,
    [Name]                  VARCHAR (255) NULL,
    [ID_mapping_DataSource] INT           CONSTRAINT [DF_Chain_ID_mapping_Datasource] DEFAULT ((1)) NOT NULL,
    [ID_mapping_MDT]        INT           NULL,
    [MDT_DateCreate]        DATETIME      NOT NULL,
    [MDT_FlagActive]        BIT           CONSTRAINT [DF_Chain_FlagActive] DEFAULT ((1)) NOT NULL,
    [MDT_DateDeleted]       DATE          NULL,
    CONSTRAINT [PK_Chain] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

