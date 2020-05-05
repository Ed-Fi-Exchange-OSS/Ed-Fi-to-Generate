USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI]    Script Date: 6/14/2018 4:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI]
	@SchoolYear SMALLINT = NULL
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
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI] 2018;
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;
			
		IF @SchoolYear IS NULL BEGIN
			SELECT @SchoolYear = d.Year + 1
			FROM rds.DimDateDataMigrationTypes dd 
			JOIN rds.DimDates d 
				ON dd.DimDateId = d.DimDateId 
			JOIN rds.DimDataMigrationTypes b 
				ON b.DimDataMigrationTypesId = dd.DataMigrationTypeId 
			WHERE dd.IsSelected = 1 
				AND DataMigrationTypeCode = 'ODS'
		END 

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

			INSERT INTO Staging.ProgramParticipationTitleI (
				RecordId
				,LEA_Identifier_State
				,School_Identifier_State
				,Student_Identifier_State
				,TitleIIndicator
				,PersonID
				,OrganizationID_School
				,LEAOrganizationPersonRoleID_TitleIProgram
				,LEAOrganizationID_TitleIProgram
				,LEAPersonProgramParticipationId
				,SchoolOrganizationPersonRoleID_TitleIProgram
				,SchoolOrganizationID_TitleIProgram
				,SchoolPersonProgramParticipationId
				,RefTitleIIndicatorId
				,RunDateTime
			)
			SELECT DISTINCT
				pa.StudentUSI													RecordId -- StudentUSI
				,lea_edorg.EducationOrganizationId								LEA_Identifier_State
				,sch.SchoolId													School_Identifier_State 
				,REPLACE(s.StudentUniqueId, ' ', '')							Student_Identifier_State
				,par.CodeValue													Title1Indicator
				,NULL															PersonID
				,NULL															OrganizationID_School
				,NULL															LEAOrganizationPersonRoleID_TitleIProgram
				,NULL															LEAOrganizationID_TitleIProgram
				,NULL															LEAPersonProgramParticipationId
				,NULL															SchoolOrganizationPersonRoleID_TitleIProgram
				,NULL															SchoolOrganizationID_TitleIProgram
				,NULL															SchoolPersonProgramParticipationId
				,NULL															RefTitleIIndicatorId
				,NULL															RunDateTime
			--This is not the right "From" selection, just leaving it here so to load the Stored Procedure, 
			-- need to go back and fill that in correctly to get
			--the title I information
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentTitleIPartAProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt ON pt.DescriptorId = pa.ProgramTypeDescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor par ON par.DescriptorId = pa.TitleIPartAParticipantDescriptorId

			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
				ON edorg.EducationOrganizationId = pa.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode 
				ON edorgcode.EducationOrganizationId=pa.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
				ON d.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId
				AND d.CodeValue = 'SEA'
			-- SchoolId
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = s.StudentUSI 
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch
				ON sch.SchoolId = sta.SchoolId
			-- LEA
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization lea_edorg 
				ON sch.LocalEducationAgencyId = lea_edorg.EducationOrganizationId
			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.ProgramParticipationTitleI SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationTitleI) > 0

		----Validate Staging.ProgramParticipationTitleI----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_ProgramParticipationTitleI', 'ProgramParticipationTitleI', @SchoolYear

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



