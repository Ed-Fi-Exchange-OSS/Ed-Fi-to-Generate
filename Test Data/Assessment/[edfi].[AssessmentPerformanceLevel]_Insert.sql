USE [EdFi_Sample_ODS_Data_For_Generate]
GO

--INSERT INTO [edfi].[AssessmentPerformanceLevel]
--           ([AcademicSubjectDescriptorId]
--           ,[AssessedGradeLevelDescriptorId]
--           ,[AssessmentReportingMethodDescriptorId]
--           ,[AssessmentTitle]
--           ,[AssessmentVersion]
--           ,[PerformanceLevelDescriptorId]
--           ,[MinimumScore]
--           ,[MaximumScore]
--           ,[ResultDatatypeTypeDescriptorId]
--           ,[CreateDate])
--SELECT TOP 1 4 [AcademicSubjectDescriptorId] -- English Language Arts
--      , 476 [AssessedGradeLevelDescriptorId] -- Third Grade
--      , 1114 [AssessmentReportingMethodDescriptorId]
--      , 'STATE Reading'[AssessmentTitle]
--      , 1 [AssessmentVersion]
--      , 570 [PerformanceLevelDescriptorId] -- pass
--      , 60 [MinimumScore]
--      , 99 [MaximumScore]
--      , NULL [ResultDatatypeTypeDescriptorId]
--      ,'2018-06-25 16:57:10.563' [CreateDate]
----  FROM [edfi].[AssessmentPerformanceLevel]
--GO

INSERT INTO [edfi].[AssessmentPerformanceLevel]
           ([AcademicSubjectDescriptorId]
           ,[AssessedGradeLevelDescriptorId]
           ,[AssessmentReportingMethodDescriptorId]
           ,[AssessmentTitle]
           ,[AssessmentVersion]
           ,[PerformanceLevelDescriptorId]
           ,[MinimumScore]
           ,[MaximumScore]
           ,[ResultDatatypeTypeDescriptorId]
           ,[CreateDate])
SELECT TOP 1 1 [AcademicSubjectDescriptorId] -- English Language Arts
      , 464 [AssessedGradeLevelDescriptorId] -- Third Grade
      , 1114 [AssessmentReportingMethodDescriptorId]
      , 'STATE Reading'[AssessmentTitle]
      , 1 [AssessmentVersion]
      , 570 [PerformanceLevelDescriptorId] -- pass
      , 60 [MinimumScore]
      , 99 [MaximumScore]
      , NULL [ResultDatatypeTypeDescriptorId]
      ,'2018-06-25 16:57:10.563' [CreateDate]


