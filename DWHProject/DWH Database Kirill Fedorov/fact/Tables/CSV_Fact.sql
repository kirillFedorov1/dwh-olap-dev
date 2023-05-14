CREATE TABLE [fact].[CSV_Fact] (
    [nPartYearMonth]        INT             NOT NULL,
    [ID_Batch]              INT             NOT NULL,
    [LoadDate]              DATETIME        NOT NULL,
    [FactID]                INT             NOT NULL,
    [DocID]                 INT             NULL,
    [ID_CatalogHierarchy]   INT             NULL,
    [Quantity]              INT             NULL,
    [AmountBP]              DECIMAL (18, 4) NULL,
    [AmountCP]              DECIMAL (18, 4) NULL,
    [ID_DateCreated]        INT             NOT NULL,
    [ID_mapping_DataSource] INT             NULL,
    CONSTRAINT [PK_fact_CSV_Fact] PRIMARY KEY CLUSTERED ([nPartYearMonth] ASC, [FactID] ASC) WITH (STATISTICS_NORECOMPUTE = ON, STATISTICS_INCREMENTAL = ON) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth])
) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth]);

