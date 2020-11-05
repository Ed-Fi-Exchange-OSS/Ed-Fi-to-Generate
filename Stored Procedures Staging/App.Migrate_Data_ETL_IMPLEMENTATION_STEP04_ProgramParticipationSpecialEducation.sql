﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipation]    Script Date: 6/5/2018 3:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation]
	@SchoolYear SMALLINT
	AS
	BEGIN

			set nocount on;
	
			TRUNCATE TABLE Staging.ProgramParticipationSpecialEducation

	-------------------------------------Begin State Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

			INSERT INTO Staging.ProgramParticipationSpecialEducation
				(RecordId
				,Student_Identifier_State
				,School_Identifier_State
				,ProgramParticipationBeginDate
				,ProgramParticipationEndDate
				,SpecialEducationExitReason
				,IDEAEducationalEnvironmentForEarlyChildhood
				,IDEAEducationalEnvironmentForSchoolAge
				,PersonID
				,OrganizationID_School
				,OrganizationID_Program
				,OrganizationPersonRoleId_Program
				,PersonProgramParticipationID
				,RunDateTime
				)
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,edorg.StateOrganizationId School_Identifier_State	
				,spa.BeginDate ProgramParticipationBeginDate
				,spa.EndDate ProgramParticipationEndDate
				,d.CodeValue SpecialEducationExitReason
				,NULL IDEAEducationalEnvironmentForEarlyChildhood
				,NULL IDEAEducationalEnvironmentForSchoolAge
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationID_Program
				,NULL OrganizationPersonRoleId_Program
				,NULL PersonProgramParticipationID
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentProgramAssociation spa ON s.StudentUSI = spa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].ProgramType pt ON spa.ProgramTypeId = pt.ProgramTypeId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON spa.ReasonExitedDescriptorId = d.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSpecialEducationProgramAssociation sepa ON s.StudentUSI = sepa.StudentUSI and spa.BeginDate = sepa.BeginDate
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON sepa.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON edorg.EducationOrganizationId = sch.SchoolId
			WHERE pt.CodeValue = 'Special Education'
			--Add School Age Educational Environment--

			UPDATE Staging.ProgramParticipationSpecialEducation
			SET IDEAEducationalEnvironmentForSchoolAge = spt.CodeValue
			FROM Staging.ProgramParticipationSpecialEducation ppse
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSpecialEducationProgramAssociation sppa ON ppse.RecordId = sppa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SpecialEducationSettingDescriptor spd ON sppa.SpecialEducationSettingDescriptorId = spd.SpecialEducationSettingDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].SpecialEducationSettingType spt ON spd.SpecialEducationSettingTypeId = spt.SpecialEducationSettingTypeId
			--Long Term - Need to establish the age of the student since RF and SS can be overlapped.  Right now not an issue because Early Childhood environment only exists in the Descriptor
			--table in Nebraska, but when it becomes native to the SpecialEducationSettingDescriptor, the age will be a factor. Will have to join to the Student, grab the birthdate, and then
			--compare that with the child count date in ToggleResponses to establis the age of the student.
		
			--Add Early Childhood Education Environment--
			----Note: These option set values are not in Ed-Fi Natively. This is using the edfi.Descriptor table to pull these values.

			UPDATE Staging.ProgramParticipationSpecialEducation
			SET IDEAEducationalEnvironmentForEarlyChildhood = d.CodeValue
			FROM Staging.ProgramParticipationSpecialEducation ppse
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSpecialEducationProgramAssociation sppa ON ppse.RecordId = sppa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON sppa.SpecialEducationSettingDescriptorId = d.DescriptorId
			--Long Term - Need to establish the age of the student since RF and SS can be overlapped.  Right now not an issue because Early Childhood environment only exists in the Descriptor
			--table in Nebraska, but when it becomes native to the SpecialEducationSettingDescriptor, the age will be a factor. Will have to join to the Student, grab the birthdate, and then
			--compare that with the child count date in ToggleResponses to establis the age of the student.



	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationSpecialEducation SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationSpecialEducation) > 0

		----Validate Staging.ProgramParticipationSpecialEducation----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation', 'ProgramParticipationSpecialEducation', @SchoolYear


			set nocount off;
	END

