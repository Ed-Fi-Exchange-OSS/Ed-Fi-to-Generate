-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

DECLARE @AssessmentIdentifer varchar(256)
DECLARE @AcademicSubjectDescriptorId int 
DECLARE @Namespace varchar(1024)
DECLARE @AssessedGradeLevelDescriptorId int
DECLARE @AssessmentCategoryDescriptorId int
DECLARE @LowestAssessedGradeLevelDescriptorId int

DECLARE @AdministrationLanguageDescriptorId INT
DECLARE @StudentUSI  int
DECLARE @AdministrationDate date
DECLARE @AssessmentPeriodDescriptorId int
    

DECLARE @EdFiStudent TABLE (
	StudentUSI int
)

BEGIN TRANSACTION

BEGIN TRY

SELECT @AssessmentPeriodDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentPeriodDescriptor' and CodeValue = 'BOY'

SET @AdministrationDate = '2017-08-25'

SET @AssessmentIdentifer = 'English Language Arts'

SELECT  @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor' and CodeValue = 'English Language Arts'

SET @Namespace = 'uri://ed-fi.org/Assessment'

SELECT @AssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Eighth grade'

SELECT @AssessmentCategoryDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentCategoryDescriptor' and CodeValue = 'State assessment'

SELECT @LowestAssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Fifth grade'


IF NOT EXISTS (SELECT 1 FROM [edfi].[Assessment] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
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
SELECT
		@AssessmentIdentifer
		, @AcademicSubjectDescriptorId -- 'English Language Arts'
		, @AssessedGradeLevelDescriptorId -- Eighth grade
		, @AssessmentIdentifer [AssessmentTitle]
		, 1 [AssessmentVersion]
		, @AssessmentCategoryDescriptorId [AssessmentCategoryDescriptorId] --State assessment
		, @LowestAssessedGradeLevelDescriptorId [LowestAssessedGradeLevelDescriptorId] -- Fifth grade
		, 99 [MaxRawScore]
		, @Namespace 

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPeriod] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
  INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
  SELECT @AssessmentIdentifer
	, @Namespace
	, @AssessmentPeriodDescriptorId
	, '2017-07-01'
	, '2018-05-01'
	, GETDATE()


IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAcademicSubject] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAcademicSubject]
           ([AcademicSubjectDescriptorId]
           ,[AssessmentIdentifier]
           ,[Namespace]
           )
SELECT @AcademicSubjectDescriptorId, @AssessmentIdentifer, @Namespace

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAssessedGradeLevel] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAssessedGradeLevel]
           ([AssessmentIdentifier]
           ,[GradeLevelDescriptorId]
           ,[Namespace]
)
SELECT @AssessmentIdentifer, @AssessedGradeLevelDescriptorId, @Namespace

DECLARE @AssessmentIdentificationSystemDescriptorId int

SET @AssessmentIdentificationSystemDescriptorId = 89 -- State
SELECT @AssessmentIdentificationSystemDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentIdentificationSystemDescriptor' and CodeValue = 'State'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentIdentificationCode] WHERE [AssessmentTitle] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentIdentificationCode]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentIdentificationSystemDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[IdentificationCode]
)
SELECT @AcademicSubjectDescriptorId
		, @AssessedGradeLevelDescriptorId
		, @AssessmentIdentificationSystemDescriptorId
		, @AssessmentIdentifer
		, 1 [AssessmentVersion]
		, @AssessmentIdentifer

DECLARE @AssessmentReportingMethodDescriptorId int
SELECT @AssessmentReportingMethodDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentReportingMethodDescriptor' and CodeValue = 'Scale score'

DECLARE @PerformanceLevelDescriptorId INT
SELECT @PerformanceLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/PerformanceLevelDescriptor' and CodeValue = 'Pass'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPerformanceLevel] WHERE [AssessmentTitle] = @AssessmentIdentifer)
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
SELECT @AcademicSubjectDescriptorId
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, 60 [MinimumScore]
	, 99 [MaximumScore]


-- Student Assessment --

  SELECT @AdministrationLanguageDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageDescriptor' and CodeValue = 'English'

  DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)


  INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationLanguageDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[SchoolYear]
		   ,[Id]
		   , CreateDate
		   , LastModifiedDate
		)
SELECT  @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, s.StudentUSI 
	, @AdministrationLanguageDescriptorId
	, @AssessedGradeLevelDescriptorId
	, 2018
	, NEWID()
	, GETDATE()
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessment] sa
	ON s.StudentUSI = sa.StudentUSI
WHERE sa.StudentUSI IS NULL


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
		   , CreateDate
)
SELECT @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, s.StudentUSI
	, 1 [PerformanceLevelMet]
	, GetDate()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessmentPerformanceLevel] sap
	ON s.StudentUSI = sap.StudentUSI
WHERE sap.StudentUSI IS NULL


-- End of the Reading LA


-- Assessment Mathematics --

SET @AssessmentIdentifer = 'Mathematics'

SELECT @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor' and CodeValue = 'Mathematics'

SET @Namespace = 'uri://ed-fi.org/Assessment'

SELECT @AssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Fourth grade'


SELECT @AssessmentCategoryDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentCategoryDescriptor' and CodeValue = 'State assessment'

SELECT @LowestAssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Fifth grade'


IF NOT EXISTS (SELECT 1 FROM [edfi].[Assessment] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
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
SELECT
		@AssessmentIdentifer
		, @AcademicSubjectDescriptorId -- 
		, @AssessedGradeLevelDescriptorId -- 
		, @AssessmentIdentifer [AssessmentTitle]
		, 1 [AssessmentVersion]
		, @AssessmentCategoryDescriptorId [AssessmentCategoryDescriptorId] --State assessment
		, @LowestAssessedGradeLevelDescriptorId [LowestAssessedGradeLevelDescriptorId] -- 
		, 99 [MaxRawScore]
		, @Namespace 


IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPeriod] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
  INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
  SELECT @AssessmentIdentifer
	, @Namespace
	, @AssessmentPeriodDescriptorId
	, '2017-07-01'
	, '2018-05-01'
	, GETDATE()


IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAcademicSubject] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAcademicSubject]
           ([AcademicSubjectDescriptorId]
           ,[AssessmentIdentifier]
           ,[Namespace]
           )
SELECT @AcademicSubjectDescriptorId, @AssessmentIdentifer, @Namespace

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAssessedGradeLevel] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAssessedGradeLevel]
           ([AssessmentIdentifier]
           ,[GradeLevelDescriptorId]
           ,[Namespace]
)
SELECT @AssessmentIdentifer, @AssessedGradeLevelDescriptorId, @Namespace

--SET @AssessmentIdentificationSystemDescriptorId = 89 -- State
SELECT @AssessmentIdentificationSystemDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentIdentificationSystemDescriptor' and CodeValue = 'State'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentIdentificationCode] WHERE [AssessmentTitle] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentIdentificationCode]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentIdentificationSystemDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[IdentificationCode]
)
SELECT @AcademicSubjectDescriptorId
		, @AssessedGradeLevelDescriptorId
		, @AssessmentIdentificationSystemDescriptorId
		, @AssessmentIdentifer
		, 1 [AssessmentVersion]
		, @AssessmentIdentifer


SELECT @AssessmentReportingMethodDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentReportingMethodDescriptor' and CodeValue = 'Scale score'

SELECT @PerformanceLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/PerformanceLevelDescriptor' and CodeValue = 'Pass'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPerformanceLevel] WHERE [AssessmentTitle] = @AssessmentIdentifer)
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
SELECT @AcademicSubjectDescriptorId
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, 60 [MinimumScore]
	, 99 [MaximumScore]

-- Student Assessment --

  SELECT @AdministrationLanguageDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageDescriptor' and CodeValue = 'English'

  DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)

  INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationLanguageDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[SchoolYear]
		   , Id
		   , CreateDate
		   , LastModifiedDate
		)
SELECT  @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, s.StudentUSI 
	, @AdministrationLanguageDescriptorId
	, @AssessedGradeLevelDescriptorId
	, 2018
	, NEWID()
	, GETDATE()
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessment] sa
	ON s.StudentUSI = sa.StudentUSI
WHERE sa.StudentUSI IS NULL


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
		   , CreateDate
)
SELECT @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, s.StudentUSI
	, 1 [PerformanceLevelMet]
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessmentPerformanceLevel] sap
	ON s.StudentUSI = sap.StudentUSI
WHERE sap.StudentUSI IS NULL



-- Science

SET @AssessmentIdentifer = 'Science'

SELECT @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor' and CodeValue = 'Science'

SELECT @AssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Fourth grade'

SELECT @AssessmentCategoryDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentCategoryDescriptor' and CodeValue = 'State assessment'

SELECT @LowestAssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Fourth grade'


IF NOT EXISTS (SELECT 1 FROM [edfi].[Assessment] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
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
SELECT
		@AssessmentIdentifer
		, @AcademicSubjectDescriptorId -- 
		, @AssessedGradeLevelDescriptorId --
		, @AssessmentIdentifer [AssessmentTitle]
		, 1 [AssessmentVersion]
		, @AssessmentCategoryDescriptorId [AssessmentCategoryDescriptorId] --State assessment
		, @LowestAssessedGradeLevelDescriptorId [LowestAssessedGradeLevelDescriptorId] -- 
		, 99 [MaxRawScore]
		, @Namespace 

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPeriod] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
  INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
  SELECT @AssessmentIdentifer
	, @Namespace
	, @AssessmentPeriodDescriptorId
	, '2017-07-01'
	, '2018-05-01'
	, GETDATE()


IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAcademicSubject] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAcademicSubject]
           ([AcademicSubjectDescriptorId]
           ,[AssessmentIdentifier]
           ,[Namespace]
           )
SELECT @AcademicSubjectDescriptorId, @AssessmentIdentifer, @Namespace

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAssessedGradeLevel] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAssessedGradeLevel]
           ([AssessmentIdentifier]
           ,[GradeLevelDescriptorId]
           ,[Namespace]
)
SELECT @AssessmentIdentifer, @AssessedGradeLevelDescriptorId, @Namespace


SET @AssessmentIdentificationSystemDescriptorId = 89 -- State
SELECT @AssessmentIdentificationSystemDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentIdentificationSystemDescriptor' and CodeValue = 'State'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentIdentificationCode] WHERE [AssessmentTitle] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentIdentificationCode]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentIdentificationSystemDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[IdentificationCode]
)
SELECT @AcademicSubjectDescriptorId
		, @AssessedGradeLevelDescriptorId
		, @AssessmentIdentificationSystemDescriptorId
		, @AssessmentIdentifer
		, 1 [AssessmentVersion]
		, @AssessmentIdentifer


SELECT @AssessmentReportingMethodDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentReportingMethodDescriptor' and CodeValue = 'Scale score'

SELECT @PerformanceLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/PerformanceLevelDescriptor' and CodeValue = 'Pass'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPerformanceLevel] WHERE [AssessmentTitle] = @AssessmentIdentifer)
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
SELECT @AcademicSubjectDescriptorId
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, 60 [MinimumScore]
	, 99 [MaximumScore]



-- Student Assessment --

  SELECT @AdministrationLanguageDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageDescriptor' and CodeValue = 'English'

  DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)


  INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationLanguageDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[SchoolYear]
		   , Id
		   , CreateDate
		   , LastModifiedDate
		)
SELECT  @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, s.StudentUSI 
	, @AdministrationLanguageDescriptorId
	, @AssessedGradeLevelDescriptorId
	, 2018
	, NEWID()
	, GETDATE()
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessment] sa
	ON s.StudentUSI = sa.StudentUSI
WHERE sa.StudentUSI IS NULL


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
		   , CreateDate
)
SELECT @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, s.StudentUSI
	, 1 [PerformanceLevelMet]
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessmentPerformanceLevel] sap
	ON s.StudentUSI = sap.StudentUSI
WHERE sap.StudentUSI IS NULL

-- End of Science

-- Start of CTE

SET @AssessmentIdentifer = 'CTE'

SELECT @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor' and CodeValue = 'Career and Technical Education'

SELECT @AssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Third grade'

SELECT @AssessmentCategoryDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentCategoryDescriptor' and CodeValue = 'State assessment'

SELECT @LowestAssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Third grade'

--select @AcademicSubjectDescriptorId , '@AcademicSubjectDescriptorId'
--select @AssessedGradeLevelDescriptorId, '@AssessedGradeLevelDescriptorId'


IF NOT EXISTS (SELECT 1 FROM [edfi].[Assessment] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
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
SELECT
		@AssessmentIdentifer
		, @AcademicSubjectDescriptorId -- 
		, @AssessedGradeLevelDescriptorId --
		, @AssessmentIdentifer [AssessmentTitle]
		, 1 [AssessmentVersion]
		, @AssessmentCategoryDescriptorId [AssessmentCategoryDescriptorId] --State assessment
		, @LowestAssessedGradeLevelDescriptorId [LowestAssessedGradeLevelDescriptorId] -- 
		, 99 [MaxRawScore]
		, @Namespace 

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPeriod] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
  INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
  SELECT @AssessmentIdentifer
	, @Namespace
	, @AssessmentPeriodDescriptorId
	, '2017-07-01'
	, '2018-05-01'
	, GETDATE()


IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAcademicSubject] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAcademicSubject]
           ([AcademicSubjectDescriptorId]
           ,[AssessmentIdentifier]
           ,[Namespace]
           )
SELECT @AcademicSubjectDescriptorId, @AssessmentIdentifer, @Namespace

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAssessedGradeLevel] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAssessedGradeLevel]
           ([AssessmentIdentifier]
           ,[GradeLevelDescriptorId]
           ,[Namespace]
)
SELECT @AssessmentIdentifer, @AssessedGradeLevelDescriptorId, @Namespace


SET @AssessmentIdentificationSystemDescriptorId = 89 -- State
SELECT @AssessmentIdentificationSystemDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentIdentificationSystemDescriptor' and CodeValue = 'State'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentIdentificationCode] WHERE [AssessmentTitle] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentIdentificationCode]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentIdentificationSystemDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[IdentificationCode]
)
SELECT @AcademicSubjectDescriptorId
		, @AssessedGradeLevelDescriptorId
		, @AssessmentIdentificationSystemDescriptorId
		, @AssessmentIdentifer
		, 1 [AssessmentVersion]
		, @AssessmentIdentifer


SELECT @AssessmentReportingMethodDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentReportingMethodDescriptor' and CodeValue = 'Scale score'

SELECT @PerformanceLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/PerformanceLevelDescriptor' and CodeValue = 'Above Benchmark'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPerformanceLevel] WHERE [AssessmentTitle] = @AssessmentIdentifer)
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
SELECT @AcademicSubjectDescriptorId
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, 60 [MinimumScore]
	, 99 [MaximumScore]



-- Student Assessment --

  SELECT @AdministrationLanguageDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageDescriptor' and CodeValue = 'English'

  DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)


  INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationLanguageDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[SchoolYear]
		   , Id
		   , CreateDate
		   , LastModifiedDate
		)
SELECT  @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, s.StudentUSI 
	, @AdministrationLanguageDescriptorId
	, @AssessedGradeLevelDescriptorId
	, 2018
	, NEWID()
	, GETDATE()
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessment] sa
	ON s.StudentUSI = sa.StudentUSI AND sa.AcademicSubjectDescriptorId = @AcademicSubjectDescriptorId AND sa.AssessmentTitle = @AssessmentIdentifer
		AND sa.AssessedGradeLevelDescriptorId = @AssessedGradeLevelDescriptorId
WHERE sa.StudentUSI IS NULL


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
		   , CreateDate
)
SELECT @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, s.StudentUSI
	, 1 [PerformanceLevelMet]
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessmentPerformanceLevel] sap
	ON s.StudentUSI = sap.StudentUSI AND sap.AcademicSubjectDescriptorId = @AcademicSubjectDescriptorId AND sap.AssessmentTitle = @AssessmentIdentifer
		AND sap.AssessedGradeLevelDescriptorId = @AssessedGradeLevelDescriptorId
WHERE sap.StudentUSI IS NULL

-- End of CTE

-- Start of ESL

SET @AssessmentIdentifer = 'ESL'

SELECT @AcademicSubjectDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AcademicSubjectDescriptor' and CodeValue = 'English as a second language (ESL)'

SELECT @AssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Third grade'

SELECT @AssessmentCategoryDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentCategoryDescriptor' and CodeValue = 'State assessment'

SELECT @LowestAssessedGradeLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/GradeLevelDescriptor' and CodeValue = 'Third grade'

--select @AcademicSubjectDescriptorId , '@AcademicSubjectDescriptorId'
--select @AssessedGradeLevelDescriptorId, '@AssessedGradeLevelDescriptorId'


IF NOT EXISTS (SELECT 1 FROM [edfi].[Assessment] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
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
SELECT
		@AssessmentIdentifer
		, @AcademicSubjectDescriptorId -- 
		, @AssessedGradeLevelDescriptorId --
		, @AssessmentIdentifer [AssessmentTitle]
		, 1 [AssessmentVersion]
		, @AssessmentCategoryDescriptorId [AssessmentCategoryDescriptorId] --State assessment
		, @LowestAssessedGradeLevelDescriptorId [LowestAssessedGradeLevelDescriptorId] -- 
		, 99 [MaxRawScore]
		, @Namespace 

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPeriod] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
  INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
  SELECT @AssessmentIdentifer
	, @Namespace
	, @AssessmentPeriodDescriptorId
	, '2017-07-01'
	, '2018-05-01'
	, GETDATE()


IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAcademicSubject] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAcademicSubject]
           ([AcademicSubjectDescriptorId]
           ,[AssessmentIdentifier]
           ,[Namespace]
           )
SELECT @AcademicSubjectDescriptorId, @AssessmentIdentifer, @Namespace

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentAssessedGradeLevel] WHERE [AssessmentIdentifier] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentAssessedGradeLevel]
           ([AssessmentIdentifier]
           ,[GradeLevelDescriptorId]
           ,[Namespace]
)
SELECT @AssessmentIdentifer, @AssessedGradeLevelDescriptorId, @Namespace


SET @AssessmentIdentificationSystemDescriptorId = 89 -- State
SELECT @AssessmentIdentificationSystemDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentIdentificationSystemDescriptor' and CodeValue = 'State'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentIdentificationCode] WHERE [AssessmentTitle] = @AssessmentIdentifer)
INSERT INTO [edfi].[AssessmentIdentificationCode]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentIdentificationSystemDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[IdentificationCode]
)
SELECT @AcademicSubjectDescriptorId
		, @AssessedGradeLevelDescriptorId
		, @AssessmentIdentificationSystemDescriptorId
		, @AssessmentIdentifer
		, 1 [AssessmentVersion]
		, @AssessmentIdentifer


SELECT @AssessmentReportingMethodDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/AssessmentReportingMethodDescriptor' and CodeValue = 'Scale score'

SELECT @PerformanceLevelDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/PerformanceLevelDescriptor' and CodeValue = 'Above Benchmark'

IF NOT EXISTS (SELECT 1 FROM [edfi].[AssessmentPerformanceLevel] WHERE [AssessmentTitle] = @AssessmentIdentifer)
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
SELECT @AcademicSubjectDescriptorId
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, 60 [MinimumScore]
	, 99 [MaximumScore]



-- Student Assessment --

  SELECT @AdministrationLanguageDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/LanguageDescriptor' and CodeValue = 'English'

  DELETE FROM @EdFiStudent
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)


  INSERT INTO [edfi].[StudentAssessment]
           ([AcademicSubjectDescriptorId]
           ,[AdministrationDate]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[StudentUSI]
           ,[AdministrationLanguageDescriptorId]
           ,[WhenAssessedGradeLevelDescriptorId]
           ,[SchoolYear]
		   , Id
		   , CreateDate
		   , LastModifiedDate
		)
SELECT  @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, s.StudentUSI 
	, @AdministrationLanguageDescriptorId
	, @AssessedGradeLevelDescriptorId
	, 2018
	, NEWID()
	, GETDATE()
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessment] sa
	ON s.StudentUSI = sa.StudentUSI AND sa.AcademicSubjectDescriptorId = @AcademicSubjectDescriptorId AND sa.AssessmentTitle = @AssessmentIdentifer
		AND sa.AssessedGradeLevelDescriptorId = @AssessedGradeLevelDescriptorId
WHERE sa.StudentUSI IS NULL


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
		   , CreateDate
)
SELECT @AcademicSubjectDescriptorId
	, @AdministrationDate
	, @AssessedGradeLevelDescriptorId
	, @AssessmentReportingMethodDescriptorId
	, @AssessmentIdentifer [AssessmentTitle]
	, 1 [AssessmentVersion]
	, @PerformanceLevelDescriptorId
	, s.StudentUSI
	, 1 [PerformanceLevelMet]
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentAssessmentPerformanceLevel] sap
	ON s.StudentUSI = sap.StudentUSI AND sap.AcademicSubjectDescriptorId = @AcademicSubjectDescriptorId AND sap.AssessmentTitle = @AssessmentIdentifer
		AND sap.AssessedGradeLevelDescriptorId = @AssessedGradeLevelDescriptorId
WHERE sap.StudentUSI IS NULL


-- End of SL
UPDATE ap
SET EndDate = '2018-05-01'
FROM [edfi].[AssessmentPeriod] ap

COMMIT

END TRY
BEGIN CATCH  
	ROLLBACK

    SELECT  
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH  