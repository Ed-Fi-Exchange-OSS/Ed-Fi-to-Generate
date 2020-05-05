USE [EdFi_Sample_ODS_Data_For_Generate]
GO

DECLARE @NameSpace varchar(100), @code varchar(200), @Desc varchar(200), @shortDesc varchar(75)
SELECT @NameSpace = 'uri://ed-fi.org/AcademicSubjectDescriptor', @code = 'English as a second language (ESL)', @Desc = 'English as a second language (ESL)'

IF NOT EXISTS(SELECT 1 FROM [edfi].[Descriptor] WHERE Namespace = @NameSpace and CodeValue = @Code)
INSERT INTO [edfi].[Descriptor]
           (
		   [Namespace]
           ,[CodeValue]
           ,[ShortDescription]
           ,[Description]
		   )
SELECT @NameSpace, @code, @Desc, @Desc


INSERT INTO [edfi].[AcademicSubjectDescriptor]
(
	[AcademicSubjectDescriptorId]
)
SELECT DescriptorId 
FROM [edfi].[Descriptor] D
LEFT JOIN [edfi].[AcademicSubjectDescriptor] cs ON cs.[AcademicSubjectDescriptorId] = d.DescriptorId
WHERE D.Namespace = @NameSpace and D.CodeValue = @code
AND cs.[AcademicSubjectDescriptorId] IS NULL

