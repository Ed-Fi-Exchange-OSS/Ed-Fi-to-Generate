USE [generate]
GO

/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant]    Script Date: 6/25/2018 3:40:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant]
	@SchoolYear SMALLINT = NULL
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
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant];
    
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

			TRUNCATE TABLE Staging.Migrant
			
			INSERT INTO Staging.Migrant
				(RecordId
				,SchoolYear
				,LEA_Identifier_State
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
				,LEAOrganizationPersonRoleID_MigrantProgram
				,LEAOrganizationID_MigrantProgram
				,SchoolOrganizationPersonRoleID_MigrantProgram
				,SchoolOrganizationID_MigrantProgram
				,PersonProgramParticipationId
				,ProgramParticipationMigrantId
				,RunDateTime
				)
			SELECT DISTINCT
				 pa.StudentUSI RecordId
				, @SchoolYear SchoolYear
				,REPLACE(edorgcode.IdentificationCode, ' ', '') [LEA_Identifier_State]
				,sch.SchoolId School_Identifier_State	
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,1 MigrantStatus --defaulted based on join to migrant
				,NULL MigrantEducationProgramEnrollmentType -- this element is not available in Ed-Fi part of MetaEd Extension
				, sd.CodeValue MigrantEducationProgramServicesType
				,CASE ISNULL(dc.CodeValue, 'xx')
					WHEN 'xx' THEN '0'
					ELSE 1 END MigrantEducationProgramContinuationOfServicesStatus -- This should be a bit value -- if Continuation of Services is true, then 1, else 0
				,dc.CodeValue ContinuationOfServicesReason
				,pa.QualifyingArrivalDate MigrantStudentQualifyingArrivalDate
				,pa.LastQualifyingMove LastQualifyingMoveDate 
				,pa.PriorityForServices MigrantPrioritizedForServices --this is a bit value 1 = true, 0 = false
				,stmepamedps.ServiceBeginDate ProgramParticipationStartDate
				,stmepamedps.ServiceEndDate	ProgramParticipationExitDate
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL LEAOrganizationPersonRoleID_MigrantProgram
				,NULL LEAOrganizationID_MigrantProgram
				,NULL SchoolOrganizationPersonRoleID_MigrantProgram
				,NULL SchoolOrganizationID_MigrantProgram
				,NULL PersonProgramParticipationId
				,NULL ProgramParticipationMigrantId
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentMigrantEducationProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dc ON pa.ContinuationOfServicesReasonDescriptorId = dc.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt ON pa.ProgramTypeDescriptorId = pt.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId
			join [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode on edorgcode.EducationOrganizationId=pa.EducationOrganizationId
			join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d on d.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId
			join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentMigrantEducationProgramAssociationMigrantEducationProgramService stmepamedps 
				on stmepamedps.EducationOrganizationId=pa.EducationOrganizationId and stmepamedps.ProgramTypeDescriptorId=pa.ProgramTypeDescriptorId and stmepamedps.StudentUSI=pa.StudentUSI
			join [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor sd on sd.DescriptorId=stmepamedps.MigrantEducationProgramServiceDescriptorId
			
			-- SchoolId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = s.StudentUSI 
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch 
				ON sta.EducationOrganizationId = sch.SchoolId

			WHERE isnull(stmepamedps.ServiceEndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
			AND stmepamedps.ServiceBeginDate <= App.GetFiscalYearEndDate(@SchoolYear)
			and d.CodeValue = 'SEA'


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Migrant SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Migrant) > 0

		----Validate Staging.Migrant----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Migrant', 'Migrant', @SchoolYear

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END
