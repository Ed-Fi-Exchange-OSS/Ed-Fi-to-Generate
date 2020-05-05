USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT 255901, 2229, 21631, GetDate()

GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT 255901, 682, 21631, GetDate()

GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[EndDate]
           ,[CreateDate])
SELECT '2017-07-01', 255901, 682, 21631, NULL, GETDATE()

GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[Id]
           ,[LastModifiedDate]
           ,[CreateDate]
           ,[ProfileThumbnail]
           ,[HispanicLatinoEthnicity]
           ,[LimitedEnglishProficiencyDescriptorId]
           ,[LoginId]
           ,[SexDescriptorId]
           ,[OldEthnicityDescriptorId]
           ,[Discriminator])
SELECT DISTINCT
            [StudentUSI]
           ,'255901' [EducationOrganizationId]
           ,NEWID() [Id]
           ,[LastModifiedDate]
           ,[CreateDate]
           ,[ProfileThumbnail]
           ,[HispanicLatinoEthnicity]
           ,[LimitedEnglishProficiencyDescriptorId]
           ,[LoginId]
           ,[SexDescriptorId]
           ,[OldEthnicityDescriptorId]
           ,[Discriminator]
FROM edfi.StudentEducationOrganizationAssociation
WHERE StudentUSI = '7740'

GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[CreateDate])
SELECT 255901, 688, 7740, GetDate()

GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod]
           ([BeginDate]
           ,[EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           ,[EndDate]
           ,[CreateDate])
SELECT '2017-07-01', 255901, 688, 7740, NULL, GETDATE()

GO

