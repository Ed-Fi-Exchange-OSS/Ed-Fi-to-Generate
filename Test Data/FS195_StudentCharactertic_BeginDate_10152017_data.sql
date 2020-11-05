-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

	use EdFi_Sample_ODS_Data_For_Generate
	


		--	select * 
			update sp
			set BeginDate = '2017-10-15'
			
			from  [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentEducationOrganizationAssociationStudentCharacteristicPeriod sp
			where StudentCharacteristicDescriptorId = 694