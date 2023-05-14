CREATE TABLE [ha].[CSV_Facts] (
    [nPartYearMonth] INT             NOT NULL,
    [ID_Batch]       INT             NOT NULL,
    [LoadDate]       DATETIME        NOT NULL,
    [FactID]         INT             NOT NULL,
    [CatalogID]      INT             NULL,
    [DocID]          INT             NULL,
    [Quantity]       INT             NULL,
    [AmountBP]       DECIMAL (18, 4) NULL,
    [AmountCP]       DECIMAL (18, 4) NULL,
    [ID_DateCreated] INT             NULL,
    CONSTRAINT [PK_CSV_Facts] PRIMARY KEY CLUSTERED ([nPartYearMonth] ASC, [FactID] ASC) WITH (STATISTICS_NORECOMPUTE = ON, STATISTICS_INCREMENTAL = ON) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth])
) ON [ps_Range_Fact_nPartYearMonth] ([nPartYearMonth]);

