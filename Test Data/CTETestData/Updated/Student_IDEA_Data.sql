USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[StudentEducationOrganizationAssociationDisability]
           ([DisabilityDescriptorId]
           ,[EducationOrganizationId]
           ,[StudentUSI])
select 390 -- AUT
,255901
,21631

GO


INSERT INTO [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
           ([EducationOrganizationId]
           ,[StudentCharacteristicDescriptorId]
           ,[StudentUSI]
           )
SELECT 
255901
,684
,21631
GO


