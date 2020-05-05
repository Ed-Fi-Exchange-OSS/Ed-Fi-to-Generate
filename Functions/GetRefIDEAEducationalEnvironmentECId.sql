USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefIDEAEducationalEnvironmentECId') BEGIN
	DROP FUNCTION [App].[GetRefIDEAEducationalEnvironmentECId]
END

GO


CREATE FUNCTION App.GetRefIDEAEducationalEnvironmentECId (@EducationalEnvironmentCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @EducationalEnvironmentId INT

	SELECT @EducationalEnvironmentId = RefIDEAEducationalEnvironmentECId
    FROM [ODS].[RefIDEAEducationalEnvironmentEC]
	WHERE Code = @EducationalEnvironmentCode

	RETURN (@EducationalEnvironmentId)
END