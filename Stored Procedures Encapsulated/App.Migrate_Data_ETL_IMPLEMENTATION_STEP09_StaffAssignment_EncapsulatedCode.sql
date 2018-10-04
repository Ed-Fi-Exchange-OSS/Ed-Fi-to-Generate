USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS
   /*************************************************************************************************************
    Created by:    Nathan Clinton | nathan.clinton@aemcorp.com | CIID (https://ciidta.grads360.org/#program)
    Date Created:  6/28/2018

    Purpose:
        The purpose of this ETL is to maintain the unique list of Student Identifiers assigned by the state
		in the ODS.

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
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;

		DECLARE @RecordStartDate DATETIME

		SET @RecordStartDate = App.GetFiscalYearEndDate(@SchoolYear)

		-- Grab the PersonID for all personnel records
		UPDATE Staging.StaffAssignment
		SET PersonId = pid.PersonId
		FROM Staging.StaffAssignment sa
		JOIN ODS.PersonIdentifier pid
			ON sa.Personnel_Identifier_State = pid.Identifier
			AND pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001074')

		-- Grab the OrganizationID for all personnel records
		UPDATE Staging.StaffAssignment
		SET OrganizationId = oid.OrganizationId
		FROM Staging.StaffAssignment sa
		JOIN ODS.OrganizationIdentifier oid
			ON sa.School_Identifier_State = oid.Identifier
			AND oid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND oid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')

		
		
		-- Create base OrganizationPersonRole to link the personnel to the schools to which they are assigned
		INSERT INTO ODS.OrganizationPersonRole 
		SELECT 
			  oid.OrganizationId
			, sa.PersonId
			, r.RoleId
			, sa.AssignmentStartDate
			, sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		JOIN ODS.OrganizationIdentifier oid
			ON sa.School_Identifier_State = oid.Identifier
			AND oid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
			AND oid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')
		JOIN ODS.[Role] r
			ON [Name] = 'K12 Personnel'
		LEFT JOIN ODS.OrganizationPersonRole opr
			ON sa.PersonId = opr.PersonId
			AND oid.OrganizationId = opr.OrganizationId
			AND r.RoleId = opr.RoleId
			AND sa.AssignmentStartDate = opr.EntryDate
		WHERE opr.OrganizationPersonRoleId IS NULL

		-- Update Assignment End Dates as necessary
		UPDATE ODS.OrganizationPersonRole
		SET ExitDate = sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		JOIN ODS.[Role] r
			ON [Name] = 'K12 Personnel'
		JOIN ODS.OrganizationPersonRole opr
			ON sa.OrganizationId = opr.OrganizationId
			AND sa.PersonId = opr.PersonId
			AND sa.AssignmentStartDate = opr.EntryDate
			AND opr.ExitDate IS NULL
			AND sa.AssignmentEndDate IS NOT NULL

		-- Grab the OrganizationPersonRoleIds for all StaffAssignment records
		UPDATE Staging.StaffAssignment
		SET OrganizationPersonRoleId = opr.OrganizationPersonRoleId
		FROM Staging.StaffAssignment sa
		JOIN ODS.OrganizationPersonRole opr
			ON sa.OrganizationId = opr.OrganizationId
			AND sa.PersonId = opr.PersonId
			AND sa.AssignmentStartDate = opr.EntryDate

		-- Updte existing K12StaffAssignment records
		UPDATE ODS.K12StaffAssignment
		SET   RefK12StaffClassificationId = sc.RefEducationStaffClassificationId
			, FullTimeEquivalency = ksa.FullTimeEquivalency
			, HighlyQualifiedTeacherIndicator = ksa.HighlyQualifiedTeacherIndicator
			, SpecialEducationTeacher = CASE WHEN sc.Code = 'SpecialEducationTeachers' THEN 1 ELSE 0 END
			, RefSpecialEducationStaffCategoryId = sesc.RefSpecialEducationStaffCategoryId
			, RefSpecialEducationAgeGroupTaughtId = seagt.RefSpecialEducationAgeGroupTaughtId
			, RefTitleIProgramStaffCategoryId = tipsc.RefTitleIProgramStaffCategoryId
			, RecordEndDateTime = sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		LEFT JOIN ODS.SourceSystemReferenceData scss
			ON sa.K12StaffClassification = scss.InputCode
			AND scss.TableName = 'RefK12StaffClassification'
			AND scss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefK12StaffClassification sc
			ON scss.OutputCode = sc.Code
		LEFT JOIN ODS.SourceSystemReferenceData sescss
			ON sa.SpecialEducationStaffCategory = sescss.InputCode
			AND sescss.TableName = 'RefSpecialEducationStaffCategory'
			AND sescss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationStaffCategory sesc
			ON sescss.OutputCode = sesc.Code
		LEFT JOIN ODS.SourceSystemReferenceData seagtss
			ON sa.SpecialEducationAgeGroupTaught = seagtss.InputCode
			AND seagtss.TableName = 'RefSpecialEducationAgeGroupTaught'
			AND seagtss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationAgeGroupTaught seagt
			ON seagtss.OutputCode = seagt.Code
		LEFT JOIN ODS.SourceSystemReferenceData tipscss
			ON sa.TitleIProgramStaffCategory = tipscss.InputCode
			AND tipscss.TableName = 'RefTitleIProgramStaffCategory'
			AND tipscss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefTitleIProgramStaffCategory tipsc
			ON tipscss.OutputCode = tipsc.code
		JOIN ODS.K12StaffAssignment ksa
			ON sa.OrganizationPersonRoleId = ksa.OrganizationPersonRoleId

		-- Create new K12StaffAssignment records 
		INSERT INTO ODS.K12StaffAssignment
		SELECT 
			  sa.OrganizationPersonRoleId
			, sc.RefEducationStaffClassificationId
			, NULL
			, NULL
			, NULL
			, NULL
			, NULL
			, sa.FullTimeEquivalency
			, NULL
			, NULL
			, sa.HighlyQualifiedTeacherIndicator
			, CASE WHEN sc.Code = 'SpecialEducationTeachers' THEN 1 ELSE 0 END
			, sesc.RefSpecialEducationStaffCategoryId
			, NULL
			, NULL
			, seagt.RefSpecialEducationAgeGroupTaughtId
			, NULL
			, tipsc.RefTitleIProgramStaffCategoryId
			, sa.AssignmentStartDate
			, sa.AssignmentEndDate
		FROM Staging.StaffAssignment sa
		LEFT JOIN ODS.SourceSystemReferenceData scss
			ON sa.K12StaffClassification = scss.InputCode
			AND scss.TableName = 'RefK12StaffClassification'
			AND scss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefK12StaffClassification sc
			ON scss.OutputCode = sc.Code
		LEFT JOIN ODS.SourceSystemReferenceData sescss
			ON sa.SpecialEducationStaffCategory = sescss.InputCode
			AND sescss.TableName = 'RefSpecialEducationStaffCategory'
			AND sescss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationStaffCategory sesc
			ON sescss.OutputCode = sesc.Code
		LEFT JOIN ODS.SourceSystemReferenceData seagtss
			ON sa.SpecialEducationAgeGroupTaught = seagtss.InputCode
			AND seagtss.TableName = 'RefSpecialEducationAgeGroupTaught'
			AND seagtss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefSpecialEducationAgeGroupTaught seagt
			ON seagtss.OutputCode = seagt.Code
		LEFT JOIN ODS.SourceSystemReferenceData tipscss
			ON sa.TitleIProgramStaffCategory = tipscss.InputCode
			AND tipscss.TableName = 'RefTitleIProgramStaffCategory'
			AND tipscss.SchoolYear = @SchoolYear
		LEFT JOIN ODS.RefTitleIProgramStaffCategory tipsc
			ON tipscss.OutputCode = tipsc.code
		LEFT JOIN ODS.K12StaffAssignment ksa
			ON sa.OrganizationPersonRoleId = ksa.OrganizationPersonRoleId
		WHERE ksa.K12StaffAssignmentId IS NULL


		-- Create missing PersonCredential records
		INSERT INTO ODS.PersonCredential
		SELECT 
			  sa.PersonId
			, NULL
			, ct.RefCredentialTypeId
			, sa.CredentialIssuanceDate
			, sa.CredentialExpirationDate
			, NULL
			, NULL
			, NULL
		FROM Staging.StaffAssignment sa
		LEFT JOIN ODS.SourceSystemReferenceData ctss
			ON sa.CredentialType = ctss.InputCode
			AND ctss.TableName = 'RefCredentialType'
			AND ctss.SchoolYear = @SchoolYear
		JOIN ODS.RefCredentialType ct
			ON ctss.OutputCode = ct.Code
		LEFT JOIN ods.PersonCredential pc
			ON sa.PersonId = pc.PersonId
		WHERE pc.PersonCredentialId IS NULL

		-- Create missing StaffCredential records
		INSERT INTO ODS.StaffCredential
		SELECT
			  NULL
			, NULL
			, NULL
			, pq.RefParaprofessionalQualificationId
			, NULL
			, NULL
			, NULL
			, NULL
			, pc.PersonCredentialId
			, sa.CredentialIssuanceDate
			, sa.CredentialExpirationDate
		FROM Staging.StaffAssignment sa
		JOIN ODS.PersonCredential pc
			ON sa.PersonId = pc.PersonId
		LEFT JOIN ODS.SourceSystemReferenceData pqss
			ON sa.CredentialType = pqss.InputCode
			AND pqss.TableName = 'RefParaprofessionalQualification'
			AND pqss.SchoolYear = @SchoolYear
		JOIN ODS.RefParaprofessionalQualification pq
			ON pqss.OutputCode = pq.Code

		SET NOCOUNT OFF;
  END