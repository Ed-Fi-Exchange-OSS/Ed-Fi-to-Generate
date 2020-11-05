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


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ProgramParticipationNorD') BEGIN
	DROP TABLE [Staging].[ProgramParticipationNorD]
END

GO


CREATE TABLE Staging.ProgramParticipationNorD (
			 ID INT IDENTITY(1, 1) Primary Key
			,RecordId VARCHAR(100)
			,Student_Identifier_State VARCHAR(100)
			,LEA_Identifier_State VARCHAR(100)
			,School_Identifier_State VARCHAR(100)
			,ProgramParticipationBeginDate DATE
			,ProgramParticipationEndDate DATE NULL
			,ProgramParticipationNorD VARCHAR(100)
			,ProgressLevel_Reading VARCHAR(100)
			,ProgressLevel_Math VARCHAR(100)
			,Outcome VARCHAR(100)
			,DiplomaCredentialAwardDate DATE
			,PersonID INT
			,OrganizationID_School INT
			,OrganizationID_LEA INT NULL
			,LEAOrganizationID_Program INT
			,SchoolOrganizationID_Program INT
			,LEAOrganizationPersonRoleId_Program INT
			,SchoolOrganizationPersonRoleId_Program INT
			,PersonProgramParticipationID INT
			,RunDateTime DATETIME
		  );

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationNorD', @level2type = N'Column', @level2name = 'RecordId' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationNorD', @level2type = N'Column', @level2name = 'Student_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationNorD', @level2type = N'Column', @level2name = 'LEA_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationNorD', @level2type = N'Column', @level2name = 'School_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationNorD', @level2type = N'Column', @level2name = 'ProgramParticipationBeginDate' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationNorD', @level2type = N'Column', @level2name = 'ProgramParticipationEndDate' 			
