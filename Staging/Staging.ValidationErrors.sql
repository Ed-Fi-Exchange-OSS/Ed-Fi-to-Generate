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


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ValidationErrors') BEGIN
	DROP TABLE [Staging].[ValidationErrors]
END

GO


CREATE TABLE Staging.ValidationErrors
    ( Id INT IDENTITY(1, 1) PRIMARY KEY
	, ETLName VARCHAR(100)
	, StagingTableName VARCHAR(100)
	, ElementName VARCHAR(100)
	, ErrorDescription VARCHAR(500)
	, Identifier VARCHAR(100)
	, CreateDate DATETIME
	)
