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

    
INSERT INTO [edfi].[AssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[MinimumScore]
           ,[MaximumScore]
           ,[CreateDate])
SELECT  [AcademicSubjectDescriptorId]
      ,[AssessedGradeLevelDescriptorId]
	  ,1114
      ,[AssessmentTitle]
      ,[AssessmentVersion]
      ,571
	  ,0
	  ,59
	  ,'2018-06-25 16:57:10.563'
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Assessment]