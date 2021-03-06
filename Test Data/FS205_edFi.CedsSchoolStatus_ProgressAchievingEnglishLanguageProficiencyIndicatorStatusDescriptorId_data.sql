﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.


  declare @ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId int

    select @ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId = DescriptorId from edfi.Descriptor 
	where Namespace like '%uri://ed-fi.org/ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor%' and CodeValue ='STTDEF'

	update st
set [ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId] = @ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId
	  FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolStatus] st
	  where [SchoolId] =255901003