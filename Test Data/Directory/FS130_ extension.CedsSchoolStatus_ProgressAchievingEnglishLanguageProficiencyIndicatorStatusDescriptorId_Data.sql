

  update ceds
  set [SchoolDangerousStatusDescriptorId] = 3011 -- YES
  ,[ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId] = 4090 -- TOOFEW
   FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolStatus] ceds

