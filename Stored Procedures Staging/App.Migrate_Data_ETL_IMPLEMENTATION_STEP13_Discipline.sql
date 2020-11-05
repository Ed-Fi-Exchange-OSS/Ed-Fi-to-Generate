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

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP13_Discipline') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_Discipline]
END

GO

/*
		[App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_Discipline] 2018
*/

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP13_Discipline]
	@SchoolYear SMALLINT = NULL
	AS
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


			TRUNCATE TABLE Staging.Discipline

			INSERT INTO [Staging].[Discipline] (
				[Student_Identifier_State]
				,[LEA_Identifier_State]
				,[School_Identifier_State]
				,[DisciplineActionIdentifier]
				,[IncidentIdentifier]
				,[IncidentDate]
				,[IncidentTime]
				,[DisciplinaryActionTaken]
				,[DisciplineReason]
				,[DisciplinaryActionStartDate]
				,[DisciplinaryActionEndDate]
				,[DurationOfDisciplinaryAction]
				,[IdeaInterimRemoval]
				,[IdeaInterimRemovalReason]
				,[EducationalServicesAfterRemoval]
				,[DisciplineMethodFirearm]
				,[IDEADisciplineMethodFirearm]
				,[DisciplineMethodOfCwd]
				,[WeaponType]
				,[FirearmType]
				,[PersonId]
				,[OrganizationID_School]
				,[OrganizationPersonRoleId_School]
				,[IncidentId_LEA]
				,[IncidentId_School]
				,[RunDateTime]
			)
			SELECT DISTINCT 
				s.StudentUniqueId											[Student_Identifier_State]
				, lea.LocalEducationAgencyId								LEA_Identifier_State
				, edorg.EducationOrganizationId								[School_Identifier_State]
				, da.DisciplineActionIdentifier								[DisciplineActionIdentifier]
				, di.IncidentIdentifier										[IncidentIdentifier]
				, di.IncidentDate											[IncidentDate]
				, di.IncidentTime											[IncidentTime]
				, dd.CodeValue												[DisciplinaryActionTaken]
				, bd.CodeValue												[DisciplineReason]
				, da.DisciplineDate											[DisciplinaryActionStartDate]
				, NULL														[DisciplinaryActionEndDate]
				, da.DisciplineActionLength									[DurationOfDisciplinaryAction]
				, NULL														[IdeaInterimRemoval]
				, NULL														[IdeaInterimRemovalReason]
				, NULL														[EducationalServicesAfterRemoval]
				, NULL														[DisciplineMethodFirearm]
				, NULL														[IDEADisciplineMethodFirearm]
				, dd.CodeValue												[DisciplineMethodOfCwd]
				, wd.CodeValue												[WeaponType]
				, NULL														[FirearmType]
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineIncident di
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineActionStudentDisciplineIncidentAssociation dadi
				ON di.IncidentIdentifier = dadi.IncidentIdentifier 
				and dadi.SchoolId=di.SchoolId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineAction da
				ON dadi.DisciplineActionIdentifier = da.DisciplineActionIdentifier
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
				ON da.StudentUSI = s.StudentUSI
			-- student in school association
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa 
				ON s.StudentUSI = ssa.StudentUSI
					AND ssa.SchoolId = di.SchoolId
			-- school table
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].School sch 
				ON sch.SchoolId = ssa.SchoolId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].LocalEducationAgency lea 
				ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId

			-- education organization as school
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
				ON sch.SchoolId = edorg.EducationOrganizationId

			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode seaCode 
				ON seaCode.EducationOrganizationId=edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor seaD				
				ON seaD.DescriptorId=seaCode.EducationOrganizationIdentificationSystemDescriptorId
				   AND seaD.CodeValue = 'SEA'

			-- not each Discipline Action can have Discipline Action Discipline, therefore LEFT JOIN on DAD
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineActionDiscipline dad
				ON da.DisciplineActionIdentifier = dad.DisciplineActionIdentifier
					AND dad.StudentUSI=da.StudentUSI
					AND dad.DisciplineDate = da.DisciplineDate
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dd
				ON dad.DisciplineDescriptorId = dd.DescriptorId

			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].DisciplineIncidentBehavior dib
				ON di.IncidentIdentifier = dib.IncidentIdentifier
					AND dib.SchoolId=di.SchoolId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor bd
				ON dib.BehaviorDescriptorId = bd.DescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineIncidentWeapon] diw
				ON diw.IncidentIdentifier = di.IncidentIdentifier AND 
				diw.SchoolId = di.SchoolId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor wd
				ON diw.WeaponDescriptorId = wd.DescriptorId
			
			-- add extension for DisciplineActionDiscipline - (FS007-FS086-FS088)
			--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].DisciplineActionDiscipline extdad
			--	ON extdad.CedsDisciplineActionIdentifier = dad.DisciplineActionIdentifier
			--		AND extdad.StudentUSI=dad.StudentUSI
			--		AND extdad.DisciplineDate = dad.DisciplineDate
			--		AND extdad.DisciplineDescriptorId = dad.DisciplineDescriptorId
			--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor extdd
			--	ON extdd.DescriptorId = extdad.IdeaInterimRemovalReasonDescriptorId
			--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor extddt
			--	ON extddt.DescriptorId = extdad.IdeaInterimRemovalTypeDescriptorId
			--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor extdismethodf
			--	ON extdismethodf.DescriptorId = extdad.DisciplineMethodFirearmDescriptorId
			--LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor extIDEAdismethodf
			--	ON extIDEAdismethodf.DescriptorId = extdad.IDEADisciplineMethodFirearmDescriptorId
			

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.Discipline SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.Discipline) > 0

		----Validate Staging.Discipline----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP13_Discipline', 'Discipline', @SchoolYear


			
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

