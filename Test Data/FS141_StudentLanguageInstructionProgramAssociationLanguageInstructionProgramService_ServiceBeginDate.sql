-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

  Update sp
  SET  [ServiceBeginDate] = '2017-07-01'
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService] sp
  where StudentUSI = 20002

    update ssa
  Set entrydate = '2017-07-01'
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
where	entrydate = '2017-07-15'
