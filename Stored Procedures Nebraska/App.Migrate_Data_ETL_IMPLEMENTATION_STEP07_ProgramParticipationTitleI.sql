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
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI]    Script Date: 6/14/2018 4:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load Title 1 indicators about students for EDFacts reports that apply to the full year.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI];
    
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

			TRUNCATE TABLE Staging.ProgramParticipationTitleI

			INSERT INTO Staging.ProgramParticipationTitleI
						 (RecordId
						,School_Identifier_State
						,Student_Identifier_State
						,TitleIIndicator
						,PersonID
						,OrganizationID_School
						,OrganizationPersonRoleID_TitleIProgram
						,OrganizationID_TitleIProgram
						,PersonProgramParticipationId
						,RefTitleIIndicatorId
						,RunDateTime
						)
			SELECT DISTINCT
						 pa.StudentUSI RecordId
						,edorg.StateOrganizationId School_Identifier_State 
						,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
						,par.CodeValue Title1Indicator
						,NULL PersonID
						,NULL OrganizationID_School
						,NULL OrganizationPersonRoleID_TitleIProgram
						,NULL OrganizationID_TitleIProgram
						,NULL PersonProgramParticipationId
						,NULL RefTitleIIndicatorId
						,NULL RunDateTime
			--This is not the right "From" selection, just leaving it here so to load the Stored Procedure, need to go back and fill that in correctly to get
			--the title I information
			FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Student s
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].StudentTitleIPartAProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].ProgramType pt ON pa.ProgramTypeId = pt.ProgramTypeId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].TitleIPartAParticipantType par ON pa.TitleIPartAParticipantTypeId = par.TitleIPartAParticipantTypeId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------
		UPDATE Staging.ProgramParticipationTitleI SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationTitleI) > 0

		----Validate Staging.ProgramParticipationTitleI----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI', 'Staging.ProgramParticipationTitleI'

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



