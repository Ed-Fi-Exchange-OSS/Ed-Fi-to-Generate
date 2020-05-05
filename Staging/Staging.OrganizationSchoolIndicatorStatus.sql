USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationSchoolIndicatorStatus') BEGIN
	DROP TABLE [Staging].[OrganizationSchoolIndicatorStatus]
END

GO

CREATE TABLE Staging.OrganizationSchoolIndicatorStatus (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[School_Identifier_State] [varchar](100) NOT NULL,
	[SchoolYear] [varchar](100) NULL,
	[IndicatorStatusType] [varchar](100) NULL,
	[IndicatorStatus] [varchar](100) NULL,
	[IndicatorStatusSubgroupType] [varchar](100) NULL,
	[IndicatorStatusSubgroup] [varchar](100) NULL,
	[StatedDefinedIndicatorStatus] [varchar](100) NULL,
	[RecordStartDateTime] [DATE] NULL,
    [RecordEndDateTime] [DATE] NULL
);

