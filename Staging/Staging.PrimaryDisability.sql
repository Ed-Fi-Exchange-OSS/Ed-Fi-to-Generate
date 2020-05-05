USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'PrimaryDisability') BEGIN
	DROP TABLE [Staging].[PrimaryDisability]
END

GO

CREATE TABLE [Staging].[PrimaryDisability] (
    [Student_Identifier_State] VARCHAR (100) NULL,
    [DisabilityType]           VARCHAR (100) NULL,
    [RecordStartDateTime]      DATETIME      NULL,
    [RecordEndDateTime]        DATETIME      NULL,
    [PersonId]                 INT           NULL,
    [RunDateTime]              DATETIME      NULL
);
GO

EXECUTE sp_addextendedproperty @name = N'Lookup', @value = N'RefDisabilityType', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'PrimaryDisability', @level2type = N'COLUMN', @level2name = N'DisabilityType';
GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'PrimaryDisability', @level2type = N'COLUMN', @level2name = N'DisabilityType';
GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'PrimaryDisability', @level2type = N'COLUMN', @level2name = N'RecordStartDateTime';
GO

EXECUTE sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'SCHEMA', @level0name = N'Staging', @level1type = N'TABLE', @level1name = N'PrimaryDisability', @level2type = N'COLUMN', @level2name = N'Student_Identifier_State';
GO
