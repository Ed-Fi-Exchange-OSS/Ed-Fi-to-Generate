-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentSpecialEducationProgramAssociationDisability]
           ([BeginDate]
           ,[DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]
		   )
SELECT [BeginDate]
           ,391
           ,[EducationOrganizationId]
           ,[ProgramEducationOrganizationId]
           ,[ProgramName]
           ,[ProgramTypeDescriptorId]
           ,[StudentUSI]

  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentSpecialEducationProgramAssociation]
  where [StudentUSI] = 21681
GO


