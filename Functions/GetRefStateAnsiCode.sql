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

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefStateAnsiCode') BEGIN
	DROP FUNCTION [App].[GetRefStateAnsiCode]
END

GO

CREATE FUNCTION App.GetRefStateAnsiCode (@StateName VARCHAR(30))
RETURNS CHAR(2)
AS BEGIN
	DECLARE @RefStateAnsiCode CHAR(2)
	
	SELECT @RefStateAnsiCode = Code FROM ODS.RefStateAnsiCode WHERE StateName = @StateName

	RETURN @RefStateAnsiCode 
END