-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO

/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant]    Script Date: 6/25/2018 3:40:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load Migrant indicators about students for EDFacts reports that apply to the full year.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant];
    
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

			TRUNCATE TABLE Staging.Migrant
			
			INSERT INTO Staging.Migrant
				(RecordId
				,SchoolYear
				,School_Identifier_State
				,Student_Identifier_State
				,MigrantStatus
				,MigrantEducationProgramEnrollmentType
				,MigrantEducationProgramServicesType
				,MigrantEducationProgramContinuationOfServicesStatus
				,ContinuationOfServicesReason
				,MigrantStudentQualifyingArrivalDate
				,LastQualifyingMoveDate 
				,MigrantPrioritizedForServices
				,ProgramParticipationStartDate
				,ProgramParticipationExitDate
				,PersonID
				,OrganizationID_School
				,OrganizationPersonRoleID_MigrantProgram
				,OrganizationID_MigrantProgram
				,PersonProgramParticipationId
				,ProgramParticipationMigrantId
				,RunDateTime
				)
			SELECT DISTINCT
				 pa.StudentUSI RecordId
				,NULL SchoolYear
				,edorg.StateOrganizationId School_Identifier_State
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,NULL --par.CodeValue?? MigrantStatus
				,'Basic School Program' MigrantEducationProgramEnrollmentType --this element is not available in Ed-Fi. Need to do a case statement related to the summer term
				,NULL MigrantEducationProgramServicesType -- This element is not avaialble in Ed-Fi.
				,CASE ISNULL(dc.CodeValue, 'xx')
					WHEN 'xx' THEN '0'
					ELSE dc.CodeValue END MigrantEducationProgramContinuationOfServicesStatus -- Tjs should be a bit value -- if Continuation of Services is true, then 1, else 0
				,dc.CodeValue ContinuationOfServicesReason
				,NULL MigrantStudentQualifyingArrivalDate -- need to determine how to fill this in.  Do we sort and use the very first "LastQualifyingMoveDate" we can  find.
				,pa.LastQualifyingMove LastQualifyingMoveDate 
				,pa.PriorityForServices MigrantPrioritizedForServices --this is a bit value 1 = true, 0 = false
				,pa.BeginDate ProgramParticipationStartDate
				,NULL ProgramParticipationExitDate
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationPersonRoleID_MigrantProgram
				,NULL OrganizationID_MigrantProgram
				,NULL PersonProgramParticipationId
				,NULL ProgramParticipationMigrantId
				,NULL RunDateTime
			FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Student s
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentMigrantEducationProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor dc ON pa.ContinuationOfServicesReasonDescriptorId = dc.DescriptorId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].ProgramType pt ON pa.ProgramTypeId = pt.ProgramTypeId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Migrant SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Migrant) > 0

		----Validate Staging.Migrant----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant', 'Staging.Migrant'

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END
