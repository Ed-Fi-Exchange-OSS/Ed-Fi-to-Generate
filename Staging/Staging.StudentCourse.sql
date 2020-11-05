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


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'StudentCourse') BEGIN
	DROP TABLE [Staging].[StudentCourse]
END

GO


CREATE TABLE Staging.StudentCourse (
	  Id INT IDENTITY(1, 1) Primary Key
	, Student_Identifier_State VARCHAR(100)
	, LEA_Identifier_State VARCHAR(100)
	, School_Identifier_State VARCHAR(100)
	, SchoolYear INT
	, CourseCode VARCHAR(100)
	, CourseGradeLevel VARCHAR(100)
	, PersonId INT NULL
	, OrganizationID_LEA INT NULL
	, OrganizationPersonRoleId_LEA INT NULL
	, OrganizationID_School INT NULL
	, OrganizationPersonRoleId_School INT NULL
	, OrganizationID_Course INT NULL
	, OrganizationPersonRoleId_Course INT NULL
	, RunDateTime DATETIME
	);


exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StudentCourse', @level2type = N'Column', @level2name = 'Student_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StudentCourse', @level2type = N'Column', @level2name = 'LEA_Identifier_State' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'StudentCourse', @level2type = N'Column', @level2name = 'CourseGradeLevel' 
