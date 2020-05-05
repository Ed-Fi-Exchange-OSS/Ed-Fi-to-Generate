USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefInstitutionTelephoneType') BEGIN
	DROP FUNCTION [App].[GetRefInstitutionTelephoneType]
END

GO


CREATE FUNCTION App.GetRefInstitutionTelephoneType (@TelephoneTypeCode CHAR(2))
RETURNS INT
AS BEGIN
	DECLARE @RefInstitutionTelephoneTypeId INT
	
	SELECT @RefInstitutionTelephoneTypeId = RefInstitutionTelephoneTypeId FROM ODS.RefInstitutionTelephoneType WHERE Code = @TelephoneTypeCode

	RETURN @RefInstitutionTelephoneTypeId
END