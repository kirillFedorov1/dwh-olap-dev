CREATE TABLE [ha].[CSV_Documents] (
    [nPartYearMonth] INT           NOT NULL,
    [ID_Batch]       INT           NOT NULL,
    [LoadDate]       DATETIME      NOT NULL,
    [DocID]          INT           NOT NULL,
    [ClientID]       INT           NULL,
    [DocNumber]      VARCHAR (255) NULL,
    [ID_DocDate]     INT           NULL,
    [ID_DateCreated] INT           NULL,
    CONSTRAINT [PK_CSV_Documents] PRIMARY KEY CLUSTERED ([nPartYearMonth] ASC, [DocID] ASC) WITH (STATISTICS_NORECOMPUTE = ON, STATISTICS_INCREMENTAL = ON) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth])
) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth]);

