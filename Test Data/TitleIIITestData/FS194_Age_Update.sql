﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [BeginDate]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,[StudentUSI]
      ,[EnglishLearnerParticipation]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation]

  select * from edfi.Student where StudentUniqueId = '020015'

  update s
  Set BirthDate = '2015-08-31' -- 2009-08-31
  from edfi.Student s where StudentUniqueId = '020015'