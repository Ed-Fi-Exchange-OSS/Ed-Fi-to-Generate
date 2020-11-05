-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

IF NOT EXISTS (SELECT 1 FROM [extension].[CedsSchoolStatus] WHERE SchoolId = 255901001 AND [SchoolDangerousStatusDescriptorId] = 3012)
INSERT INTO [extension].[CedsSchoolStatus]
           (
				[SchoolId]
			   ,[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId]
			   ,[SchoolDangerousStatusDescriptorId]
			   ,[ProgressAchievingEnglishLanguageProficiencyStateDefinedStatus]
			)
     VALUES
           (
		   255901001
           ,2956 -- Too few students
           ,3012 -- Not Persistently Dangerous
           ,'TOOFEW'
		)
GO


