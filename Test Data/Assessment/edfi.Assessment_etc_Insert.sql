﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [AcademicSubjectDescriptorId]
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

  declare @AcademicSubjectDescriptorId int = 6
  Update a
  Set [AcademicSubjectDescriptorId] = @AcademicSubjectDescriptorId -- was 4
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment] a

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [AcademicSubjectDescriptorId]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,[MinimumScore]
      ,[MaximumScore]
      ,[ResultDatatypeTypeDescriptorId]
      ,[CreateDate]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[AssessmentPerformanceLevel]

  --INSERT INTO [edfi].[AssessmentPerformanceLevel]
  --         ([AcademicSubjectDescriptorId]
  --         ,[AssessedGradeLevelDescriptorId]
  --         ,[AssessmentReportingMethodDescriptorId]
  --         ,[AssessmentTitle]
  --         ,[AssessmentVersion]
  --         ,[PerformanceLevelDescriptorId]
  --         ,[MinimumScore]
  --         ,[MaximumScore]
  --)
  --select 4 [AcademicSubjectDescriptorId]
  --, 462 [AssessedGradeLevelDescriptorId]
  --, 1114 [AssessmentReportingMethodDescriptorId]
  --, 'STATE Math'
  --, 1 [AssessmentVersion]
  --, 570 [PerformanceLevelDescriptorId]
  --, 60 [MinimumScore]
  --, 99 [MaximumScore]

    Update a
  Set [AcademicSubjectDescriptorId] = @AcademicSubjectDescriptorId
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[AssessmentPerformanceLevel] a

  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[StudentUSI]
      ,[AdministrationEndDate]
      ,[SerialNumber]
      ,[AdministrationLanguageDescriptorId]
      ,[AdministrationEnvironmentDescriptorId]
      ,[RetestIndicatorDescriptorId]
      ,[ReasonNotTestedDescriptorId]
      ,[WhenAssessedGradeLevelDescriptorId]
      ,[EventCircumstanceDescriptorId]
      ,[EventDescription]
      ,[SchoolYear]
      ,[CreateDate]
      ,[LastModifiedDate]
      ,[Id]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment]

--  INSERT INTO [edfi].[StudentAssessment]
--           ([AcademicSubjectDescriptorId]
--           ,[AdministrationDate]
--           ,[AssessedGradeLevelDescriptorId]
--           ,[AssessmentTitle]
--           ,[AssessmentVersion]
--           ,[StudentUSI]
--           ,[AdministrationLanguageDescriptorId]
--		   , Id
--		   , CreateDate
--		   , LastModifiedDate
--		)
--select 4 [AcademicSubjectDescriptorId]
--	, '2017-08-25' [AdministrationDate]
--	, 462 [AssessedGradeLevelDescriptorId]
--	, 'STATE Math' [AssessmentTitle]
--	, 1   [AssessmentVersion]
--	,  7740 [StudentUSI]
--	, 505 [AdministrationLanguageDescriptorId]
--	, '9DB62755-08CB-430C-A44C-06DD78C89CC7'
--	, GetDate()
--	, GetDate()

    Update a
  Set [AcademicSubjectDescriptorId] =@AcademicSubjectDescriptorId
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessment] a

SELECT TOP 1000 [AcademicSubjectDescriptorId]
      ,[AdministrationDate]
      ,[AssessedGradeLevelDescriptorId]
      ,[AssessmentReportingMethodDescriptorId]
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,[PerformanceLevelDescriptorId]
      ,[StudentUSI]
      ,[PerformanceLevelMet]
      ,[CreateDate]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessmentPerformanceLevel]

 -- INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
 --          ([AcademicSubjectDescriptorId]
 --          ,[AdministrationDate]
 --          ,[AssessedGradeLevelDescriptorId]
 --          ,[AssessmentReportingMethodDescriptorId]
 --          ,[AssessmentTitle]
 --          ,[AssessmentVersion]
 --          ,[PerformanceLevelDescriptorId]
 --          ,[StudentUSI]
 --          ,[PerformanceLevelMet]
 --          ,[CreateDate])
 --select 4 [AcademicSubjectDescriptorId]
 --,'2017-08-25' [AdministrationDate]
 --, 462 [AssessedGradeLevelDescriptorId]
 --, 1114 [AssessmentReportingMethodDescriptorId]
 --, 'STATE Math' [AssessmentTitle]
 --, 1 [AssessmentVersion]
 --, 570 [PerformanceLevelDescriptorId]
 --, 7740 [StudentUSI]
 --, 1 [PerformanceLevelMet]
 --, GetDate()

    Update a
  Set [AcademicSubjectDescriptorId] = @AcademicSubjectDescriptorId
    FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessmentPerformanceLevel] a

 select * from edfi.Descriptor
 where Namespace like '%subject%'