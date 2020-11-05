-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO

/****** Object:  Table [Staging].[CharterSchoolApprovalOrganization]    Script Date: 8/13/2019 4:15:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'CharterSchoolApprovalAgency') BEGIN
	DROP TABLE [Staging].[CharterSchoolApprovalAgency]
END

GO

CREATE TABLE [Staging].[CharterSchoolApprovalAgency](
	[CharterSchoolId] [int] NOT NULL,
	[CharterSchoolApprovalAgencyId] [int] NOT NULL,
	[CharterSchoolApprovalAgencyType] VARCHAR(100) NULL,
	[CharterSchoolApprovalAgency_Name] VARCHAR(100) NULL,
	[RunDateTime] [datetime] NULL
)

GO


 