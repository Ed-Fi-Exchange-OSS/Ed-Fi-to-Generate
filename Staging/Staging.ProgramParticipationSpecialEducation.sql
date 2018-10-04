USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ProgramParticipationSpecialEducation') BEGIN
	DROP TABLE [Staging].[ProgramParticipationSpecialEducation]
END

GO


CREATE TABLE Staging.ProgramParticipationSpecialEducation (
			 ID INT IDENTITY(1, 1) Primary Key
			,RecordId VARCHAR(100)
			,Student_Identifier_State VARCHAR(100)
			,School_Identifier_State VARCHAR(100)
			,ProgramParticipationBeginDate DATE
			,ProgramParticipationEndDate DATE NULL
			,SpecialEducationExitReason VARCHAR(100) NULL
			,IDEAEducationalEnvironmentForEarlyChildhood VARCHAR(100)
			,IDEAEducationalEnvironmentForSchoolAge VARCHAR(100)
			,PersonID INT
			,OrganizationID_School INT
			,OrganizationID_Program INT
			,OrganizationPersonRoleId_Program INT
			,PersonProgramParticipationID INT
			,RunDateTime DATETIME
		  );

exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'RecordId' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'Student_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'School_Identifier_State' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'ProgramParticipationBeginDate' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'ProgramParticipationEndDate' 			
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'SpecialEducationExitReason' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefSpecialEducationExitReason', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'SpecialEducationExitReason' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForEarlyChildhood' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefIDEAEducationalEnvironmentEC', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForEarlyChildhood' 
exec sp_addextendedproperty @name = N'Required', @value = N'True', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForSchoolAge' 			
exec sp_addextendedproperty @name = N'Lookup', @value = N'RefIDEAEducationalEnvironmentSchoolAge', @level0type = N'Schema', @level0name = 'Staging', @level1type = N'Table',  @level1name = 'ProgramParticipationSpecialEducation', @level2type = N'Column', @level2name = 'IDEAEducationalEnvironmentForSchoolAge' 