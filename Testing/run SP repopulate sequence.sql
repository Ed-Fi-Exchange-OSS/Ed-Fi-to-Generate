-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


	EXEC App.[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS] 2018;

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP00_StateDefinedCustomIndicator] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP00_StateDefinedCustomIndicator_EncapsulatedCode] 2018;

	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization] 2018
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd] 2018
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode] 2018;
	/*
	SELECT *
  FROM [generate].[ODS].[PersonDetail]
  --where hispaniclatinoethnicity =0
  where PersonId=21636
  */
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment]  2018
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode] 2018
	
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation] 2018
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode] 2018

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_A_Migrant_MetaEd] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP06_Migrant_EncapsulatedCode] 2018;

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode] 2018;

	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline] 2018
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP08_A_Discipline_MetaEd] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode] 2018

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode] 2018;

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP10_A_Assessments_MetaEd] 2018;

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP11_A_PersonStatus_MetaEd] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode] 2018;

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP12_PersonRace] 2018;
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP12_PersonRace_EncapsulatedCode] 2018;

	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_CharterSchoolManagementOrganization] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP13_CharterSchoolManagementOrganization_EncapsulatedCode] 2018;

	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_ProgramParticipationCTE] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP14_ProgramParticipationCTE_EncapsulatedCode] 2018;

	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP10_Assessments_EncapsulatedCode] 2018;

	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_ProgramParticipationTitleIII] 2018;
	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_ProgramParticipationTitleIII_EncapsulatedCode] 2018;

	EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP16_ProgramParticipationNoD] 2018;
	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP16_ProgramParticipationNoD_EncapsulatedCode] 2018;

	

	-- simulate CTE concentrator
	UPDATE  [Staging].[ProgramParticipationCTE]
	SET CteConcentrator=0
	, [CteParticipant] = 0
	WHERE CteParticipant is null

	UPDATE Top(20) [Staging].[ProgramParticipationCTE]
	SET CteConcentrator=1
	, [CteParticipant] = 1

	
	-- FS155 change, comment out after testing
	UPDATE Staging.ProgramParticipationCTE SET CteConcentrator=0 where Student_Identifier_State='604822'



	EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP14_ProgramParticipationCTE_EncapsulatedCode] 2018;

	-- 
	truncate table RDS.FactOrganizationStatusCounts
	truncate table [RDS].[FactOrganizationStatusCountReports]
	truncate table rds.FactOrganizationCountReports
	truncate table rds.FactOrganizationCounts
	truncate table rds.FactStudentDisciplines
	truncate table rds.FactPersonnelCounts
	truncate table rds.FactPersonnelCountReports
	truncate table rds.FactStudentCountReports
	truncate table rds.FactStudentCounts
	truncate table RDS.FactStudentAssessments
	truncate table rds.BridgeLeaDate
	truncate table rds.BridgeLeaGradeLevels
	truncate table rds.BridgeSchoolGradeLevels
	truncate table rds.BridgeSchoolDate
	truncate table rds.BridgePersonnelDate
	delete from [RDS].[DimSchools]
	delete from rds.DimLeas
	delete from rds.DimSeas
	delete from rds.DimStudents
	delete from rds.DimPersonnel
	delete from [RDS].[DimCharterSchoolApproverAgency]


	update [ODS].[OrganizationPersonRole]
	  set entrydate = '7/1/2017'
	  , ExitDate = null
	
	-- update entrydate for MEP program on test students in OPR table
	  update [ODS].[OrganizationPersonRole]
	  set EntryDate = '9/1/2017'
	  where OrganizationId=111

	--print '@seaFederalIdentificationSystemId='+cast(@seaFederalIdentificationSystemId as varchar(10))
	--print '@seaName='+@seaName
	--print '@seaOrganizationId='+cast(@seaOrganizationId as varchar(10))
	--print '@seaIdentifierTypeId='+cast(@seaIdentifierTypeId as varchar(20))
	--print '@seaIdentifier='+@seaIdentifier
	--print '@stateName='+@stateName
	--print '@stateCode='+@stateCode
/*
	[RDS].[Migrate_OrganizationCounts] @runAsTest=1
*/