-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode]    Script Date: 5/21/2018 2:55:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationIdentifierTypeId') BEGIN
	DROP FUNCTION [App].[GetOrganizationIdentifierTypeId]
END

GO


CREATE FUNCTION App.GetOrganizationIdentifierTypeId (@OrganizationIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationIdentifierTypeId INT
	
	SELECT @RefOrganizationIdentifierTypeId = roit.RefOrganizationIdentifierTypeId
    FROM ODS.RefOrganizationIdentifierType roit
    WHERE roit.Code = @OrganizationIdentifierTypeCode -- 'State Agency Identification System'

	RETURN (@RefOrganizationIdentifierTypeId)
END