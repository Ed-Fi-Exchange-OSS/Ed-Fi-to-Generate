-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


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