-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_STEP02_Discipline]    Script Date: 10/20/2017 10:45:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline]
	@SchoolYear SMALLINT
	AS
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


			TRUNCATE TABLE Staging.Discipline

			INSERT INTO [Staging].[Discipline]
			   ([Student_Identifier_State]
			   ,[School_Identifier_State]
			   ,[IncidentIdentifier]
			   ,[DisciplinaryActionTaken]
			   ,[DisciplineReason]
			   ,[DisciplinaryActionStartDate]
			   ,[DisciplinaryActionEndDate]
			   ,[DurationOfDisciplinaryAction]
			   ,[IdeaInterimRemoval]
			   ,[IdeaInterimRemovalReason]
			   ,[DisciplineMethodOfCwd]
			   ,[PersonId]
			   ,[OrganizationID_School]
			   ,[OrganizationPersonRoleId_School]
			   ,[IncidentId]
			   ,[RunDateTime]
			   )
			SELECT DISTINCT 
				  s.StudentUniqueId
				, eo.StateOrganizationId
				, di.IncidentIdentifier
				, dd.CodeValue [DisciplinaryActionTaken]
				, bd.CodeValue [DisciplineReason]
				, da.DisciplineDate
				, NULL
				, da.DisciplineActionLength
				, dd.CodeValue [IdeaInterimRemoval]
				, bd.CodeValue [IdeaInterimRemovalReason]
				, dd.CodeValue [DisciplineMethodOfCwd]
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL RunDateTime
			FROM [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].DisciplineIncident di
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].DisciplineActionDisciplineIncident dadi
				ON di.IncidentIdentifier = dadi.IncidentIdentifier
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].DisciplineAction da
				ON dadi.DisciplineActionIdentifier = da.DisciplineActionIdentifier
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Student s
				ON da.StudentUSI = s.StudentUSI
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].EducationOrganization eo
				ON di.SchoolId = eo.EducationOrganizationId
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].DisciplineActionDiscipline dad
				ON da.DisciplineActionIdentifier = dad.DisciplineActionIdentifier
			JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor dd
				ON dad.DisciplineDescriptorId = dd.DescriptorId
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].DisciplineIncidentBehavior dib
				ON di.IncidentIdentifier = dib.IncidentIdentifier
			LEFT JOIN [EdFi20StagingDB1].[EdFi_Ods_Generate].[edfi].Descriptor bd
				ON dib.BehaviorDescriptorId = bd.DescriptorId


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Discipline SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Discipline) > 0

		----Validate Staging.Discipline----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline', 'Staging.Discipline'


			
			set nocount off;


		END TRY
		BEGIN CATCH

			declare @msg as nvarchar(max)
			set @msg = ERROR_MESSAGE()

			declare @sev as int
			set @sev = ERROR_SEVERITY()

			RAISERROR(@msg, @sev, 1)

		END CATCH; 

	END

