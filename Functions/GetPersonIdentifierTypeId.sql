USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetPersonIdentifierTypeId') BEGIN
	DROP FUNCTION [App].[GetPersonIdentifierTypeId]
END

GO


CREATE FUNCTION App.GetPersonIdentifierTypeId (@PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefPersonIdentifierTypeId INT
	
	SELECT @RefPersonIdentifierTypeId = rpit.RefPersonIdentifierTypeId
    FROM ODS.RefPersonIdentifierType rpit
    WHERE rpit.Code = @PersonIdentifierTypeCode -- 'State Agency Identification System'

	RETURN (@RefPersonIdentifierTypeId)
END