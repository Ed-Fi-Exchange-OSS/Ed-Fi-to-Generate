/****** Script for SelectTopNRows command from SSMS  ******/
use EdFi_Sample_ODS_Data_For_Generate

declare @StudentUSI Int
SET @StudentUSI = 21656
declare @EducationOrganizationId int = 255901
declare @BeginDate date = '2018-01-01'

declare @StudentCharacteristicDescriptorId int

select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Homeless'
if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		   ,[BeginDate]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI
	  ,@BeginDate

select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Migrant'
if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		   ,[BeginDate]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI
	  ,@BeginDate


select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Parent in Military'

if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		   ,[BeginDate]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI
	  ,@BeginDate


  --Economic Disadvantaged
  select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Economic Disadvantaged'

if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		   ,[BeginDate]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI
	  ,@BeginDate
  -- Foster Care
    select @StudentCharacteristicDescriptorId = descriptorId from edfi.Descriptor 
	where Namespace ='uri://ed-fi.org/StudentCharacteristicDescriptor'
	AND CodeValue = 'Foster Care'

if not exists (SELECT 1 FROM [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] 
	where StudentUSI = @StudentUSI and [StudentCharacteristicDescriptorId] = @StudentCharacteristicDescriptorId
	)
INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
		   ,[BeginDate]
		)
SELECT  @EducationOrganizationId
      ,@StudentCharacteristicDescriptorId
      ,@StudentUSI
	  ,@BeginDate

  select * from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
  where StudentUSI = 21656

  --select * from edfi.Descriptor where Namespace like '%StudentCharacteristicDescriptor%'

  