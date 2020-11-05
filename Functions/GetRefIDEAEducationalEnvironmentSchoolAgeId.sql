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

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRefIDEAEducationalEnvironmentSchoolAgeId') BEGIN
	DROP FUNCTION [App].[GetRefIDEAEducationalEnvironmentSchoolAgeId]
END

GO


CREATE FUNCTION App.GetRefIDEAEducationalEnvironmentSchoolAgeId (@EducationalEnvironmentCode VARCHAR(50))
RETURNS INT
AS BEGIN
	DECLARE @EducationalEnvironmentId INT

	SELECT @EducationalEnvironmentId = RefIDESEducationalEnvironmentSchoolAge
    FROM [ODS].[RefIDEAEducationalEnvironmentSchoolAge]
	WHERE Code = @EducationalEnvironmentCode

	RETURN (@EducationalEnvironmentId)
END