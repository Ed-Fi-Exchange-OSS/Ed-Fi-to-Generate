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





