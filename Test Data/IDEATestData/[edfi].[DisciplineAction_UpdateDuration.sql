/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [DisciplineActionIdentifier]
      ,d.[StudentUSI]
      ,[DisciplineDate]
      ,[DisciplineActionLength]
      ,[ActualDisciplineActionLength]
      ,[RelatedToZeroTolerancePolicy]
      ,[ResponsibilitySchoolId]
      ,[AssignmentSchoolId]
      ,[ReceivedEducationServicesDuringExpulsion]
      ,[IEPPlacementMeetingIndicator]
      ,[DisciplineActionLengthDifferenceReasonDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineAction] d
  join edfi.Student s ON s.StudentUSI = d.StudentUSI
  where s.StudentUniqueId in (
  '003119', '001905', '002428'
  )


Update d
SET [ActualDisciplineActionLength] = 3
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineAction] d
  join edfi.Student s ON s.StudentUSI = d.StudentUSI
  where s.StudentUniqueId in (
  '003119'
  )
  
  Update d
SET [ActualDisciplineActionLength] = 2
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineAction] d
  join edfi.Student s ON s.StudentUSI = d.StudentUSI
  where s.StudentUniqueId in (
 '001905'
  )
  
  Update d
SET [ActualDisciplineActionLength] = 1
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[DisciplineAction] d
  join edfi.Student s ON s.StudentUSI = d.StudentUSI
  where s.StudentUniqueId in (
'002428'
  )
  
