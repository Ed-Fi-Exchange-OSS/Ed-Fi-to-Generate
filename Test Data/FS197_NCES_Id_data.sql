use EdFi_Sample_ODS_Data_For_Generate
  declare @EducationOrganizationIdentificationSystemDescriptorNCESId int
  select @EducationOrganizationIdentificationSystemDescriptorNCESId = DescriptorId from edfi.Descriptor where Namespace like '%EducationOrganizationIdentificationSystemDescriptor%' and CodeValue = 'NCES'

  if not exists (select 1 from [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] 
					where EducationOrganizationId = 255901 and EducationOrganizationIdentificationSystemDescriptorId = @EducationOrganizationIdentificationSystemDescriptorNCESId
					)
  insert into [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] 
  select 255901, 255901, GetDate(), @EducationOrganizationIdentificationSystemDescriptorNCESId

    if not exists (select 1 from [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] 
					where EducationOrganizationId = 255901001 and EducationOrganizationIdentificationSystemDescriptorId = @EducationOrganizationIdentificationSystemDescriptorNCESId
					)
  insert into [EdFi_Sample_ODS_Data_For_Generate].[edfi].[EducationOrganizationIdentificationCode] 
  select 255901001, 255901001, GetDate(), @EducationOrganizationIdentificationSystemDescriptorNCESId