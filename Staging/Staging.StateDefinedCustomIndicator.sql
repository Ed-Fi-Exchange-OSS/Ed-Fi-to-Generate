

USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'StateDefinedCustomIndicator') BEGIN
	DROP TABLE Staging.StateDefinedCustomIndicator
END

GO

CREATE TABLE Staging.StateDefinedCustomIndicator (
	[Code] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[Definition] [nvarchar](max) NULL,
	RefIndicatorStatusCustomTypeId INT NULL,
	RunDateTime DATETIME
	);