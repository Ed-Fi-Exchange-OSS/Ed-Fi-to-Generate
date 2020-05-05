USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentMigrantEducationProgramAssociationMigrantEducationProgramService]
           (
		   [StudentUSI]
           ,[EducationOrganizationId]
		   ,[ProgramName]
           ,[ProgramEducationOrganizationId]
		   ,[BeginDate]     
           ,[ProgramTypeDescriptorId]
		   , MigrantEducationProgramServiceDescriptorId
           ,[PrimaryIndicator]
           ,[ServiceBeginDate]
           ,[ServiceEndDate]
           )
SELECT  [StudentUSI]
      ,[EducationOrganizationId]
      ,[ProgramName]
      ,[ProgramEducationOrganizationId]
      ,[BeginDate]
	  ,[ProgramTypeDescriptorId]
	  , 2845 --High School Accrual
	  , 1 [PrimaryIndicator]
	  , '2018-01-01' [ServiceBeginDate]
	  , NULL [ServiceEndDate]
      
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentMigrantEducationProgramAssociation]
GO


