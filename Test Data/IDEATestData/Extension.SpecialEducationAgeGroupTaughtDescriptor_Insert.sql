USE [EdFi_Sample_ODS_Data_For_Generate]
GO
Declare @NameSpace varchar(200) = 'uri://ed-fi.org/SpecialEducationAgeGroupTaughtDescriptor'

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='3TO5')
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, '3TO5', '3 through 5','The age range of special education students taught is 3 through 5.'


	INSERT INTO [extension].[SpecialEducationAgeGroupTaughtDescriptor]
			   ([SpecialEducationAgeGroupTaughtDescriptorId])
		 VALUES
			   (@@IDENTITY)
END

IF NOT EXISTS (SELECT 1 FROM [edfi].[Descriptor] WHERE CodeValue ='6TO21')
BEGIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @NameSpace, '6TO21', '6 through 21','The age range of special education students taught is 6 through 21.'

	INSERT INTO [extension].[SpecialEducationAgeGroupTaughtDescriptor]
			   ([SpecialEducationAgeGroupTaughtDescriptorId])
		 VALUES
			   (@@IDENTITY)
END

SELECT * FROM [edfi].[Descriptor]