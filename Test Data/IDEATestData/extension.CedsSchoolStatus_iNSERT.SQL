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


