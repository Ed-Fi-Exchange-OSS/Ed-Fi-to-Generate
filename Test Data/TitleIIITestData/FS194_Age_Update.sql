/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [BeginDate]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,[StudentUSI]
      ,[EnglishLearnerParticipation]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation]

  select * from edfi.Student where StudentUniqueId = '020015'

  update s
  Set BirthDate = '2015-08-31' -- 2009-08-31
  from edfi.Student s where StudentUniqueId = '020015'