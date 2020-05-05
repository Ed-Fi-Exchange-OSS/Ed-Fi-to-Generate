USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefOrganizationLocationTypeId') BEGIN
	DROP FUNCTION [App].[GetRefOrganizationLocationTypeId]
END

GO


CREATE FUNCTION App.GetRefOrganizationLocationTypeId (@OrganizationLocationTypeCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @OrganizationLocationTypeId INT

	SELECT @OrganizationLocationTypeId = RefOrganizationLocationTypeId
    FROM [ODS].[RefOrganizationLocationType]
	WHERE Code = @OrganizationLocationTypeCode

	RETURN (@OrganizationLocationTypeId)
END