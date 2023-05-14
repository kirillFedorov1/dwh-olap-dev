CREATE TABLE [fact].[CSV_Documents] (
    [nPartYearMonth]          INT           NOT NULL,
    [ID_Batch]                INT           NOT NULL,
    [LoadDate]                DATETIME      NOT NULL,
    [DocID]                   INT           NOT NULL,
    [ID_ContractorsHierarchy] INT           NULL,
    [DocNumber]               VARCHAR (255) NOT NULL,
    [ID_DocDate]              INT           NOT NULL,
    [ID_DateCreated]          INT           NOT NULL,
    [ID_mapping_DataSource]   INT           NULL,
    CONSTRAINT [PK_fact_CSV_Documents] PRIMARY KEY CLUSTERED ([nPartYearMonth] ASC, [DocID] ASC) WITH (STATISTICS_NORECOMPUTE = ON, STATISTICS_INCREMENTAL = ON) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth])
) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth]);

