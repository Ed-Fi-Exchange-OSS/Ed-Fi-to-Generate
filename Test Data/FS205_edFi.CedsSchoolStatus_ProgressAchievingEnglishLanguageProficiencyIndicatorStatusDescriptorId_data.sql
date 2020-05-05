
  declare @ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId int

    select @ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId = DescriptorId from edfi.Descriptor 
	where Namespace like '%uri://ed-fi.org/ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptor%' and CodeValue ='STTDEF'

	update st
set [ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId] = @ProgressAchievingEnglishLanguageProficiencyIndicatorStatusDescriptorId
	  FROM [EdFi_Sample_ODS_Data_For_Generate].[extension].[CedsSchoolStatus] st
	  where [SchoolId] =255901003