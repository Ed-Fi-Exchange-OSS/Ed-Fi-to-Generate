-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [EdFi_Sample_ODS_Data_For_Generate]
GO

BEGIN TRANSACTION
BEGIN TRY 
	DECLARE @nameSapce nvarchar(128)
	DECLARE @NewDescriptoId INT
	SET @nameSapce = 'uri://ed-fi.org/DisplacementTypeDescriptor'

	-- ADVTRAIN
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @nameSapce, 'ADVTRAIN', 'Advanced training', 'Advanced training'

	SET @NewDescriptoId = @@IDENTITY

	INSERT INTO [extension].[DisplacementTypeDescriptor]
			   ([DisplacementTypeDescriptorId])
		 VALUES
			   (@NewDescriptoId)

	-- EMPLOYMENT
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @nameSapce, 'EMPLOYMENT', 'Employment', 'Employment'

	SET @NewDescriptoId = @@IDENTITY

	INSERT INTO [extension].[DisplacementTypeDescriptor]
			   ([DisplacementTypeDescriptorId])
		 VALUES
			   (@NewDescriptoId)

	-- MILITARY
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @nameSapce, 'MILITARY', 'Military service', 'Military service'

	SET @NewDescriptoId = @@IDENTITY

	INSERT INTO [extension].[DisplacementTypeDescriptor]
			   ([DisplacementTypeDescriptorId])
		 VALUES
			   (@NewDescriptoId)

	-- POSTSEC 
	INSERT INTO [edfi].[Descriptor]
			   ([Namespace]
			   ,[CodeValue]
			   ,[ShortDescription]
			   ,[Description]
	)
	SELECT @nameSapce, 'POSTSEC ', 'Were accepted and/or enrolled into post-secondary education', 'Were accepted and/or enrolled into post-secondary education'

	SET @NewDescriptoId = @@IDENTITY

	INSERT INTO [extension].[DisplacementTypeDescriptor]
			   ([DisplacementTypeDescriptorId])
		 VALUES
			   (@NewDescriptoId)
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH