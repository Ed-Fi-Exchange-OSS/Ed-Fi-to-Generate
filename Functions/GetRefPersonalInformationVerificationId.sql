USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefPersonalInformationVerificationId') BEGIN
	DROP FUNCTION [App].[GetRefPersonalInformationVerificationId]
END

GO


CREATE FUNCTION App.GetRefPersonalInformationVerificationId (@PersonalInformationVerificationCode VARCHAR(20))
RETURNS INT
AS BEGIN
	DECLARE @PersonalInformationVerificationId INT
	
	SELECT @PersonalInformationVerificationId = r.RefPersonalInformationVerificationId 
	FROM ODS.RefPersonalInformationVerification r 
	WHERE Code = @PersonalInformationVerificationCode

	RETURN (@PersonalInformationVerificationId)
END