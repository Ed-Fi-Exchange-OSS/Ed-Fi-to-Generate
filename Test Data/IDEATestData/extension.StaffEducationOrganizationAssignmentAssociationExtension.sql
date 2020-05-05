USE [EdFi_Sample_ODS_Data_For_Generate]
GO

IF NOT EXISTS (SELECT 1 FROM [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WHERE [StaffUSI] = 8 and [EducationOrganizationId] = 255901001)
INSERT INTO [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[StaffClassificationDescriptorId]
           ,[StaffUSI]
           ,[SpecialEducationSupportServicesCategoryDescriptorId]
		   , [SpecialEducationAgeGroupTaughtDescriptorId]
			)
     VALUES
           (
		   '2017-08-21'
           ,255901001
           ,653 -- Teacher
           ,8
           ,2901 -- Psychological Services
		   , 3009 -- 3 through 5
		)

IF NOT EXISTS (SELECT 1 FROM [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WHERE [StaffUSI] = 10 and [EducationOrganizationId] = 255901001)
INSERT INTO [extension].[StaffEducationOrganizationAssignmentAssociationExtension]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[StaffClassificationDescriptorId]
           ,[StaffUSI]
           ,[SpecialEducationSupportServicesCategoryDescriptorId]
		   , [SpecialEducationAgeGroupTaughtDescriptorId]
			)
     VALUES
           (
		   '1997-04-24'
           ,255901001
           ,647 -- Instructional Aide
           ,10
           ,2894 -- Counseling Services
		   , 3010 --- 6 through 21
		)






