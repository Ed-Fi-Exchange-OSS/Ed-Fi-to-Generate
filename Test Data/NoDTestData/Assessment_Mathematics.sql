-INSERT INTO [edfi].[Assessment]
           ([AssessmentIdentifier]
           ,[AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[AssessmentCategoryDescriptorId]
           ,[LowestAssessedGradeLevelDescriptorId]
           ,[MaxRawScore]
           ,[Namespace]
           ,[CreateDate]
           ,[LastModifiedDate]
     )
SELECT 'Mathematics'
	,6
	,464
	, 'State Math'
	,1
	,85
	,464
	,99
	,'uri://ed-fi.org/Assessment'
	,GetDate()
	,GetDate()

INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
select 
'Mathematics'
,'uri://ed-fi.org/Assessment'
,95
,'2017-07-01'
,'2018-08-31'
,GetDate()

