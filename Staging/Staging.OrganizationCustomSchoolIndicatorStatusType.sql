-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'OrganizationCustomSchoolIndicatorStatusType') BEGIN
	DROP TABLE [Staging].[OrganizationCustomSchoolIndicatorStatusType]
END

GO

CREATE TABLE Staging.OrganizationCustomSchoolIndicatorStatusType (
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[School_Identifier_State] [varchar](100) NOT NULL,
	[SchoolYear] [varchar](100) NULL,
	[IndicatorStatusType] [varchar](100) NULL,
	[IndicatorStatus] [varchar](100) NULL,
	[IndicatorStatusSubgroupType] [varchar](100) NULL,
	[IndicatorStatusSubgroup] [varchar](100) NULL,
	[StatedDefinedIndicatorStatus] [varchar](100) NULL,
	[StatedDefinedCustomIndicatorStatusType] [varchar](100) NULL,
	[RecordStartDateTime] [DATE] NULL,
    [RecordEndDateTime] [DATE] NULL
);

