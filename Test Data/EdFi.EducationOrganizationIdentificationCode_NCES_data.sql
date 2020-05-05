
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