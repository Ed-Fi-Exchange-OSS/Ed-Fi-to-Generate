﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load the data for membership (C052) and Special Education Child Count
			(C002, C089).

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------Begin State Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

			TRUNCATE TABLE Staging.MembershipChildCount
			TRUNCATE TABLE Staging.MembershipRace
			TRUNCATE TABLE Staging.PrimaryDisability
			
			-----------------------------------------------------
			----Populate Temporary table                      ---
			-----------------------------------------------------

			INSERT INTO Staging.MembershipChildCount
						 (RecordId
						,School_Identifier_State
						,Student_Identifier_State
						,LastName
						,FirstName 
						,Birthdate
						,PrimaryDisability
						,RaceEthnicityQuestion_Hispanic
						,Sex
						,EnglishLearnerStatus
						,IDEAStatus
						,ISO_639_2_NativeLanguage
						,EligibilityStatusForSchoolFoodServicePrograms
						,NationalSchoolLunchProgramDirectCertificationIndicator
						,PersonID
						,PersonDetailID
						,PersonDisabilityId
						,PersonLanguageId
						,PersonStatusId_IDEA
						,PersonStatusId_LEP
						,OrganizationID_School
						,OrganizationPersonRoleID_School
						,OrganizationID_SpecialEducationProgram
						,RunDateTime
						)
			SELECT DISTINCT
						 s.StudentUSI RecordId
						,edorgschool.StateOrganizationId School_Identifier_State 
						,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
						,s.LastSurName LastName
						,s.FirstName FirstName 
						,s.BirthDate Birthdate
						,NULL PrimaryDisability
						,s.HispanicLatinoEthnicity RaceEthnicityQuestion_Hispanic
						,st.CodeValue Sex
						,CASE 
							WHEN spa.ProgramName IS NOT NULL THEN 1
							ELSE 0
						 END  EnglishLearnerStatus
						,0 IDEAStatus
						,ld.CodeValue ISO_639_2_NativeLanguage
						,fse.CodeValue EligibilityStatusForSchoolFoodServicePrograms
						,NULL NationalSchoolLunchProgramDirectCertificationIndicator
						,NULL PersonID
						,NULL PersonDetailID
						,NULL PersonDisabilityId
						,NULL PersonLanguageId
						,NULL PersonStatusId_IDEA
						,NULL PersonStatusId_LEP
						,NULL OrganizationID_School
						,NULL OrganizationPersonRoleID_School
						,NULL OrganizationID_SpecialEducationProgram
						,NULL RunDateTime
			FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].student s
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].SexType st ON s.SexTypeId = st.SexTypeId
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentLanguageUse slu ON s.StudentUSI = slu.StudentUSI
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor ld ON slu.LanguageDescriptorId = ld.DescriptorId
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].LanguageUseType lut ON slu.LanguageUseTypeId = lut.LanguageUseTypeId
				AND lut.CodeValue IN ('Native Language', 'Home Language')
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor fse ON s.SchoolFoodServicesEligibilityDescriptorId = fse.DescriptorId
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentProgramAssociation spa ON s.StudentUSI = spa.StudentUSI
				AND spa.ProgramName = 'English as a Second Language (ESL)'
			--WHERE mem.fy = @FiscalYear -- Need to set up a process for pointing to the correct ODS for each year

			--Note - the reason for building the additional temporary tables first and then updating from those is to increase performance

			--Add Student's Race to the Tempoary Table --
			INSERT INTO Staging.MembershipRace
				(Student_Identifier_State
				,RaceType
				,PersonDemographicRaceId
				,RunDateTime
				)
			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,rt.CodeValue
				,NULL PersonDemographicRaceId
				,NULL RunDateTime
			FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Student s
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentRace sr ON s.StudentUSI = sr.StudentUSI
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].RaceType rt ON sr.RaceTypeId = rt.RaceTypeId
			order by REPLACE(s.StudentUniqueId, ' ', '')


			--Add in Disabilility

			INSERT INTO Staging.PrimaryDisability
				(Student_Identifier_State
				,DisabilityType
				,RunDateTime
				)
			SELECT DISTINCT
				 REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,d.CodeValue
				,NULL RunDateTime
			FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Student s
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentDisability sd ON s.StudentUSI = sd.StudentUSI
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor d 
				ON sd.DisabilityDescriptorId = d.DescriptorId

			UPDATE Staging.MembershipChildCount
			SET PrimaryDisability = pd.DisabilityType
			FROM Staging.MembershipChildCount mcc
			JOIN Staging.PrimaryDisability pd 
				ON mcc.Student_Identifier_State = pd.Student_Identifier_State

			UPDATE Staging.MembershipChildCount
			SET IDEAStatus = 1
			WHERE PrimaryDisability IS NOT NULL
				AND PrimaryDisability <> ''
			

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.MembershipChildCount) > 0
		UPDATE Staging.MembershipRace SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.MembershipRace) > 0
		UPDATE Staging.PrimaryDisability SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PrimaryDisability) > 0

		----Validate Staging.MembershipChildCount----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount', 'Staging.MembershipChildCount'

		----Validate Staging.MembershipRace----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount', 'Staging.MembershipRace'

		----Validate Staging.PrimaryDisability----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount', 'Staging.PrimaryDisability'


	
			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END
