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

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetFiscalYearStartDate') BEGIN
	DROP FUNCTION [App].[GetFiscalYearStartDate]
END

GO

CREATE FUNCTION App.GetFiscalYearStartDate(@SchoolYear SMALLINT)
RETURNS DATE
AS BEGIN
	RETURN CAST(CAST(@SchoolYear - 1 AS VARCHAR) + '-07-01' AS DATE)
END