CREATE TABLE [dim].[ContractorsHierarchy] (
    [Level]                    VARCHAR (255) NOT NULL,
    [ID]                       INT           NOT NULL,
    [ID_Contractor]            INT           NULL,
    [ContractorUID_DS]         INT           NULL,
    [ContractorCode]           VARCHAR (255) NULL,
    [ContractorName]           VARCHAR (255) NULL,
    [ContractorID_DateCreated] INT           NULL,
    [ID_Chain]                 INT           NULL,
    [ChainUID_DS]              INT           NULL,
    [ChainCode]                VARCHAR (255) NULL,
    [ChainName]                VARCHAR (255) NULL,
    [MDT_FlagActive]           BIT           NOT NULL,
    [ID_mapping_DataSource]    INT           NOT NULL,
    CONSTRAINT [PK_ContractorsHierarchy] PRIMARY KEY CLUSTERED ([Level] ASC, [ID] ASC) WITH (STATISTICS_NORECOMPUTE = ON),
    CONSTRAINT [FK_ContractorsHierarchy_ID_Chain_Chain] FOREIGN KEY ([ID_Chain]) REFERENCES [dim].[Chain] ([ID]),
    CONSTRAINT [FK_ContractorsHierarchy_ID_Contractor_Contractors] FOREIGN KEY ([ID_Contractor]) REFERENCES [dim].[Contractors] ([ID])
);


GO
ALTER TABLE [dim].[ContractorsHierarchy] NOCHECK CONSTRAINT [FK_ContractorsHierarchy_ID_Chain_Chain];


GO
ALTER TABLE [dim].[ContractorsHierarchy] NOCHECK CONSTRAINT [FK_ContractorsHierarchy_ID_Contractor_Contractors];

