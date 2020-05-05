USE [EdFi_Sample_ODS_Data_For_Generate]
GO
Declare @NameSpace varchar(200) = 'uri://ed-fi.org/SchoolDangerousStatusDescriptor'

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='YES' and Namespace = @NameSpace)
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, 'YES', 'Persistently Dangerous','Persistently Dangerous.'


	INSERT INTO [extension].[SchoolDangerousStatusDescriptor]
			   ([SchoolDangerousStatusDescriptorId])
		 VALUES
			   (@@IDENTITY)
END

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='NO' and Namespace = @NameSpace)
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, 'NO', 'Not Persistently Dangerous','Not Persistently Dangerous.'

	INSERT INTO [extension].[SchoolDangerousStatusDescriptor]
			   ([SchoolDangerousStatusDescriptorId])
		 VALUES
			   (@@IDENTITY)
END
SELECT * FROM [edfi].[Descriptor] where Namespace = @NameSpace