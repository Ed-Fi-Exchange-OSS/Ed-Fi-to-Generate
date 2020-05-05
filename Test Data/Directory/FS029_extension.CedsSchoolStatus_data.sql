use EdFi_Sample_ODS_Data_For_Generate

  IF NOT EXISTS (SELECT 1 FROM [extension].[CedsSchoolStatus] WHERE [SchoolId] = 255901002)
  INSERT INTO [extension].[CedsSchoolStatus]
           ([SchoolId]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId]
           ,[SchoolDangerousStatusDescriptorId]
           ,[ConsolidatedMepFundsStatus]
			)

	select 255901002
	, 4091 -- NOSTUDENTS
	, 3012 -- NO -- Not Persistently Dangerous
	, 0

  IF NOT EXISTS (SELECT 1 FROM [extension].[CedsSchoolStatus] WHERE [SchoolId] = 255901003)
  INSERT INTO [extension].[CedsSchoolStatus]
           ([SchoolId]
           ,[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId]
           ,[SchoolDangerousStatusDescriptorId]
           ,[ConsolidatedMepFundsStatus]
			)

	select 255901003
	, 4090 -- NOSTUDENTS
	, 3012 -- NO -- Not Persistently Dangerous
	, 1
