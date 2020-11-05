-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


			use EdFi_Sample_ODS_Data_For_Generate

			--select EducationOrganizationIdentificationSystemDescriptorId from  [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodesch 
			declare @SEA_EducationOrganizationIdentificationSystemDescriptorId int

			select @SEA_EducationOrganizationIdentificationSystemDescriptorId = DescriptorId from edfi.Descriptor where Namespace ='uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor' and CodeValue = 'SEA'

			declare @NCES_EducationOrganizationIdentificationSystemDescriptorId int

			select @NCES_EducationOrganizationIdentificationSystemDescriptorId = DescriptorId from edfi.Descriptor where Namespace ='uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor' and CodeValue = 'NCES'


		--	select * from edfi.Descriptor where Namespace ='uri://ed-fi.org/EducationOrganizationIdentificationSystemDescriptor'

		INSERT INTO [edfi].[EducationOrganizationIdentificationCode]
           ([EducationOrganizationId]
           ,[IdentificationCode]
           ,[CreateDate]
           ,[EducationOrganizationIdentificationSystemDescriptorId])
			SELECT  [EducationOrganizationId]
			  ,[IdentificationCode]
			  ,GetDate()
			  ,@NCES_EducationOrganizationIdentificationSystemDescriptorId
			from  [EdFi_Sample_ODS_Data_For_Generate].[edfi].EducationOrganizationIdentificationCode edorgidcodesch 
			where EducationOrganizationIdentificationSystemDescriptorId = @SEA_EducationOrganizationIdentificationSystemDescriptorId 
			and EducationOrganizationId >= 255901002