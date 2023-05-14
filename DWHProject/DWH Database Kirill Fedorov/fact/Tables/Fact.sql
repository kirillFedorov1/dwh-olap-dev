CREATE TABLE [fact].[Fact] (
    [nPartYearMonth]        INT             NOT NULL,
    [ID_Batch]              INT             NOT NULL,
    [LoadDate]              DATETIME        NOT NULL,
    [FactID]                INT             NOT NULL,
    [ID_CatalogHierarchy]   INT             NULL,
    [DocID]                 INT             NULL,
    [Quantity]              INT             NULL,
    [AmountBP]              DECIMAL (18, 4) NULL,
    [AmountCP]              DECIMAL (18, 4) NULL,
    [AmountBPQ]             DECIMAL (18, 4) NULL,
    [AmountCPQ]             DECIMAL (18, 4) NULL,
    [AmountBPWithoutTax]    DECIMAL (18, 4) NULL,
    [AmountCPWithoutTax]    DECIMAL (18, 4) NULL,
    [ID_DateCreated]        INT             NOT NULL,
    [ID_mapping_DataSource] INT             NULL,
    CONSTRAINT [PK_fact_Fact] PRIMARY KEY CLUSTERED ([nPartYearMonth] ASC, [FactID] ASC) WITH (STATISTICS_NORECOMPUTE = ON, STATISTICS_INCREMENTAL = ON) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth])
) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth]);

