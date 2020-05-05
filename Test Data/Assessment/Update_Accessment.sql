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