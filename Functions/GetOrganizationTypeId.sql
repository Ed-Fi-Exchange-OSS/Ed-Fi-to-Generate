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

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetOrganizationTypeId') BEGIN
	DROP FUNCTION [App].[GetOrganizationTypeId]
END

GO


CREATE FUNCTION App.GetOrganizationTypeId (@OrganizationTypeCode VARCHAR(100), @OrganizationElementTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefOrganizationTypeId INT

	SELECT @RefOrganizationTypeId = rot.RefOrganizationTypeId
    FROM ODS.RefOrganizationType rot
    JOIN ODS.RefOrganizationElementType roet 
		ON rot.RefOrganizationElementTypeId = roet.RefOrganizationElementTypeId
	WHERE rot.Code = @OrganizationTypeCode
      AND roet.Code = @OrganizationElementTypeCode

	RETURN (@RefOrganizationTypeId)
END