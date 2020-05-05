/****** Script for SelectTopNRows command from SSMS  ******/
use EdFi_Sample_ODS_Data_For_Generate
declare @StudentUSI int = 20004 -- add 20000 already

INSERT INTO [edfi].[GeneralStudentProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[EndDate]
           ,[ReasonExitedDescriptorId]
)
SELECT [BeginDate]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,@StudentUSI
      ,[EndDate]
      ,[ReasonExitedDescriptorId]

  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation]
   where [StudentUSI] = 20002 and [ProgramTypeDescriptorId] = 1623


   

INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociation]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[EnglishLearnerParticipation])
SELECT TOP (1000) [BeginDate]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,@StudentUSI
      ,[EnglishLearnerParticipation]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociation]
  where [StudentUSI] = 20002

  /****** Script for SelectTopNRows command from SSMS  ******/
INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[SchoolYear]
           ,[StudentUSI]
           ,[ParticipationDescriptorId]
           ,[ProficiencyDescriptorId]
           ,[ProgressDescriptorId]
           ,[MonitoredDescriptorId]
           ,[CreateDate])
SELECT TOP (1000) [BeginDate]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,[SchoolYear]
      ,@StudentUSI
      ,[ParticipationDescriptorId]
      ,[ProficiencyDescriptorId]
      ,[ProgressDescriptorId]
      ,[MonitoredDescriptorId]
      ,[CreateDate]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment]
  where StudentUSI = 20002

  /****** Script for SelectTopNRows command from SSMS  ******/

INSERT INTO [edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[LanguageInstructionProgramServiceDescriptorId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
           ,[PrimaryIndicator]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           ,[CreateDate])
SELECT TOP (1000) [BeginDate]
      ,[EducationOrganizationId]
      ,[LanguageInstructionProgramServiceDescriptorId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,@StudentUSI
      ,[PrimaryIndicator]
      ,[ServiceBeginDate]
      ,[ServiceEndDate]
      ,[CreateDate]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService]
  where [StudentUSI] = 20002
