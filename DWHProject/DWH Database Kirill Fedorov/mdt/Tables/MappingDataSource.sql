CREATE TABLE [mdt].[MappingDataSource] (
    [ID]              INT           NOT NULL,
    [Code]            [sysname]     NOT NULL,
    [Description]     VARCHAR (255) NULL,
    [MDT_FlagActive]  BIT           CONSTRAINT [DF_mdt_MappingDataSource_FlagActive] DEFAULT ((1)) NOT NULL,
    [MDT_DateDeleted] DATE          NULL,
    CONSTRAINT [PK_MappingDataSource] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON)
);

