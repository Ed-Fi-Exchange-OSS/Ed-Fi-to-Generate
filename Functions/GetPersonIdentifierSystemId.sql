USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetPersonIdentifierSystemId') BEGIN
	DROP FUNCTION [App].[GetPersonIdentifierSystemId]
END

GO


CREATE FUNCTION App.GetPersonIdentifierSystemId (@PersonIdentifierSystemCode VARCHAR(6), @PersonIdentifierTypeCode VARCHAR(6))
RETURNS INT
AS BEGIN
	DECLARE @RefPersonIdentifierSystemId INT
	
          SELECT @RefPersonIdentifierSystemId = rpis.RefPersonIdentificationSystemId
          FROM ODS.RefPersonIdentificationSystem rpis
		  JOIN ODS.RefPersonIdentifierType rpit	
			ON rpis.RefPersonIdentifierTypeId = rpit.RefPersonIdentifierTypeId
          WHERE rpis.Code = @PersonIdentifierSystemCode
			AND rpit.Code = @PersonIdentifierTypeCode

	RETURN (@RefPersonIdentifierSystemId)
END
