USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
SELECT 'Science'
	, 'uri://ed-fi.org/Assessment/Assessment.xml'
	, 95 -- (BOY -- Beginning of Year)
	, '2017-07-01'
	, '2018-08-31'
	, GetDate()
GO
INSERT INTO [edfi].[AssessmentPeriod]
           ([AssessmentIdentifier]
           ,[Namespace]
           ,[AssessmentPeriodDescriptorId]
           ,[BeginDate]
           ,[EndDate]
           ,[CreateDate])
SELECT 'English as a second language (ESL)'
	, 'uri://ed-fi.org/Assessment/Assessment.xml'
	, 95 -- (BOY -- Beginning of Year)
	, '2017-07-01'
	, '2018-08-31'
	, GetDate()


