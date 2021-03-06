﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

use EdFi_Sample_ODS_Data_For_Generate

declare @AcademicSubjectDescriptorId int = 16 -- CTE
DECLARE @AssessmentIdentifier varchar(100) = 'Career and Technical Education'
DECLARE @AssessmentTitle varchar(100) = 'Career and Technical Education'
DECLARE @AssessmentNameSpace varchar(100) = 'uri://ed-fi.org/Assessment'
DECLARE @GradeDescriptorId INT = 464 -- 4th grade
DECLARE @LanguageDescriptorId INT = 505 --

  DECLARE @StudenUSI INT = 21631

  IF NOT EXISTS (SELECT 1 FROM [edfi].[Assessment] WHERE [AssessmentIdentifier] =@AssessmentIdentifier )
INSERT INTO [edfi].[Assessment]
           ([AssessmentIdentifier]
           ,[AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[AssessmentCategoryDescriptorId]
           ,[LowestAssessedGradeLevelDescriptorId]
           ,[MaxRawScore]
           ,[Namespace]
	)
SELECT @AssessmentIdentifier
	, @AcademicSubjectDescriptorId
	, 464 -- 4 th Grade
	, @AssessmentTitle
	, 1
	, 85
	, @GradeDescriptorId
	, 99
	, @AssessmentNameSpace

  IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAcademicSubject] WHERE [AssessmentIdentifier] =@AssessmentIdentifier )
INSERT INTO [edfi].[AssessmentAcademicSubject]
           ([AcademicSubjectDescriptorId]
           ,[AssessmentIdentifier]
           ,[Namespace]
           )
SELECT @AcademicSubjectDescriptorId, @AssessmentIdentifier, @AssessmentNameSpace

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPerformanceLevel] WHERE [AssessmentTitle] = @AssessmentTitle )
INSERT INTO [edfi].[AssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[MinimumScore]
           ,[MaximumScore]
           )
SELECT @AcademicSubjectDescriptorId, @GradeDescriptorId, 1114, @AssessmentTitle, 1, 570, 60, 99

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPeriod] WHERE [AssessmentIdentifier] = @AssessmentIdentifier )
INSERT INTO [edfi].[AssessmentPeriod]
           (
		   [AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           )
SELECT @AssessmentIdentifier, @AssessmentNameSpace, 95, '2017-07-01', '2018-08-31'

IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentAssessment] WHERE [StudentUSI] = @StudenUSI AND  [AssessmentTitle] = @AssessmentTitle )
INSERT INTO [edfi].[StudentAssessment]
    (
	[AcademicSubjectDescriptorId]
    ,[AdministrationDate]
    ,[AssessedGradeLevelDescriptorId]
    ,[AssessmentTitle]
    ,[AssessmentVersion]
    ,[StudentUSI]
    ,[AdministrationLanguageDescriptorId]
	, CreateDate
	, LastModifiedDate
	,ID
	)
SELECT @AcademicSubjectDescriptorId, '2017-08-25', @GradeDescriptorId, @AssessmentTitle, 1, @StudenUSI, @LanguageDescriptorId, GetDate(), GetDate(), '9DB62755-08CB-430C-A44C-06DD78C89CC7'


delete from [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentAssessmentPerformanceLevel] where StudentUSI = 21631
INSERT INTO [edfi].[StudentAssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[StudentUSI]
           ,[PerformanceLevelMet]
           ,[CreateDate])

SELECT @AcademicSubjectDescriptorId, '2017-08-25', @GradeDescriptorId, 1114, @AssessmentTitle, 1, 570, @StudenUSI, 1, GetDate()


--INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
--           ([StudentUSI]
--           ,[EducationOrganizationId]
--         --  ,[Id]
--           ,[LastModifiedDate]
--           ,[CreateDate]
--           ,[ProfileThumbnail]
--           ,[HispanicLatinoEthnicity]
--           ,[LimitedEnglishProficiencyDescriptorId]
--           ,[LoginId]
--           ,[SexDescriptorId]
--           ,[OldEthnicityDescriptorId]
--           ,[Discriminator])
--SELECT TOP 1000 [StudentUSI]
--      ,255901001

--      ,[LastModifiedDate]
--      ,[CreateDate]
--      ,[ProfileThumbnail]
--      ,[HispanicLatinoEthnicity]
--      ,[LimitedEnglishProficiencyDescriptorId]
--      ,[LoginId]
--      ,[SexDescriptorId]
--      ,[OldEthnicityDescriptorId]
--      ,[Discriminator]
--  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociation]
--  where StudentUSI = @StudenUSI



IF NOT EXISTS (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationRace] WHERE [StudentUSI] = @StudenUSI  )
	INSERT INTO [edfi].[StudentEducationOrganizationAssociationRace]
           ([EducationOrganizationId]
           ,[StudentUSI]
           ,[CreateDate]
           ,[RaceDescriptorId])
    select 255901001, @StudenUSI, getdate(), 1275

