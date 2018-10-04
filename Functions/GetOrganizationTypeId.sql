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


CREATE FUNCTION App.GetOrganizationTypeId (@OrganizationTypeCode VARCHAR(10), @OrganizationElementTypeCode VARCHAR(6))
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