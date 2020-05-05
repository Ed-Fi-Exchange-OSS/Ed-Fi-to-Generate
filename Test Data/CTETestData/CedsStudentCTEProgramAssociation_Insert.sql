INSERT INTO [extension].[CedsStudentCTEProgramAssociation]
           (
		   [StudentUSI]
		  ,[EducationOrganizationId]
		  ,[ProgramName]
		  ,[ProgramEducationOrganizationId]
		  ,[BeginDate]
		  ,[ProgramTypeDescriptorId]
           ,[DisplacementTypeDescriptorId]
			)
SELECT [StudentUSI]
      ,[EducationOrganizationId]
      ,[ProgramName]
      ,[ProgramEducationOrganizationId]
      ,[BeginDate]
      ,[ProgramTypeDescriptorId]
	  ,CASE 
		WHEN Abs(Checksum(NewId())) % 10 <= 5 
			THEN (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' And CodeValue ='ADVTRAIN')
		ELSE (SELECT DescriptorId From edfi.Descriptor WHERE Namespace = 'uri://ed-fi.org/DisplacementTypeDescriptor' And CodeValue ='EMPLOYMENT')
	   END DisplacementTypeDescriptor
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociation]

   declare @PerkinsLEPStatusDescriptorId int 
  select @PerkinsLEPStatusDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Perkins LEP' and Namespace ='https://ceds.ed.gov/element/000581'

  Update cte
  SET [PerkinsLEPStatusDescriptorId] = @PerkinsLEPStatusDescriptorId

  FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsStudentCTEProgramAssociation] cte
  where StudentUSI in (
  20000,
20001,
20002,
20003,
20004,
20005
)
