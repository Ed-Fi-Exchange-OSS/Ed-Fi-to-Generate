-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

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


