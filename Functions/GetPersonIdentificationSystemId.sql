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

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefPersonIdentificationSystemId') BEGIN
	DROP FUNCTION [App].[GetRefPersonIdentificationSystemId]
END

GO


CREATE FUNCTION App.GetRefPersonIdentificationSystemId (@PersonIdentificationSystemCode VARCHAR(20), @PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @PersonIdentificationSystemId INT
	
	SELECT @PersonIdentificationSystemId = r.RefPersonIdentificationSystemId 
	FROM ODS.RefPersonIdentificationSystem r 
	JOIN ODS.RefPersonIdentifierType rpt 
		ON r.RefPersonIdentifierTypeId = rpt.RefPersonIdentifierTypeId 
	WHERE r.Code = @PersonIdentificationSystemCode 
		AND rpt.Code = @PersonIdentifierTypeCode

	RETURN (@PersonIdentificationSystemId)
END