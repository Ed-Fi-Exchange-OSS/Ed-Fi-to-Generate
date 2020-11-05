-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

---------------------------------------------------------
----Update Generate to account for the Ed-Fi extensions
---------------------------------------------------------

USE [generate]
GO

----Create the Stored Procedures that point to the extended Ed-Fi location


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd]
	@SchoolYear SMALLINT
	AS 
	BEGIN



		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------Begin State Specific Information Section----------------------------------------
		---------------------------------------------------------------------------------------------------------------------
		----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
		----created to work with the data standardized in this location. Do not make any changes to table names or column----
		----names or to any of the code after this section.  The only information that should be modified is the source  ----
		----of this information.  Codeset mapping is configured in ODS.EdFiReferenceData. -----------------------------------
		---------------------------------------------------------------------------------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		-------------------
		--School Statuses--
		-------------------
		
		UPDATE Staging.Organization
		SET School_VirtualSchoolStatus = virtual.CodeValue
			,School_NationalSchoolLunchProgramStatus = nslp.CodeValue
			,School_SharedTimeIndicator = shared.CodeValue
			,School_ReconstitutedStatus = recon.CodeValue
		FROM Staging.Organization org
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON org.School_Identifier_State = edorgschool.StateOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON edorgschool.EducationOrganizationId = sch.SchoolId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsSchool ceds ON sch.SchoolId = ceds.CedsSchoolId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor virtual ON ceds.VirtualSchoolStatusDescriptorId = virtual.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor nslp ON ceds.NationalSchoolLunchProgramStatusDescriptorId = nslp.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor shared ON ceds.SharedTimeIndicatorDescriptorId = shared.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor recon ON ceds.ReconstitutedStatusDescriptorId = recon.DescriptorId

		-------------------
		--LEA Type --------
		-------------------

		UPDATE Staging.Organization
		SET LEA_Type = leatype.CodeValue
		FROM Staging.Organization org
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON org.LEA_Identifier_State = edorglea.StateOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON edorglea.EducationOrganizationId = lea.LocalEducationAgencyId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CEDSLocalEducationAgency CEDSLea ON lea.LocalEducationAgencyId = CEDSLea.LocalEducationAgencyId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor leatype ON CEDSLea.LocalEducationAgencyTypeDescriptorId = leatype.DescriptorId

		-------------------------------
		--Organization Financial Data--
		-------------------------------

		--Federal Program Code for Title I Part A Allocation is 84.010
		
		INSERT INTO Staging.OrganizationFederalFunding
		SELECT DISTINCT
			edorglea.StateOrganizationId OrganizationIdentifier
			,App.GetOrganizationTypeId('LEA', '001156') OrganizationType
			,edorgf.FederalProgramCode FederalProgramCode
			,edorgf.FederalProgramsFundingAllocation FederalProgramsFundingAllocation
			,edorgf.ParentalInvolvmementReservationFunds ParentalInvolvementReservationFunds
			,NULL RunDateTime
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].EducationOrganizationFederalFunding edorgf ON edorglea.EducationOrganizationId = edorgf.EducationOrganizationId


		---------------------------------------------------------------------------------------------------------------------
		-------------------------------------End State Specific Information Section------------------------------------------
		---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Organization SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Organization) > 0
		UPDATE Staging.OrganizationFederalFunding SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.OrganizationFederalFunding) > 0

		-------------------------------------------------------------------------------------------------------------------------
		-------- Begin Validation of Staging Tables included in this ETL --------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------

		----Validate Staging.Organization----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd', 'Organization', @SchoolYear

		----Validate Staging.OrganizationFederalFunding----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd', 'OrganizationFederalFunding', @SchoolYear



	END



GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd]    Script Date: 6/6/2018 3:19:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd]
END

GO



CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load the data for membership (C052) and Special Education Child Count
			(C002, C089).  This is data pulled specifically from the Ed-Fi ODS Extensions created for Generate & EDFacts 
			Reporting.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd];
    
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
			
			-----------------------------------------------------
			----Add Additional Items to Staging Tables        ---
			-----------------------------------------------------

			UPDATE Staging.MembershipChildCount
			SET NationalSchoolLunchProgramDirectCertificationIndicator = 
				(CASE d.CodeValue
					WHEN 'Yes' THEN '1'
					WHEN 'No' THEN '0'
					ELSE NULL END)
			FROM Staging.MembershipChildCount mcc
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].student s ON mcc.Student_Identifier_State = s.StudentUniqueId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON s.StudentUSI = ssa.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch ON ssa.SchoolId = sch.SchoolId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorglea ON lea.LocalEducationAgencyId = edorglea.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorgschool ON sch.SchoolId = edorgschool.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].StudentExtension ceds ON s.StudentUSI = ceds.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON ceds.NationalSchoolLunchProgramDirectCertificationIndicatorDescriptorId = d.DescriptorId
			WHERE mcc.School_Identifier_State = edorgschool.StateOrganizationId

	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.MembershipChildCount SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.MembershipChildCount) > 0

		----Validate Staging.MembershipChildCount----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP03_MembershipChildCount', 'MembershipChildCount', @SchoolYear

	
			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



GO

/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd]    Script Date: 6/25/2018 3:40:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd]
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
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd];
    
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

			UPDATE Staging.Migrant
			SET MigrantEducationProgramEnrollmentType = mtype.CodeValue
				,MigrantEducationProgramServicesType = stype.CodeValue
				,MigrantStudentQualifyingArrivalDate = ceds.MigrantStudentQualifyingArrivalDate
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentMigrantEducationProgramAssociation pa ON s.StudentUSI = pa.StudentUSI
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dc ON pa.ContinuationOfServicesReasonDescriptorId = dc.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].ProgramType pt ON pa.ProgramTypeId = pt.ProgramTypeId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg ON pa.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN Staging.Migrant m ON s.StudentUniqueId = m.Student_Identifier_State
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsStudentMigrantEducationProgramAssociation ceds ON s.StudentUSI = ceds.StudentUSI
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor mtype ON ceds.MigrantEducationProgramEnrollmentTypeDescriptorId = mtype.DescriptorId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor stype ON ceds.MigrantEducationProgramServicesTypeDescriptorId = stype.DescriptorId
			WHERE m.School_Identifier_State = edorg.EducationOrganizationId
			AND ceds.EducationOrganizationId = edorg.EducationOrganizationId


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Migrant SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Migrant) > 0

		----Validate Staging.Migrant----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd', 'Migrant', @SchoolYear

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd]
	@SchoolYear SMALLINT
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
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd];
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;


			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		
		UPDATE Staging.StaffAssignment
		SET TitleIProgramStaffCategory = title.CodeValue
			,SpecialEducationAgeGroupTaught = agegroup.CodeValue
			,SpecialEducationStaffCategory = staff.CodeValue
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Staff s
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StaffEducationOrganizationAssignmentAssociation aa
			ON s.StaffUSI = aa.StaffUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].StaffEducationOrganizationAssignmentAssociationExtension aae
			ON aa.StaffUSI = aae.StaffUSI
			AND aa.EducationOrganizationId = aae.EducationOrganizationId
			AND aa.StaffClassificationDescriptorId = aae.StaffClassificationDescriptorId
			AND aa.BeginDate = aae.BeginDate
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor title ON aae.TitleIProgramStaffCategoryDescriptorId = title.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor agegroup ON aae.SpecialEducationAgeGroupTaughtDescriptorId = agegroup.DescriptorId
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor staff ON aae.SpecialEducationSupportServicesCategoryDescriptorId = staff.DescriptorId



			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.StaffAssignment SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.StaffAssignment) > 0

		----Validate Staging.StaffAssignment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd', 'StaffAssignment', @SchoolYear

		SET NOCOUNT OFF;

	END


----Update the App.DataMigrationTasks to add in the new Stored Procedures and adjust the order of the Stored Procedures to include the extended tables


GO

----------------------------------------------------
----Remove ETL Steps from App.DataMigrationTasks----
----------------------------------------------------

DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus%'

DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCoded%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode%'

DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaE%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd%'
DELETE FROM App.DataMigrationTasks WHERE StoredProcedureName LIKE '%Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd%'


---------------------------------------
----Create DataMigrationTasks----------
---------------------------------------


INSERT INTO [App].[DataMigrationTasks]
           ([DataMigrationTypeId]
           ,[IsActive]
           ,[RunAfterGenerateMigration]
           ,[RunBeforeGenerateMigration]
           ,[StoredProcedureName]
           ,[TaskSequence])
VALUES
('1', '1', '0', '1', '[App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS]', '1')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization] ''2018''', '2')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd] ''2018''', '3')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] ''2018''', '4')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person] ''2018''', '5')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode] ''2018''', '6')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment] ''2018''', '7')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode] ''2018''', '8')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation] ''2018''', '9')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode] ''2018''', '10')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount] ''2018''', '11')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_MembershipChildCount_MetaEd] ''2018''', '12')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_MembershipChildCount_EncapsulatedCode] ''2018''', '13')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant] ''2018''', '14')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd] ''2018''', '15')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode] ''2018''', '16')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI] ''2018''', '17')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode] ''2018''', '18')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline] ''2018''', '19')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode] ''2018''', '20')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment] ''2018''', '21')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd] ''2018''', '22')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode] ''2018''', '23')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments] ''2018''', '24')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode] ''2018''', '25')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus] ''2018''', '26')
,('1', '1', '0', '1', '[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode] ''2018''', '27')


---------------------------------------------------------------
----Temporarily Turn Off Generate Beta Custom Reports----------
---------------------------------------------------------------

	UPDATE App.DataMigrationTasks
	SET IsActive = 0
		WHERE StoredProcedureName IN
		(
		'rds.Empty_RDS ''childcount'''
		,'rds.Migrate_StudentCounts ''childcount'', 0'
		,'rds.Empty_RDS ''specedexit'''
		,'rds.Migrate_StudentCounts ''specedexit'', 0'
		,'rds.Empty_RDS ''cte'''
		,'rds.Migrate_StudentCounts ''cte'', 0'
		)