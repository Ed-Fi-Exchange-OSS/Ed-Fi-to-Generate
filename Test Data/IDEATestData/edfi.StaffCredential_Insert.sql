-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[Credential]
           ([CredentialIdentifier]
           ,[StateOfIssueStateAbbreviationDescriptorId]
           ,[CredentialFieldDescriptorId]
           ,[CredentialTypeDescriptorId]
           ,[TeachingCredentialDescriptorId]
		   , IssuanceDate
		   , Namespace
			)
SELECT 'CO Issued Certification'
	, 1399 -- Colorado
	, 765  -- Computr Science
	, 1530 -- Certification
	, 706 --  Paraprofessional
	, '2017-07-01'
	, 'Special Education'

INSERT INTO [edfi].[StaffCredential]
           ([StaffUSI]
           ,[CreateDate]
           ,[CredentialIdentifier]
           ,[StateOfIssueStateAbbreviationDescriptorId])
SELECT 10
	,  GETDATE()
	,  'CO Issued Certification'
	, 1399 -- Colorado

use EdFi_Sample_ODS_Data_For_Generate
select * from [EdFi_Sample_ODS_Data_For_Generate].edfi.Descriptor where Namespace like '%Credential%'

select * from edfi.Descriptor where CodeValue like '%cred%'