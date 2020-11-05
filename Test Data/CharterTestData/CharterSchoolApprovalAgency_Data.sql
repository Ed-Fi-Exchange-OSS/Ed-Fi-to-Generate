-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

DECLARE @CharterApprovalAgencyTypeDescriptorId INT 
SELECT @CharterApprovalAgencyTypeDescriptorId = DescriptorId FROM edfi.Descriptor WHERE Codevalue = 'State board of education'

IF NOT EXISTS (SELECT 1 FROM [extension].[CharterSchoolApprovalAgency] where [CharterApprovalAgencyTypeDescriptorId] = @CharterApprovalAgencyTypeDescriptorId)
INSERT INTO [extension].[CharterSchoolApprovalAgency]
           ([CharterSchoolApprovalAgencyId]
           ,[CharterApprovalAgencyTypeDescriptorId]
)
SELECT 255901, 
		1505 -- State board of education

GO


IF NOT EXISTS (SELECT 1 FROM [extension].[CedsSchool] WHERE [CedsSchoolId] = 255901001)
INSERT INTO [extension].[CedsSchool]
           ([CedsSchoolId]
           ,[CharterSchoolApprovalAgencyId]
		   ,EducationOrgabizationNetworkId
)
select 255901001, 255901, 255901301
GO



