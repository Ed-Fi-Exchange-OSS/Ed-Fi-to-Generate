/***************************************************************
*
*	N or D Participation: This script is for the unit test for N or D Participation: between the Staging and EdFi
*
***************************************************************/		
USE generate 

DECLARE @SchoolYear INT
DECLARE @StagingCount INT, @EdFiCount INT

SET @SchoolYear = 2018

-- Ed-Fi
SELECT @EdFiCount = Count(*) FROM (
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,lea_edorg.EducationOrganizationId	LEA_Identifier_State
				,edorg.EducationOrganizationId School_Identifier_State
				,nod.BeginDate ProgramParticipationBeginDate
				,gspa.EndDate ProgramParticipationEndDate
				,pnod.CodeValue ProgramParticipationNoD
				,dRLA.CodeValue ProgressLevel_Reading		
				,dM.CodeValue ProgressLevel_Math
				,CASE 
					WHEN gedDesc.CodeValue IS NOT NULL THEN 'ENROLLGED'
					WHEN std.CodeValue IS NOT NULL THEN
						CASE WHEN std.CodeValue = 'General Educational Development (GED) credential' THEN 'EARNEGED'
							 ELSE 'EARNDIPL'
						END
					WHEN dispd.CodeValue IS NOT NULL THEN dispd.CodeValue		-- POSTSEC or OBTAINEMP
				END Outcome
				,sard.DiplomaAwardDate DiplomaCredentialAwardDate
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

			-- CedsStudentNoDProgramAssociation (covers POSTSEC and OBTAINEMP otcomes)
			-- Displacement Type
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsStudentNoDProgramAssociation] extnod
				ON nod.[StudentUSI] = extnod.[StudentUSI]
				AND nod.[EducationOrganizationId] = extnod.EducationOrganizationId
				AND nod.[ProgramName] = extnod.ProgramName
				AND nod.[ProgramEducationOrganizationId] = extnod.ProgramEducationOrganizationId
				AND nod.[BeginDate] = extnod.BeginDate
				AND nod.[ProgramTypeDescriptorId] = extnod.ProgramTypeDescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dispd 
				ON dispd.DescriptorId = extnod.DisplacementTypeDescriptorId

			WHERE pt.CodeValue = 'Neglected and Delinquent Program'
) edfi

-- Staging
SELECT @StagingCount = COUNT(*) FROM
(
SELECT DISTINCT staging.[Student_Identifier_State]
FROM [Staging].[ProgramParticipationNoD] staging
JOIN 
(
			SELECT DISTINCT
				 s.StudentUSI RecordId
				,REPLACE(s.StudentUniqueId, ' ', '') Student_Identifier_State
				,lea_edorg.EducationOrganizationId	LEA_Identifier_State
				,edorg.EducationOrganizationId School_Identifier_State
				,nod.BeginDate ProgramParticipationBeginDate
				,gspa.EndDate ProgramParticipationEndDate
				,pnod.CodeValue ProgramParticipationNoD
				,dRLA.CodeValue ProgressLevel_Reading		
				,dM.CodeValue ProgressLevel_Math
				,CASE 
					WHEN gedDesc.CodeValue IS NOT NULL THEN 'ENROLLGED'
					WHEN std.CodeValue IS NOT NULL THEN
						CASE WHEN std.CodeValue = 'General Educational Development (GED) credential' THEN 'EARNEGED'
							 ELSE 'EARNDIPL'
						END
					WHEN dispd.CodeValue IS NOT NULL THEN dispd.CodeValue		-- POSTSEC or OBTAINEMP
				END Outcome
				,sard.DiplomaAwardDate DiplomaCredentialAwardDate
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

			-- CedsStudentNoDProgramAssociation (covers POSTSEC and OBTAINEMP otcomes)
			-- Displacement Type
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsStudentNoDProgramAssociation] extnod
				ON nod.[StudentUSI] = extnod.[StudentUSI]
				AND nod.[EducationOrganizationId] = extnod.EducationOrganizationId
				AND nod.[ProgramName] = extnod.ProgramName
				AND nod.[ProgramEducationOrganizationId] = extnod.ProgramEducationOrganizationId
				AND nod.[BeginDate] = extnod.BeginDate
				AND nod.[ProgramTypeDescriptorId] = extnod.ProgramTypeDescriptorId
			LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor dispd 
				ON dispd.DescriptorId = extnod.DisplacementTypeDescriptorId

			WHERE pt.CodeValue = 'Neglected and Delinquent Program'
) EdFi
ON
	staging.RecordId = edfi.RecordId

) st


PRINT '-----------------------------------------------------'
PRINT 'The Staging N or D Participation : ' + CAST(@StagingCount AS varchar)
PRINT 'The EdFi N or D Participation  : ' + CAST(@EdFiCount AS varchar)
PRINT ''

IF @StagingCount = @EdFiCount 
	PRINT ''' School N or D Participation  : Unit Test To the Staging'' Succeeded'
ELSE
	PRINT ''' School N or D Participation  : Unit Test To the Staging'' Failed'
PRINT ''
-- generate
DECLARE @GenerateCount INT

SELECT @GenerateCount = Count(*)
FROM [ODS].[ProgramParticipationNeglected] ods
JOIN 
(
			SELECT 
				PersonProgramParticipationId
				,neg.[RefNeglectedProgramTypeId]
				,ProgramParticipationBeginDate
				,ProgramParticipationEndDate
			FROM Staging.ProgramParticipationNoD ppn
			JOIN [ODS].[SourceSystemReferenceData] src ON src.InputCode = ppn.ProgramParticipationNoD AND TableName = 'RefNeglectedProgramType' -- TODO Add entries
			JOIN [ODS].[RefNeglectedProgramType] neg ON neg.Code = src.OutputCode
) staging 
	ON  ODS.PersonProgramParticipationId = staging.PersonProgramParticipationId

PRINT '-----------------------------------------------------'
PRINT 'The Staging N or D Participation : ' + CAST(@StagingCount AS varchar)
PRINT 'The Generate N or D Participation : ' + CAST(@GenerateCount AS varchar)
PRINT ''

IF @StagingCount = @GenerateCount 
	PRINT '''School N or D Participation  Unit Test To Generate.ODS'' Succeeded'
ELSE
	PRINT '''School N or D Participation Unit Test To Generate.ODS'' Failed'
PRINT ''