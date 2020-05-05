USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationSchoolComprehensiveAndTargetedSupport') BEGIN
	DROP TABLE [Staging].[OrganizationSchoolComprehensiveAndTargetedSupport]
END

GO

CREATE TABLE [Staging].[OrganizationSchoolComprehensiveAndTargetedSupport](
	[Id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[School_Identifier_State] [varchar](100) NOT NULL,
	[SchoolYear] [varchar](100) NULL,
	[School_ComprehensiveAndTargetedSupport] varchar(100),
	[School_ComprehensiveSupport] varchar(100),
	[School_TargetedSupport]  varchar(100)
)