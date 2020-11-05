﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
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
