-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[EducationOrganizationId]
		   ,[DisabilityDescriptorId]  
		)
select top 5 nord.[StudentUSI],  nord.[EducationOrganizationId], 393 -- Intellectual Disability
from edfi.StudentNeglectedOrDelinquentProgramAssociation nord
left join [edfi].[StudentEducationOrganizationAssociationDisability] disa 
	on disa.StudentUSI = nord.StudentUSI
where disa.StudentUSI is null

INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           (
		   [StudentUSI]
		   ,[EducationOrganizationId]
		   ,[DisabilityDescriptorId]  
		)
select  nord.[StudentUSI],  nord.[EducationOrganizationId], 402 -- Physical Disability
from edfi.StudentNeglectedOrDelinquentProgramAssociation nord
left join [edfi].[StudentEducationOrganizationAssociationDisability] disa 
	on disa.StudentUSI = nord.StudentUSI
where disa.StudentUSI is null





