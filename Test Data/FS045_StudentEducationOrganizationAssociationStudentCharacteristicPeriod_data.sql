
	update immcharperiod
	set BeginDate = '2017-10-15'
	from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod immcharperiod
	where StudentCharacteristicDescriptorId = 684
	and StudentUSI between 20001 and 20013 and BeginDate = '2017-09-01'

		update immcharperiod
	set BeginDate = '2017-10-01'
	from [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod immcharperiod
	where StudentCharacteristicDescriptorId = 684
	and StudentUSI between 20001 and 20013 and BeginDate = '2017-10-15'