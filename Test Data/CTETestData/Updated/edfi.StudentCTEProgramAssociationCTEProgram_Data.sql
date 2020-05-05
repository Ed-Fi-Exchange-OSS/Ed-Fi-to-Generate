USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentCTEProgramAssociationCTEProgram]
           (
		   [StudentUSI]
		  ,[EducationOrganizationId]
		  ,[ProgramName]
		  ,[ProgramEducationOrganizationId]
		  ,[BeginDate]
		  ,[ProgramTypeDescriptorId]
		   

           ,[PrimaryCTEProgramIndicator]
           ,[CTEProgramCompletionIndicator]
           ,[CreateDate]
           ,[CareerPathwayDescriptorId]
		   )
SELECT [StudentUSI]
      ,[EducationOrganizationId]
      ,[ProgramName]
      ,[ProgramEducationOrganizationId]
      ,[BeginDate]
      ,[ProgramTypeDescriptorId]
      ,1
	  ,1
	  ,GetDate()
	  ,811 -- Education and Training
FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation]


GO


