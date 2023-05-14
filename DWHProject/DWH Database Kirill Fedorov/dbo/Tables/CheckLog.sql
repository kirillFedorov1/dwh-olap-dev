CREATE TABLE [dbo].[CheckLog] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [ID_Batch]     INT           NOT NULL,
    [Number]       INT           NOT NULL,
    [ID_Record]    INT           NOT NULL,
    [MessageType]  VARCHAR (255) NOT NULL,
    [ErrorMessage] VARCHAR (255) NOT NULL,
    [ErrorDate]    DATETIME      NOT NULL
);

