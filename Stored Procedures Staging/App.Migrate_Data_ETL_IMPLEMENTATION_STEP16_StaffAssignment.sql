USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment]
	@SchoolYear SMALLINT = NULL
	AS
   /*************************************************************************************************************
    Created by:    Nathan Clinton | nathan.clinton@aemcorp.com | CIID (https://ciidta.grads360.org/#program)
    Date Created:  6/28/2018

    Purpose:
        The purpose of this ETL is to load the list of K12 staff into Generate.

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Data Warehouse: db_ECSUID.dbo.ECSUID

    Data Targets:  Generate Database:   Generate.ODS.Person
										Generate.ODS.PersonIdentifier

    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment] 2018;
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;

		
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

		TRUNCATE TABLE Staging.StaffAssignment

		INSERT INTO Staging.StaffAssignment
			(	 
				  Personnel_Identifier_State 
				, LEA_Identifier_State
				, School_Identifier_State 
				, FullTimeEquivalency 
				, SpecialEducationStaffCategory 
				, K12StaffClassification 
				, TitleIProgramStaffCategory 
				, CredentialType 
				, CredentialIssuanceDate 
				, CredentialExpirationDate 
				, ParaprofessionalQualification 
				, SpecialEducationAgeGroupTaught 
				, HighlyQualifiedTeacherIndicator
				, AssignmentStartDate
				, AssignmentEndDate
				, InexperiencedStatus
				, EmergencyorProvisionalCredentialStatus
				, OutOfFieldStatus
				, ProgramTypeCode
				, RunDateTime
			)
		SELECT 
			  s.StaffUniqueId										Personnel_Identifier_State
			, NULL --leaorg.LocalEducationAgencyId							LEA_Identifier_State
			, NULL --ssa.SchoolId											School_Identifier_State
			--, schorg.LocalEducationAgencyId							LEA_Identifier_State
			--, schorg.SchoolId										School_Identifier_State
			, ea.FullTimeEquivalency								FullTimeEquivalency
			, NULL													SpecialEducationStaffCategory
			, scd.CodeValue											K12StaffClassification
			, NULL													TitleIProgramStaffCategory
			, ct.CodeValue											CredentialType
			, cred.IssuanceDate										CredentialIssuanceDate
			, cred.ExpirationDate									CredentialExpirationDate
			, NULL													ParaprofessionalQualification
			, NULL													SpecialEducationAgeGroupTaught
			, s.HighlyQualifiedTeacher								[HighlyQualifiedTeacherIndicator]
			, aa.BeginDate											AssignmentStartDate
			, aa.EndDate											AssignmentEndDate
			, NULL													InexperiencedStatus
			, NULL													EmergencyorProvisionalCredentialStatus
			, NULL													OutOfFieldStatus
			, pd.CodeValue											ProgramTypeCode
			, NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff s
		-- SEA level identificator
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization eo
			ON aa.EducationOrganizationId = eo.EducationOrganizationId

		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode 
			ON edorgcode.EducationOrganizationId=eo.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
			ON d.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId

		-- staff credential
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffCredential sc
			ON s.StaffUSI = sc.StaffUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Credential] cred 
			ON cred.CredentialIdentifier = sc.CredentialIdentifier
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor ct 
			ON ct.DescriptorId=cred.CredentialTypeDescriptorId

		-- staff classification
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor scd
			ON aa.StaffClassificationDescriptorId = scd.DescriptorId

		-- education organization connection
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationEmploymentAssociation ea
			ON s.StaffUSI = ea.StaffUSI
			AND aa.EducationOrganizationId = ea.EducationOrganizationId

		-- staff to education organization assignment
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganization] edorg
			ON edorg.EducationOrganizationId = aa.EducationOrganizationId

		-- staff to school assignment
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffSchoolAssociation ssa
			ON ssa.StaffUSI = s.StaffUSI
			AND ssa.SchoolId = aa.EducationOrganizationId
			AND ssa.SchoolYear = @SchoolYear
		-- program association
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pad
			ON pad.DescriptorId = ssa.ProgramAssignmentDescriptorId

		-- staff to lea assignment
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[LocalEducationAgency] leaorg
			ON leaorg.LocalEducationAgencyId = edorg.EducationOrganizationId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] schorg 
			ON schorg.SchoolId = edorg.EducationOrganizationId


		-- staff program type
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StaffProgramAssociation] progassoc
			ON s.StaffUSI = progassoc.StaffUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pd ON pd.DescriptorId =  progassoc.ProgramTypeDescriptorId

		WHERE d.CodeValue = 'SEA'

		-- UPDATE LEA_IDENTIFIER
		UPDATE [Staging].[StaffAssignment]
		SET LEA_Identifier_State =  edorgcode.IdentificationCode
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff s
		JOIN [Staging].[StaffAssignment] sa ON sa.Personnel_Identifier_State = 
			s.StaffUniqueId

		-- SEA level identificator
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization eo
			ON aa.EducationOrganizationId = eo.EducationOrganizationId

		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode 
			ON edorgcode.EducationOrganizationId=eo.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
			ON d.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency leaorg
			ON leaorg.LocalEducationAgencyId = aa.EducationOrganizationId
		WHERE d.CodeValue = 'SEA'

		-- UPDATE SCHOOL_IDENTIFIER
		UPDATE [Staging].[StaffAssignment]
		SET School_Identifier_State = edorgcode.IdentificationCode
		, LEA_Identifier_State =  edorgcodeLEA.IdentificationCode
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff s
		JOIN [Staging].[StaffAssignment] sa ON sa.Personnel_Identifier_State = 
			s.StaffUniqueId
		-- SEA level identificator
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		-- school identifier
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School schorg
			ON schorg.SchoolId = aa.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization eo
			ON schorg.SchoolId = eo.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcode 
			ON edorgcode.EducationOrganizationId=eo.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d 
			ON d.DescriptorId=edorgcode.EducationOrganizationIdentificationSystemDescriptorId
			AND d.CodeValue = 'SEA'
		-- LEA Identifier
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization eoLEA
			ON schorg.LocalEducationAgencyId = eoLEA.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgcodeLEA
			ON edorgcodeLEA.EducationOrganizationId=eoLEA.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dLEA
			ON dLEA.DescriptorId=edorgcodeLEA.EducationOrganizationIdentificationSystemDescriptorId
			AND dLEA.CodeValue = 'SEA'


		



			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StaffAssignment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StaffAssignment) > 0

		----Validate Staging.StaffAssignment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP16_StaffAssignment', 'StaffAssignment', @SchoolYear

		SET NOCOUNT OFF;

	END
