USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentMigrantEducationProgramAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
		   ,[ProgramEducationOrganizationId]
           ,[ProgramName] 
		   ,[ProgramTypeDescriptorId]
           ,[BeginDate]
		   ,PriorityForServices
		   ,LastQualifyingMove
           ,[ContinuationOfServicesReasonDescriptorId]
           )

  SELECT  
	[StudentUSI]
      ,[EducationOrganizationId]
      ,[ProgramEducationOrganizationId]
      ,[ProgramName]
      ,[ProgramTypeDescriptorId]
      ,[BeginDate]
	  , 1 -- have to be true for NorD
	  , '2017-09-15'
	  , 129 [ContinuationOfServicesReasonDescriptorId] -- Ceased to be migratory during prev term and no com
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentNeglectedOrDelinquentProgramAssociation]
GO


