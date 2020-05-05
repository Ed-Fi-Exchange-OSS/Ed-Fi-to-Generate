USE [EdFi_Sample_ODS_Data_For_Generate]
GO

INSERT INTO [edfi].[EducationOrganizationIdentificationCode]
           ([EducationOrganizationId]
           ,[IdentificationCode]
           ,[CreateDate]
           ,[EducationOrganizationIdentificationSystemDescriptorId])
     VALUES
           (255500
           ,255500
           ,GETDATE()
           ,426)
GO


