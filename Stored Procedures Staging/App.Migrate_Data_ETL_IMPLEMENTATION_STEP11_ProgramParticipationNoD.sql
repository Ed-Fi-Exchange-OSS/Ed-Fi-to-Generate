-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_ProgramParticipationNorD') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_ProgramParticipationNorD]
END

GO
CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_ProgramParticipationNorD]
	@SchoolYear SMALLINT = NULL
	AS
	BEGIN

		set nocount on;
		
		-- EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_ProgramParticipationNorD] 2018;
	
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

			TRUNCATE TABLE Staging.ProgramParticipationNorD

	-------------------------------------Begin NoD Student Specific Information Section----------------------------------------
	---------------------------------------------------------------------------------------------------------------------
	----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
	----created to work with the data standardized in this location. Do not make any changes to table names or column----
	----names or to any of the code after this section.  The only information that should be modified is the source  ----
	----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
	---------------------------------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------------------------------

			INSERT INTO Staging.ProgramParticipationNorD
				(
				 RecordId 
				,Student_Identifier_State 
				,LEA_Identifier_State 
				,School_Identifier_State 
				,ProgramParticipationBeginDate
				,ProgramParticipationEndDate
				,ProgramParticipationNorD
				,ProgressLevel_Reading
				,ProgressLevel_Math 
				,Outcome
				,DiplomaCredentialAwardDate
				,PersonID 
				,OrganizationID_School 
				,OrganizationID_LEA
				,LEAOrganizationID_Program 
				,SchoolOrganizationID_Program 
				,LEAOrganizationPersonRoleId_Program 
				,SchoolOrganizationPersonRoleId_Program 
				,PersonProgramParticipationID 
				,RunDateTime
				)
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,lea_edorg.EducationOrganizationId	LEA_Identifier_State
				,edorg.EducationOrganizationId School_Identifier_State
				,nod.BeginDate ProgramParticipationBeginDate
				,gspa.EndDate ProgramParticipationEndDate
				,pnod.CodeValue ProgramParticipationNorD
				,dRLA.CodeValue ProgressLevel_Reading		
				,dM.CodeValue ProgressLevel_Math
				,CASE 
					WHEN gedDesc.CodeValue IS NOT NULL THEN 'ENROLLGED'
					WHEN std.CodeValue IS NOT NULL THEN
						CASE WHEN std.CodeValue = 'General Educational Development (GED) credential' THEN 'EARNGED'
							 ELSE 'EARNDIPL'
						END
				--	WHEN dispd.CodeValue IS NOT NULL THEN dispd.CodeValue		-- POSTSEC or OBTAINEMP
				END Outcome
				,sard.DiplomaAwardDate DiplomaCredentialAwardDate
				,NULL PersonID
				,NULL OrganizationID_School
				,NULL OrganizationID_LEA
				,NULL LEAOrganizationID_Program
				,NULL SchoolOrganizationID_Program
				,NULL LEAOrganizationPersonRoleId_Program
				,NULL SchoolOrganizationPersonRoleId_Program
				,NULL PersonProgramParticipationID
				,NULL RunDateTime
			FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s
			-- StudentNeglectedOrDelinquentProgramAssociation
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentNeglectedOrDelinquentProgramAssociation] nod 
				ON s.StudentUSI = nod.StudentUSI

			-- GeneralStudentProgramAssociation for EndDate detection
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] gspa 
				ON gspa.[StudentUSI] = nod.[StudentUSI]
				AND gspa.[EducationOrganizationId] = nod.EducationOrganizationId
				AND gspa.[ProgramName] = nod.ProgramName
				AND gspa.[ProgramEducationOrganizationId] = nod.ProgramEducationOrganizationId
				AND gspa.[BeginDate] = nod.BeginDate
				AND gspa.[ProgramTypeDescriptorId] = nod.ProgramTypeDescriptorId
				AND isnull(gspa.EndDate, GETDATE()) >= App.GetFiscalYearStartDate(@SchoolYear)
				AND gspa.BeginDate <= App.GetFiscalYearEndDate(@SchoolYear)

			-- program type descriptor
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pt 
				ON nod.ProgramTypeDescriptorId = pt.DescriptorId
			-- uri://ed-fi.org/NeglectedOrDelinquentProgramDescriptor
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor pnod 
				ON pnod.DescriptorId = nod.NeglectedOrDelinquentProgramDescriptorId

			-- StudentSchoolAssociation
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] sta
				ON sta.StudentUSI = s.StudentUSI

			-- school education organization
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization edorg 
				ON sta.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] seaCode 
				ON seaCode.EducationOrganizationId = edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] seaD 
				ON seaD.DescriptorId = seaCode.EducationOrganizationIdentificationSystemDescriptorId 
				AND seaD.CodeValue = 'SEA'

			-- LEA education organization
			INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[School] sch
				ON sch.SchoolId = sta.SchoolId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganization lea_edorg 
				ON sch.LocalEducationAgencyId = lea_edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] lea_seaCode 
				ON lea_seaCode.EducationOrganizationId = lea_edorg.EducationOrganizationId
			JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] lea_seaD 
				ON lea_seaD.DescriptorId = lea_seaCode.EducationOrganizationIdentificationSystemDescriptorId 
				AND lea_seaD.CodeValue = 'SEA'

			-- progress level Reading
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dRLA 
				ON dRLA.DescriptorId = nod.ELAProgressLevelDescriptorId
			-- progress level in Math
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dM
				ON dM.DescriptorId = nod.MathematicsProgressLevelDescriptorId

			-- GED Program participation	(covers ENROLLGED outcome)
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentProgramAssociation] ged 
				ON ged.StudentUSI = s.StudentUSI 
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] gedDesc 
				ON gedDesc.DescriptorId = ged.ProgramTypeDescriptorId
				   AND gedDesc.CodeValue = 'District-Funded GED'

			-- detect GED/Non GED Diploma type (covers EARNGED/EARNDIPL outcome)
			-- EARNEGED is if diplomatype = 'General Educational Development (GED) credential'
			-- EARNDIPL - all other cases
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAcademicRecordDiploma] sard 
				ON sard.StudentUSI = s.StudentUSI 
				AND sard.EducationOrganizationId = nod.EducationOrganizationId 
				AND sard.SchoolYear = @SchoolYear
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] std 
				ON std.DescriptorId = sard.DiplomaTypeDescriptorId
			WHERE pt.CodeValue = 'Neglected and Delinquent Program'
	---------------------------------------------------------------------------------------------------------------------
	-------------------------------------End State Specific Information Section------------------------------------------
	---------------------------------------------------------------------------------------------------------------------


		UPDATE Staging.ProgramParticipationNorD SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.ProgramParticipationNorD) > 0

		----Validate Staging.ProgramParticipationCTE----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP11_ProgramParticipationNorD', 'ProgramParticipationNorD', @SchoolYear

		set nocount off;
	END




