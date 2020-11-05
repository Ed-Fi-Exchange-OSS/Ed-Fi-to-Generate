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