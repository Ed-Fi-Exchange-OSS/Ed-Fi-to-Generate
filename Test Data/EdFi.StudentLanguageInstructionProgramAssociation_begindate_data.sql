﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


  update sl
  set BeginDate = '2017-10-01' -- from 2017-08-30
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation] sl
	where StudentUSI >= 20000