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

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationIdentifierSystemId') BEGIN
	DROP FUNCTION [App].[GetOrganizationIdentifierSystemId]
END

GO


CREATE FUNCTION App.GetOrganizationIdentifierSystemId (@OrganizationIdentifierSystemCode VARCHAR(100), @OrganizationIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationIdentifierSystemId INT
	
          SELECT @RefOrganizationIdentifierSystemId = rois.RefOrganizationIdentificationSystemId
          FROM ODS.RefOrganizationIdentificationSystem rois
		  JOIN ODS.RefOrganizationIdentifierType roit
			ON rois.RefOrganizationIdentifierTypeId = roit.RefOrganizationIdentifierTypeId
          WHERE rois.Code = @OrganizationIdentifierSystemCode
			AND roit.Code = @OrganizationIdentifierTypeCode

	RETURN (@RefOrganizationIdentifierSystemId)
END