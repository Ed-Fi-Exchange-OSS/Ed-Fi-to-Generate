USE [EdFi_Sample_ODS_Data_For_Generate]
GO

/*********************************************************************************/
/*																				 */
/*		Purpose: Add the assessment data to EdFi 3.1							 */
/*																				 */
/*********************************************************************************/

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
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)

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


GO

/*********************************************************************************/
/*																				 */
/*		Purpose: Add the StudentCharacteristic data to EdFi 3.1					 */
/*																				 */
/*********************************************************************************/



  declare @BeginDate date
  declare @StudentUSI int

    DECLARE @EdfiStudent TABLE (
	StudentUSI int
  )
  INSERT INTO @EdfiStudent VALUES(20000)
  INSERT INTO @EdfiStudent VALUES(20001)
  INSERT INTO @EdfiStudent VALUES(20002)
  INSERT INTO @EdfiStudent VALUES(20003)
  INSERT INTO @EdfiStudent VALUES(20004)

  INSERT INTO @EdfiStudent VALUES(20005)
  INSERT INTO @EdfiStudent VALUES(20006)
  INSERT INTO @EdfiStudent VALUES(20007)
  INSERT INTO @EdfiStudent VALUES(20008)
  INSERT INTO @EdfiStudent VALUES(20009)

  INSERT INTO @EdfiStudent VALUES(20010)
  INSERT INTO @EdfiStudent VALUES(20011)
  INSERT INTO @EdfiStudent VALUES(20012)
  INSERT INTO @EdfiStudent VALUES(20013)
  INSERT INTO @EdfiStudent VALUES(20014)

  SET @BeginDate = '2017-09-01'

  DECLARE @StudentCharacteristicDescriptorId INT
  select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Economic Disadvantaged'

   INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
  SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
  FROM @EdfiStudent s
  LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
  WHERE schar.StudentUSI IS NULL

INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
        ([BeginDate]
        ,[EducationOrganizationId]
        ,[StudentCharacteristicDescriptorId]
        ,[StudentUSI]
        ,[CreateDate])
  SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
  FROM @EdfiStudent s
  LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
  WHERE scharp.StudentUSI IS NULL


-- Foster Care
select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Foster Care'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Parent in Military'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL


select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Migrant'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Homeless'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Displaced Homemaker'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Single Parent'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Pregnant'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

	select @StudentCharacteristicDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' AND CodeValue = 'Immigrant'

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
			([EducationOrganizationId]
			,[StudentCharacteristicDescriptorId]
			,[StudentUSI]
			,[CreateDate])
	SELECT 255901012, @StudentCharacteristicDescriptorId, s.StudentUSI, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] schar
	ON schar.StudentUSI = s.StudentUSI AND schar.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE schar.StudentUSI IS NULL

	INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
		([BeginDate]
		,[EducationOrganizationId]
		,[StudentCharacteristicDescriptorId]
		,[StudentUSI]
		,[CreateDate])
	SELECT @BeginDate
	, 255901012
	, @StudentCharacteristicDescriptorId
	, s.StudentUSI
	, GETDATE()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] scharp
	ON scharp.StudentUSI = s.StudentUSI AND scharp.StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId
	WHERE scharp.StudentUSI IS NULL

	GO

/*********************************************************************************/
/*																				 */
/*		Purpose: Add the StudentCharacteristic data to EdFi 3.1					 */
/*																				 */
/*********************************************************************************/

use EdFi_Sample_ODS_Data_For_Generate

  DECLARE @EdfiStudent TABLE (
	StudentUSI int
  )
  INSERT INTO @EdfiStudent VALUES(20000)
  INSERT INTO @EdfiStudent VALUES(20001)
  INSERT INTO @EdfiStudent VALUES(20002)
  INSERT INTO @EdfiStudent VALUES(20003)
  INSERT INTO @EdfiStudent VALUES(20004)

  declare @DisabilityDescriptorId int
  select @DisabilityDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'AUT'
  --  select  * from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor'

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[CreateDate]
		   )
	SELECT s.StudentUSI, @DisabilityDescriptorId, 255901012, GetDate()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationDisability] disa
		ON disa.StudentUSI = s.StudentUSI and disa.DisabilityDescriptorId = @DisabilityDescriptorId
	WHERE disa.StudentUSI IS NULL

  DELETE FROM @EdfiStudent
  INSERT INTO @EdfiStudent VALUES(20005)
  INSERT INTO @EdfiStudent VALUES(20006)
  INSERT INTO @EdfiStudent VALUES(20007)
  INSERT INTO @EdfiStudent VALUES(20008)
  INSERT INTO @EdfiStudent VALUES(20009)

  SELECT @DisabilityDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'DB'

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[CreateDate]
		   )
	SELECT s.StudentUSI, @DisabilityDescriptorId, 255901012, GetDate()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationDisability] disa
		ON disa.StudentUSI = s.StudentUSI and disa.DisabilityDescriptorId = @DisabilityDescriptorId
	WHERE disa.StudentUSI IS NULL

  DELETE FROM @EdfiStudent
  INSERT INTO @EdfiStudent VALUES(20010)
  INSERT INTO @EdfiStudent VALUES(20011)
  INSERT INTO @EdfiStudent VALUES(20012)
  INSERT INTO @EdfiStudent VALUES(20013)
  INSERT INTO @EdfiStudent VALUES(20014)

  SELECT @DisabilityDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor' AND CodeValue = 'HI'

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[CreateDate]
		   )
	SELECT s.StudentUSI, @DisabilityDescriptorId, 255901012, GetDate()
	FROM @EdfiStudent s
	LEFT JOIN [edfi].[StudentEducationOrganizationAssociationDisability] disa
		ON disa.StudentUSI = s.StudentUSI and disa.DisabilityDescriptorId = @DisabilityDescriptorId
	WHERE disa.StudentUSI IS NULL

GO
/*********************************************************************************/
/*																				 */
/*		Purpose: Add the AcademicSubjectDescriptor data to EdFi 3.1				 */
/*																				 */
/*********************************************************************************/


DECLARE @NameSpace varchar(100), @code varchar(200), @Desc varchar(200), @shortDesc varchar(75)
SELECT @NameSpace = 'uri://ed-fi.org/AcademicSubjectDescriptor', @code = 'English as a second language (ESL)', @Desc = 'English as a second language (ESL)'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


INSERT INTO [edfi].[AcademicSubjectDescriptor]
(
	[AcademicSubjectDescriptorId]
)
SELECT DescriptorId 
FROM [edfi].[Descriptor] D
LEFT JOIN [edfi].[AcademicSubjectDescriptor] cs ON cs.[AcademicSubjectDescriptorId] = d.DescriptorId
WHERE D.Namespace = @NameSpace and D.CodeValue = @code
AND cs.[AcademicSubjectDescriptorId] IS NULL

GO
/*********************************************************************************/
/*																				 */
/*		Purpose: Add the Charter School data to EdFi 3.1				 */
/*																				 */
/*********************************************************************************/
DECLARE @CharterApprovalAgencyTypeDescriptorId INT 
SELECT @CharterApprovalAgencyTypeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Codevalue = 'State board of education'

IF NOT EXISTS (SELECT 1 FROM [extension].[CharterSchoolApprovalAgency] where [CharterApprovalAgencyTypeDescriptorId] = @CharterApprovalAgencyTypeDescriptorId)
INSERT INTO [extension].[CharterSchoolApprovalAgency]
           ([CharterSchoolApprovalAgencyId]
           ,[CharterApprovalAgencyTypeDescriptorId]
)
SELECT 255901, 
		1505 -- State board of education

GO


IF NOT EXISTS (SELECT 1 FROM [extension].[CedsSchool] WHERE [CedsSchoolId] = 255901001)
INSERT INTO [extension].[CedsSchool]
           ([CedsSchoolId]
           ,[CharterSchoolApprovalAgencyId]
		   ,EducationOrgabizationNetworkId
)
select 255901001, 255901, 255901301



	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/NetworkPurposeDescriptor'
		AND edfi.Descriptor.CodeValue = 'CharterSchoolManagement')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/NetworkPurposeDescriptor'
			  ,'CharterSchoolManagement'
			  ,'CharterSchoolManagement'
			  ,'CharterSchoolManagement'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'e5965618-41a0-4eba-ad90-afd09dde1c46'
			  ,'1/31/2019 17:10'
			  ,'1/31/2019 17:10'
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/NetworkPurposeDescriptor'
		AND edfi.Descriptor.CodeValue = 'CharterSchoolApproval')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			--  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/NetworkPurposeDescriptor'
			  ,'CharterSchoolApproval'
			  ,'Charter School Approval Agency'
			  ,'Charter School Approval Agency'
			  ,NULL
			  ,NULL
			  ,NULL
			--  ,'e5965618-41a0-4eba-ad90-afd09dde1c46'
			  ,'1/31/2019 17:10'
			  ,'1/31/2019 17:10'
		)
	END

  DECLARE @NetworkPurposeDescriptorId int 
  SELECT @NetworkPurposeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE CodeValue = 'CharterSchoolApproval'


  IF NOT EXISTS (SELECT 1 FROM [edfi].[NetworkPurposeDescriptor] WHERE [NetworkPurposeDescriptorId] = @NetworkPurposeDescriptorId)
	INSERT INTO [edfi].[NetworkPurposeDescriptor] ([NetworkPurposeDescriptorId]) 
		SELECT @NetworkPurposeDescriptorId


  IF NOT EXISTS (SELECT 1 FROM [edfi].[EducationOrganizationNetwork] WHERE [NetworkPurposeDescriptorId] = @NetworkPurposeDescriptorId)
	INSERT INTO [edfi].[EducationOrganizationNetwork]
           ([EducationOrganizationNetworkId]
           ,[NetworkPurposeDescriptorId])
     VALUES
           (255901
           ,@NetworkPurposeDescriptorId)


	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor'
		AND edfi.Descriptor.CodeValue = 'IRS - EIN')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor'
			  ,'IRS - EIN'
			  ,'IRS - EIN'
			  ,'IRS - EIN'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'64f99924-7161-4014-a2c6-1179322fcfac'
			  ,'1/31/2019 17:13'
			  ,'1/31/2019 17:13'
		)
	END



	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/001650'
		AND edfi.Descriptor.CodeValue = 'CMO')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/001650'
			  ,'CMO'
			  ,'Charter Management Organization'
			  ,'Charter Management Organization'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'6ae63648-a697-4830-979e-85935981a548'
			  ,'1/31/2019 17:16'
			  ,'1/31/2019 17:16'
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/001650'
		AND edfi.Descriptor.CodeValue = 'EMO')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/001650'
			  ,'EMO'
			  ,'Education Management Organization'
			  ,'Education Management Organization'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'67eac73a-c1fd-46af-8134-acdae15493fd'
			  ,'1/31/2019 17:16'
			  ,'1/31/2019 17:16'
		)
	END

	IF NOT EXISTS (SELECT * FROM edfi.Descriptor WHERE edfi.Descriptor.Namespace = 'https://ceds.ed.gov/element/001650'
		AND edfi.Descriptor.CodeValue = 'Other')
	BEGIN
		INSERT INTO edfi.Descriptor (
			   [Namespace]
			  ,[CodeValue]
			  ,[ShortDescription]
			  ,[Description]
			  ,[PriorDescriptorId]
			  ,[EffectiveBeginDate]
			  ,[EffectiveEndDate]
			  ,[Id]
			  ,[LastModifiedDate]
			  ,[CreateDate]
			  )
		VALUES (
			   'https://ceds.ed.gov/element/001650'
			  ,'Other'
			  ,'Other Management Organization'
			  ,'Other Management Organization'
			  ,NULL
			  ,NULL
			  ,NULL
			  ,'35ecb648-cad3-4da5-9876-aa7e0157866e'
			  ,'1/31/2019 17:16'
			  ,'1/31/2019 17:16'
		)
	END

	-- Add new organization
	-- detect Charter Schools Management organization
	DECLARE @CharterSchoolManagement TABLE (EducationOrganizationId INT)
	INSERT @CharterSchoolManagement 
	SELECT edorg.EducationOrganizationId
	FROM edfi.EducationOrganization edorg
	INNER JOIN edfi.EducationOrganizationNetwork edorgnet on edorgnet.EducationOrganizationNetworkId=edorg.EducationOrganizationId
	INNER JOIN extension.EducationOrganizationNetworkExtension edorgnetExt on edorgnetExt.EducationOrganizationNetworkId=edorg.EducationOrganizationId
	INNER JOIN edfi.Descriptor npd ON npd.DescriptorId = edorgnet.NetworkPurposeDescriptorId
	INNER JOIN edfi.Descriptor csmorg ON csmorg.DescriptorId=edorgnetExt.CharterSchoolManagementOrganizationTypeDescriptorId
	JOIN [edfi].EducationOrganizationIdentificationCode edorgcodecs 
		ON edorgcodecs.EducationOrganizationId=edorg.EducationOrganizationId
	JOIN [edfi].Descriptor edorgidsdcs 
		ON edorgcodecs.EducationOrganizationIdentificationSystemDescriptorId = edorgidsdcs.DescriptorId
	WHERE edorgidsdcs.CodeValue = 'IRS - EIN' 
		AND npd.CodeValue = 'CharterSchoolManagement'

	-- declare new descriptors
	DECLARE @OrganizationId INT, 
--		@NetworkPurposeDescriptorId INT, 
		@CharterSchoolManagementOrganizationTypeDescriptorId_1 INT, 
		@CharterSchoolManagementOrganizationTypeDescriptorId_2 INT,
		@CharterSchoolManagementOrganizationTypeDescriptorId_3 INT,
		@OperationalStatus INT, @EducationOrganizationIdentificationSystemDescriptorId INT,
		@AddressTypeDescriptorId INT, @StateAbbreviationDescriptorId INT

	SET @OrganizationId = 255901301
	SET @OperationalStatus = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/OperationalStatusDescriptor%' AND CodeValue='Active')

	SET @NetworkPurposeDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/NetworkPurposeDescriptor%' AND CodeValue='CharterSchoolManagement')

	SET @EducationOrganizationIdentificationSystemDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like '%uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor%' AND CodeValue='IRS - EIN')

	SET @CharterSchoolManagementOrganizationTypeDescriptorId_1 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'https://ceds.ed.gov/element/001650' AND CodeValue='CMO')
	SET @CharterSchoolManagementOrganizationTypeDescriptorId_2 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'https://ceds.ed.gov/element/001650' AND CodeValue='EMO')
	SET @CharterSchoolManagementOrganizationTypeDescriptorId_3 = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'https://ceds.ed.gov/element/001650' AND CodeValue='Other')
	SET @AddressTypeDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'uri://ed-fi.org/AddressTypeDescriptor' AND CodeValue='Physical')
	SET @StateAbbreviationDescriptorId = (SELECT edfi.Descriptor.DescriptorId FROM [edfi].[Descriptor] 
		WHERE Namespace like 'uri://ed-fi.org/StateAbbreviationDescriptor' AND CodeValue='TX')

	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationIdentificationSystemDescriptor 
		WHERE edfi.EducationOrganizationIdentificationSystemDescriptor.EducationOrganizationIdentificationSystemDescriptorId = @EducationOrganizationIdentificationSystemDescriptorId)
	BEGIN
		INSERT INTO edfi.EducationOrganizationIdentificationSystemDescriptor (EducationOrganizationIdentificationSystemDescriptorId)
		VALUES (@EducationOrganizationIdentificationSystemDescriptorId)
	END

	IF NOT EXISTS (SELECT * FROM extension.CharterSchoolManagementOrganizationTypeDescriptor 
		WHERE extension.CharterSchoolManagementOrganizationTypeDescriptor.CharterSchoolManagementOrganizationTypeDescriptorId = @CharterSchoolManagementOrganizationTypeDescriptorId_1)
	BEGIN
		INSERT INTO extension.CharterSchoolManagementOrganizationTypeDescriptor (CharterSchoolManagementOrganizationTypeDescriptorId)
		VALUES (@CharterSchoolManagementOrganizationTypeDescriptorId_1)
	END

	IF NOT EXISTS (SELECT * FROM edfi.NetworkPurposeDescriptor 
		WHERE edfi.NetworkPurposeDescriptor.NetworkPurposeDescriptorId = @NetworkPurposeDescriptorId)
	BEGIN
		INSERT INTO edfi.NetworkPurposeDescriptor (NetworkPurposeDescriptorId)
		VALUES (@NetworkPurposeDescriptorId)
	END

	-- delete from EducationOrganization address
	DELETE FROM edfi.EducationOrganizationAddress
	WHERE edfi.EducationOrganizationAddress.EducationOrganizationId in (
	SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)


	-- delete from EducationOrganization
	DELETE FROM edfi.EducationOrganization
	WHERE edfi.EducationOrganization.EducationOrganizationId in (
	SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)

	-- delete from EducationOrganizationIdentificationCode
	DELETE FROM edfi.EducationOrganizationIdentificationCode
		WHERE EducationOrganizationId IN (SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)

	-- delete from EducationOrganizationNetwork
	DELETE FROM edfi.EducationOrganizationNetwork
		WHERE edfi.EducationOrganizationNetwork.EducationOrganizationNetworkId in (
		SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)

	-- delete from extension.EducationOrganizationNetworkExtension
	DELETE FROM extension.EducationOrganizationNetworkExtension
		WHERE extension.EducationOrganizationNetworkExtension.EducationOrganizationNetworkId in (
		SELECT cs.EducationOrganizationId FROM @CharterSchoolManagement cs)
		
	-- start inserting test data
	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganization WHERE EducationOrganizationId = @OrganizationId)
	INSERT INTO edfi.EducationOrganization (
		 [EducationOrganizationId]
		,[NameOfInstitution]
		,[ShortNameOfInstitution]
		,[WebSite]
		,[Id]
		,[LastModifiedDate]
		,[CreateDate]
		,[OperationalStatusDescriptorId]
		,[Discriminator]
		)
	VALUES (
		@OrganizationId
		, 'Test CS Management Organization'
		, 'TCS MNGMT'
		, 'http://www.NISD.edu/MNGMT/'
		, 'ed199c03-a983-4f50-bd9c-9adc4613b187'
		, '2018-06-25 16:57'
		, '2018-06-25 16:57'
		, @OperationalStatus
		, 'edfi.Management'
		)

	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationNetwork WHERE [EducationOrganizationNetworkId] =  @OrganizationId)
	INSERT INTO edfi.EducationOrganizationNetwork (
		[EducationOrganizationNetworkId]
		,NetworkPurposeDescriptorId
		)
	VALUES (
		@OrganizationId
		, @NetworkPurposeDescriptorId
		)

	-- select * from extension.EducationOrganizationNetworkExtension
	IF NOT EXISTS (SELECT * FROM extension.EducationOrganizationNetworkExtension WHERE EducationOrganizationNetworkId=@OrganizationId)
	INSERT INTO extension.EducationOrganizationNetworkExtension (
		[EducationOrganizationNetworkId]
		,[CharterSchoolManagementOrganizationTypeDescriptorId]
		, [CreateDate]
		)
	VALUES (
		@OrganizationId
		, @CharterSchoolManagementOrganizationTypeDescriptorId_1
		, GETDATE()
		)

	-- EducationOrganizationIdentificationCode
	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationIdentificationCode 
		WHERE [EducationOrganizationId]=@OrganizationId
		AND [EducationOrganizationIdentificationSystemDescriptorId] =  @EducationOrganizationIdentificationSystemDescriptorId)
	INSERT INTO edfi.EducationOrganizationIdentificationCode (
		 [EducationOrganizationId]
		,[IdentificationCode]
		,[CreateDate]
		,[EducationOrganizationIdentificationSystemDescriptorId]
		)
	VALUES
		(
		 @OrganizationId
		,@OrganizationId
		,'2018-06-25 16:57'
		,@EducationOrganizationIdentificationSystemDescriptorId
		)

	-- address
	IF NOT EXISTS (SELECT * FROM edfi.EducationOrganizationAddress WHERE [EducationOrganizationId]=@OrganizationId)
	INSERT INTO edfi.EducationOrganizationAddress (
		 [EducationOrganizationId]
		,[StreetNumberName]
		,[City]
		,[PostalCode]
		,[NameOfCounty]
		,[CreateDate]
		,[AddressTypeDescriptorId]
		,[StateAbbreviationDescriptorId]
		)
	VALUES (
		@OrganizationId
		, '1000 Hickory Lane'
		, 'Northridge'
		, '77535'
		, 'Travis'
		, '2018-06-25 16:57'
		, @AddressTypeDescriptorId
		, @StateAbbreviationDescriptorId
	)

IF NOT EXISTS(SELECT 1 FROM [edfi].[EducationOrganizationNetwork] WHERE [EducationOrganizationNetworkId] = 255901001)
  INSERT INTO [edfi].[EducationOrganizationNetwork]
           ([EducationOrganizationNetworkId]
           ,[NetworkPurposeDescriptorId])
     VALUES
           (255901001
           ,4010)

IF NOT EXISTS(SELECT 1 FROM [extension].[EducationOrganizationNetworkExtension] WHERE [EducationOrganizationNetworkId] = 255901001)
  INSERT INTO [extension].[EducationOrganizationNetworkExtension]
           ([EducationOrganizationNetworkId]
           ,[CharterSchoolManagementOrganizationTypeDescriptorId]
           ,[CreateDate])
     VALUES
           (255901001
           ,4012
           ,GetDate())


  Update [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchool]
  Set [EducationOrgabizationNetworkId] = 255901001
  where [CedsSchoolId] = 255901001


IF NOT EXISTS( SELECT 1 FROM [extension].[CharterContract] WHERE [ContractIdentifier] ='Charter 1')
INSERT INTO [extension].[CharterContract]
           ([ContractIdentifier]
           ,[ApprovalDate]
           ,[RenewalDate]
)
SELECT 'Charter 1', '08/01/2017', '09/15/2018'
GO


  UPDATE  [extension].[CedsSchool]
  Set [ContractIdentifier] = 'Charter 1'
  WHERE [CedsSchoolId] = 255901001
GO


/*********************************************************************************/
/*																				 */
/*		Purpose: Add the CTE Assessment data to EdFi 3.1							 */
/*																				 */
/*********************************************************************************/


DECLARE @EdFiStudent TABLE
(
	StudentUSI int
)

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

  DECLARE @BeginDate Date 
  DECLARE @EducationOrganizationId int
  DECLARE @ProgramName varchar(128)
  DECLARE @ProgramTypeDescriptorId int
  DECLARE @CreateDate date

  SET @BeginDate = '2010-08-30'
  SET @EducationOrganizationId = 255901
  SET @ProgramName = 'Career and Technical Education'
  SET @CreateDate = GetDate()

  SELECT @ProgramTypeDescriptorId = DescriptorId FROM edfi.Descriptor where Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor' AND CodeValue = 'Career and Technical Education'

  BEGIN TRY

	BEGIN TRANSACTION
INSERT INTO [edfi].[GeneralStudentProgramAssociation]
    (
	[BeginDate]
    ,[EducationOrganizationId]
    ,[ProgramEducationOrganizationId]
    ,[ProgramName]
    ,[ProgramTypeDescriptorId]
    ,[StudentUSI]
    ,[EndDate]
    ,[ReasonExitedDescriptorId]
    ,[CreateDate]
    ,[LastModifiedDate]
    )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, NULL [EndDate]
	, NULL [ReasonExitedDescriptorId]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [edfi].[GeneralStudentProgramAssociation] ga
	ON ga.StudentUSI = s.StudentUSI AND ga.BeginDate = @BeginDate AND ga.EducationOrganizationId = @EducationOrganizationId
	AND ga.ProgramEducationOrganizationId = @EducationOrganizationId AND ga.ProgramName = @ProgramName
	AND ga.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ga.StudentUSI IS NULL

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

INSERT INTO [edfi].[StudentCTEProgramAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[ProgramTypeDescriptorId]
           ,[NonTraditionalGenderStatus]
			)
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @ProgramName
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @BeginDate
	, @ProgramTypeDescriptorId
	, 1 [NonTraditionalGenderStatus]
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentCTEProgramAssociation] cte
	ON cte.StudentUSI = s.StudentUSI AND cte.BeginDate = @BeginDate AND cte.EducationOrganizationId = @EducationOrganizationId
	AND cte.ProgramEducationOrganizationId = @EducationOrganizationId AND cte.ProgramName = @ProgramName
	AND cte.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE cte.StudentUSI IS NULL	

declare @ServiceDescriptorId int
select @ServiceDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/ServiceDescriptor' and CodeValue = 'Assistive technology device or service'

declare @ServiceBeginDate date
set @ServiceBeginDate = '2017-10-01'

INSERT INTO [edfi].[StudentCTEProgramAssociationService]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[ServiceDescriptorId]
           ,[StudentUSI]
           ,[PrimaryIndicator]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate])
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, @ServiceDescriptorId
	, s.StudentUSI
	, NULL [PrimaryIndicator]
	, @ServiceBeginDate
	, NULL [ServiceEndDate]
	, GETDATE()
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentCTEProgramAssociationService] cte
	ON cte.StudentUSI = s.StudentUSI AND cte.BeginDate = @BeginDate AND cte.EducationOrganizationId = @EducationOrganizationId
	AND cte.ProgramEducationOrganizationId = @EducationOrganizationId AND cte.ProgramName = @ProgramName
	AND cte.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE cte.StudentUSI IS NULL	


DELETE FROM @EdFiStudent

INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)

DECLARE @DisplacementTypeDescriptorId int
SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'ADVTRAIN'
--SELECT * from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' 
DELETE FROM @EdFiStudent

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)

  DECLARE @PerkinsLEPStatusDescriptorId INT
  SELECT @PerkinsLEPStatusDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'https://ceds.ed.gov/element/000581' AND CodeValue = 'LEPP'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
		   ,[PerkinsLEPStatusDescriptorId]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @PerkinsLEPStatusDescriptorId
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

DECLARE @CareerPathwayDescriptorId int
SELECT @CareerPathwayDescriptorId = DescriptorId from edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/CareerPathwayDescriptor' and CodeValue = 'Education and Training'

INSERT INTO [edfi].[StudentCTEProgramAssociationCTEProgram]
           (
		   [StudentUSI]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[CTEProgramCompletionIndicator]
           ,[ProgramName]
           ,[EducationOrganizationId]
           ,[CreateDate]
           ,[CareerPathwayDescriptorId]
           ,[ProgramTypeDescriptorId]
		   )
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @BeginDate
	, 1 [CTEProgramCompletionIndicator]
	, @ProgramName
	, @EducationOrganizationId
	, GETDATE()
	, @CareerPathwayDescriptorId
	, @ProgramTypeDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentCTEProgramAssociationCTEProgram] ctecte
	ON ctecte.StudentUSI = s.StudentUSI
		AND ctecte.BeginDate = @BeginDate AND ctecte.ProgramName = @ProgramName AND ctecte.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ctecte.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ctecte.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20003)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20004)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20005)

SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'EMPLOYMENT'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20006)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20007)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20008)
SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'MILITARY'


INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20009)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20010)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20011)

SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'OBTAINEMP'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20012)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20013)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20014)
SELECT @DisplacementTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' AND CodeValue = 'POSTSEC'

INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[DisplacementTypeDescriptorId]
           ,[AdvancedTrainingEnrollmentDate]
           ,[CteParticipant]
           ,[CteConcentrator]
           ,[CreateDate]
           ,[LastModifiedDate]
           )
SELECT @BeginDate
	, @EducationOrganizationId
	, @EducationOrganizationId [ProgramEducationOrganizationId]
	, @ProgramName
	, @ProgramTypeDescriptorId
	, s.StudentUSI
	, @DisplacementTypeDescriptorId
	, NULL [AdvancedTrainingEnrollmentDate]
	, 1 [CteParticipant]
	, 1 [CteConcentrator]
	, @CreateDate
	, @CreateDate
FROM @EdfiStudent s
LEFT JOIN [extension].[CedsStudentCTEProgramAssociation] ext
	ON ext.StudentUSI = s.StudentUSI
		AND ext.BeginDate = @BeginDate AND ext.ProgramName = @ProgramName AND ext.ProgramEducationOrganizationId = @EducationOrganizationId
		AND ext.ProgramTypeDescriptorId = @ProgramTypeDescriptorId
WHERE ext.StudentUSI IS NULL

-- LEP
DECLARE @LimitedEnglishProficiencyDescriptorId int
DECLARE @SexDescriptorId int

DELETE FROM @EdFiStudent

  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20000)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20001)
  INSERT INTO @EdFiStudent (StudentUSI) VALUES(20002)
SELECT @LimitedEnglishProficiencyDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/LimitedEnglishProficiencyDescriptor' AND CodeValue = 'Limited'
SELECT @SexDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/SexDescriptor' AND CodeValue = 'Male'

INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[LastModifiedDate]
           ,[CreateDate]
           ,[HispanicLatinoEthnicity]
           ,[LimitedEnglishProficiencyDescriptorId]
           ,[SexDescriptorId]
		)
SELECT s.StudentUSI
	, @EducationOrganizationId
	, @CreateDate
	, @CreateDate
	, 0 [HispanicLatinoEthnicity]
	, @LimitedEnglishProficiencyDescriptorId
	, @SexDescriptorId
FROM @EdfiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociation] sa
	ON sa.StudentUSI = s.StudentUSI
		AND sa.EducationOrganizationId = @EducationOrganizationId
WHERE sa.StudentUSI IS NULL

-- Correction

		select @sexdescriptorid = DescriptorId from EdFi_Sample_ODS_Data_For_Generate.edfi.Descriptor where Namespace = 'uri://ed-fi.org/SexDescriptor' and CodeValue = 'Female'

		Update sa
		Set SexDescriptorId = @sexdescriptorid
		FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociation sa
		where StudentUSI = 20001 

	DECLARE @ExitWithdrawTypeDescriptorId int
	select @ExitWithdrawTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/ExitWithdrawTypeDescriptor' AND CodeValue = 'Completed'

	Update ssa
	SET ExitWithdrawTypeDescriptorId = @ExitWithdrawTypeDescriptorId
	from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentSchoolAssociation ssa
	Where StudentUSI = 20002

	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
	SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH

GO
/*********************************************************************************/
/*																				 */
/*		Purpose: Add the StudentEducationOrganizationAssociationLanguageUse      */
/*               data to EdFi 3.1												 */
/*																				 */
/*********************************************************************************/


  DECLARE @LanguageDescriptorId int
  DECLARE @EducationOrganizationId int
  DECLARE @LanguageUseDescriptorId int

	select @LanguageDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/LanguageDescriptor' AND CodeValue = 'Spanish'

	select @LanguageUseDescriptorId = DescriptorId from edfi.Descriptor where Namespace = 'uri://ed-fi.org/LanguageUseDescriptor' AND CodeValue = 'Native language'

SET @EducationOrganizationId = 255901012

BEGIN TRANSACTION

BEGIN TRY


DECLARE @EdFiStudent TABLE
(
	StudentUSI int
)
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

  INSERT INTO [edfi].[StudentEducationOrganizationAssociationLanguage]
           ([EducationOrganizationId]
           ,[LanguageDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT @EducationOrganizationId
	, @LanguageDescriptorId
	, s.StudentUSI
	, GETDATE()
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociationLanguage] l
	ON l.StudentUSI = s.StudentUSI and l.LanguageDescriptorId = @LanguageDescriptorId AND l.EducationOrganizationId = @EducationOrganizationId
WHERE l.StudentUSI  IS NULL


  INSERT INTO [edfi].[StudentEducationOrganizationAssociationLanguageUse]
           ([EducationOrganizationId]
           ,[LanguageDescriptorId]
           ,[StudentUSI]
           ,[CreateDate]
           ,[LanguageUseDescriptorId])
SELECT @EducationOrganizationId
	, @LanguageDescriptorId
	, s.StudentUSI
	, GETDATE()
	, @LanguageUseDescriptorId
FROM @EdFiStudent s
LEFT JOIN [edfi].[StudentEducationOrganizationAssociationLanguageUse] l
	ON l.StudentUSI = s.StudentUSI AND l.EducationOrganizationId = @EducationOrganizationId
	and l.LanguageDescriptorId = @LanguageDescriptorId AND l.LanguageUseDescriptorId = @LanguageUseDescriptorId
WHERE l.StudentUSI  IS NULL


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


 declare @ExitWithdrawTypeDescriptorId int
 select @ExitWithdrawTypeDescriptorId = DescriptorId from edfi.Descriptor where Namespace like '%uri://ed-fi.org/ExitWithdrawTypeDescriptor%' and CodeValue ='Graduated'

 Update ssa
 Set [ExitWithdrawTypeDescriptorId] = @ExitWithdrawTypeDescriptorId
 FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSchoolAssociation] ssa
 where StudentUSI between 20000 and 20005

 GO

declare @StudentCharacteristicDescriptorId int
select @StudentCharacteristicDescriptorId = DescriptorId  from edfi.Descriptor where Namespace like '%uri://ed-fi.org/StudentCharacteristicDescriptor%' and CodeValue ='Economic Disadvantaged'

DECLARE @StudentUSI int
SET @StudentUSI = 21631

IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE StudentUSI = @StudentUSI AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT 255901, @StudentCharacteristicDescriptorId, @StudentUSI, GetDate()



select @StudentCharacteristicDescriptorId = DescriptorId  from edfi.Descriptor where Namespace like '%uri://ed-fi.org/StudentCharacteristicDescriptor%' and CodeValue ='Displaced Homemaker'

IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE StudentUSI = @StudentUSI AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT 255901, @StudentCharacteristicDescriptorId, @StudentUSI, GetDate()

select @StudentCharacteristicDescriptorId = DescriptorId  from edfi.Descriptor where Namespace like '%uri://ed-fi.org/StudentCharacteristicDescriptor%' and CodeValue ='Displaced Homemaker'

IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE StudentUSI = @StudentUSI AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT 255901, @StudentCharacteristicDescriptorId, @StudentUSI, GetDate()


select @StudentCharacteristicDescriptorId = DescriptorId  from edfi.Descriptor where Namespace like '%uri://ed-fi.org/StudentCharacteristicDescriptor%' and CodeValue ='Single Parent'

IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE StudentUSI = @StudentUSI AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT 255901, @StudentCharacteristicDescriptorId, @StudentUSI, GetDate()


Declare @DisabilityDescriptorId int
select @DisabilityDescriptorId = DescriptorId  from edfi.Descriptor where Namespace = 'uri://ed-fi.org/DisabilityDescriptor' and CodeValue ='AUT'

IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE StudentUSI = @StudentUSI AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           ([DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[StudentUSI])
select @DisabilityDescriptorId -- AUT
,255901
, @StudentUSI

select @StudentCharacteristicDescriptorId = DescriptorId  from edfi.Descriptor where Namespace = 'uri://ed-fi.org/StudentCharacteristicDescriptor' and CodeValue ='Immigrant'

IF NOT EXISTS(SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] WHERE StudentUSI = @StudentUSI AND StudentCharacteristicDescriptorId = @StudentCharacteristicDescriptorId)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           )
SELECT 
255901
,@StudentCharacteristicDescriptorId
,@StudentUSI
GO





