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
			   ,[EducationalServicesAfterRemoval]
			   ,[DisciplineMethodOfCwd]
			   ,[PersonId]
			   ,[OrganizationID_School]
			   ,[OrganizationPersonRoleId_School]
			   ,[IncidentId]
			   ,[RunDateTime]
			   )
			SELECT DISTINCT 
				  s.StudentUniqueId [Student_Identifier_State]
				, eo.StateOrganizationId [School_Identifier_State]
				, di.IncidentIdentifier [IncidentIdentifier]
				, dd.CodeValue [DisciplinaryActionTaken]
				, bd.CodeValue [DisciplineReason]
				, da.DisciplineDate [DisciplinaryActionStartDate]
				, NULL [DisciplinaryActionEndDate]
				, da.DisciplineActionLength [DurationOfDisciplinaryAction]
				, dd.CodeValue [IdeaInterimRemoval]
				, dd.CodeValue [IdeaInterimRemovalReason]
				, NULL [EducationalServicesAfterRemoval]
				, dd.CodeValue [DisciplineMethodOfCwd]
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineIncident di
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineActionDisciplineIncident dadi
				ON di.IncidentIdentifier = dadi.IncidentIdentifier
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineAction da
				ON dadi.DisciplineActionIdentifier = da.DisciplineActionIdentifier
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
				ON da.StudentUSI = s.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization eo
				ON di.SchoolId = eo.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineActionDiscipline dad
				ON da.DisciplineActionIdentifier = dad.DisciplineActionIdentifier
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dd
				ON dad.DisciplineDescriptorId = dd.DescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineIncidentBehavior dib
				ON di.IncidentIdentifier = dib.IncidentIdentifier
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor bd
				ON dib.BehaviorDescriptorId = bd.DescriptorId


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Discipline SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Discipline) > 0

		----Validate Staging.Discipline----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline', 'Discipline', @SchoolYear


			
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

