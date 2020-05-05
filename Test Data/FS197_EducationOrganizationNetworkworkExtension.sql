
	declare @CharterSchoolManagementOrganizationTypeDescriptorId int
    select @CharterSchoolManagementOrganizationTypeDescriptorId = DescriptorId from edfi.Descriptor 
		where Namespace  ='https://ceds.ed.gov/element/001650' and CodeValue = 'CMO' --Charter Management Organization
	select @CharterSchoolManagementOrganizationTypeDescriptorId

	if not exists (select 1 from [extension].[EducationOrganizationNetworkExtension] where EducationOrganizationNetworkId = 255901002)
INSERT INTO [extension].[EducationOrganizationNetworkExtension]
           ([EducationOrganizationNetworkId]
           ,[CharterSchoolManagementOrganizationTypeDescriptorId]
           ,[CreateDate])
select 255901002,  @CharterSchoolManagementOrganizationTypeDescriptorId, GetDate()

if not exists ( select 1 from [edfi].[EducationOrganizationNetworkAssociation] where [MemberEducationOrganizationId] = 255901001 and [EducationOrganizationNetworkId] =255901002 )
  INSERT INTO [edfi].[EducationOrganizationNetworkAssociation]
           ([MemberEducationOrganizationId]
           ,[EducationOrganizationNetworkId]
)
select 255901001, 255901002