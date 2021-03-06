﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [AssessmentIdentifier]
      ,[AcademicSubjectDescriptorId]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[AssessmentCategoryDescriptorId]
      ,[LowestAssessedGradeLevelDescriptorId]
      ,[AssessmentForm]
      ,[RevisionDate]
      ,[MaxRawScore]
      ,[Nomenclature]
      ,[AssessmentFamily]
      ,[Namespace]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,[Id]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment]

  select * from edfi.Descriptor where Namespace like '%subject%'

  Update [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment]
  Set [AcademicSubjectDescriptorId] = 4
  where [AcademicSubjectDescriptorId] = 6


      Update [EdFi_Sample_ODS_Data_For_Generate].[edfi].[AssessmentPerformanceLevel]
  Set [AcademicSubjectDescriptorId] = 4
  where [AcademicSubjectDescriptorId] = 6

        Update [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]
  Set [AcademicSubjectDescriptorId] = 4
  where [AcademicSubjectDescriptorId] = 6

  --[StudentAssessmentPerformanceLevel]

          Update [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentAssessmentPerformanceLevel
  Set [AcademicSubjectDescriptorId] = 4
  where [AcademicSubjectDescriptorId] = 6