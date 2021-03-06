﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate


update ssa
set EntryDate = '2017-09-15'
from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma s
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] slep ON slep.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] sa  ON sa.StudentUSI = s.StudentUSI -- for testing CTE only
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentMigrantEducationProgramAssociation] mi ON mi.StudentUSI = s.StudentUSI 
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentNeglectedOrDelinquentProgramAssociation] nord ON nord.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSpecialEducationProgramAssociation] sp ON sp.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentTitleIPartAProgramAssociation] title1 ON title1.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineActionDiscipline] dis ON dis.StudentUSI = s.StudentUSI
		left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON ssa.StudentUSI = s.StudentUSI
		WHERE 
		slep.StudentUSI IS NOT NULL
		OR sa.StudentUSI IS NOT NULL
		OR  mi.StudentUSI IS NOT NULL
		OR nord.StudentUSI IS NOT NULL
		OR sp.StudentUSI IS NOT NULL
		OR title1.StudentUSI IS NOT NULL
		OR dis.StudentUSI IS NOT NULL
	OR ssa.StudentUSI IS NOT NULL


update s
Set DiplomaAwardDate = '2017-10-15'
, DiplomaTypeDescriptorId = 1568 -- Regular Diploma
from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAcademicRecordDiploma s
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] slep ON slep.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] sa  ON sa.StudentUSI = s.StudentUSI -- for testing CTE only
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentMigrantEducationProgramAssociation] mi ON mi.StudentUSI = s.StudentUSI 
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentNeglectedOrDelinquentProgramAssociation] nord ON nord.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSpecialEducationProgramAssociation] sp ON sp.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentTitleIPartAProgramAssociation] title1 ON title1.StudentUSI = s.StudentUSI
		LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineActionDiscipline] dis ON dis.StudentUSI = s.StudentUSI
		left join [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa ON ssa.StudentUSI = s.StudentUSI
		WHERE 
		slep.StudentUSI IS NOT NULL
		OR sa.StudentUSI IS NOT NULL
		OR  mi.StudentUSI IS NOT NULL
		OR nord.StudentUSI IS NOT NULL
		OR sp.StudentUSI IS NOT NULL
		OR title1.StudentUSI IS NOT NULL
		OR dis.StudentUSI IS NOT NULL
	OR ssa.StudentUSI IS NOT NULL
