	use EdFi_Sample_ODS_Data_For_Generate
	


		--	select * 
			update sp
			set BeginDate = '2017-10-15'
			
			from  [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod sp
			where StudentCharacteristicDescriptorId = 694