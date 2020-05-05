/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [StudentUSI]
      ,[EducationOrganizationId]
      ,[ProgramName]
      ,[ProgramEducationOrganizationId]
      ,[BeginDate]
      ,[ProgramTypeDescriptorId]
      ,[NonTraditionalGenderStatus]
      ,[PrivateCTEProgram]
      ,[TechnicalSkillsAssessmentDescriptorId]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation]

  INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           (
		   [StudentUSI]
		   ,[EducationOrganizationId]
		   ,[ProgramName]
		   ,[ProgramEducationOrganizationId]
		   ,[BeginDate]
           ,[ProgramTypeDescriptorId]
           ,[CteParticipant]
           ,[CteConcentrator]
)

SELECT  [StudentUSI]
      ,[EducationOrganizationId]
      ,[ProgramName]
      ,[ProgramEducationOrganizationId]
      ,[BeginDate]
      ,[ProgramTypeDescriptorId]
	, 1
	, 1
 FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation]