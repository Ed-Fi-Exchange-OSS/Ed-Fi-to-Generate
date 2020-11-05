-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.



	-- add RecordStartDateTime, RecordEndDateTime
	IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'RecordStartDateTime'
          AND Object_ID = Object_ID(N'ODS.K12LeaTitleISupportService'))
	BEGIN
		-- Column Exists
		ALTER TABLE ODS.K12LeaTitleISupportService ADD RecordStartDateTime DATETIME NOT NULL
	END
	GO

	IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'RecordEndDateTime'
          AND Object_ID = Object_ID(N'ODS.K12LeaTitleISupportService'))
	BEGIN
		-- Column Exists
		ALTER TABLE ODS.K12LeaTitleISupportService ADD RecordEndDateTime DATETIME NULL
	END


	-- check K12ProgramOrService for PK and drop it if it is OrganizationId
	DECLARE @PKName VARCHAR(100)
	IF EXISTS (SELECT 1 
                      FROM   information_schema.table_constraints AS C 
                             INNER JOIN information_schema.key_column_usage AS K
                                      ON C.table_name = K.table_name 
                                        AND C.constraint_catalog = 
                                            K.constraint_catalog 
                                        AND C.constraint_schema = 
                                            K.constraint_schema 
                                        AND C.constraint_name = 
                                            K.constraint_name 
                      WHERE  C.constraint_type = 'PRIMARY KEY' 
                             AND column_name = 'OrganizationId' 
                             AND C.table_name = 'K12ProgramOrService' 
                             AND C.table_schema = 'ODS') 
		BEGIN
			SELECT   @PKName=  X.NAME
			--COL_NAME(IC.OBJECT_ID,IC.COLUMN_ID) AS COLUMNNAME
			FROM       SYS.INDEXES  X 
			INNER JOIN SYS.INDEX_COLUMNS  IC 
					ON X.OBJECT_ID = IC.OBJECT_ID
				   AND X.INDEX_ID = IC.INDEX_ID
			WHERE      X.IS_PRIMARY_KEY = 1
			  AND      OBJECT_NAME(IC.OBJECT_ID)='K12ProgramOrService'

			PRINT @PKName
			ALTER TABLE ODS.K12ProgramOrService DROP CONSTRAINT PK_K12LEAProgram
		END


	-- ALTER TABLE ODS.K12ProgramOrService DROP CONSTRAINT PK_K12ProgramOrService_K12ProgramOrServiceId
	-- ALTER TABLE ODS.K12ProgramOrService DROP COLUMN K12ProgramOrServiceId;

	-- add PK field and add PK Constraint
	IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'K12ProgramOrServiceId'
          AND Object_ID = Object_ID(N'ODS.K12ProgramOrService'))
	BEGIN
		-- Column Exists
		ALTER TABLE ODS.K12ProgramOrService ADD K12ProgramOrServiceId INT IDENTITY(1,1) NOT NULL
		ALTER TABLE ODS.K12ProgramOrService
		ADD CONSTRAINT PK_K12ProgramOrService_K12ProgramOrServiceId PRIMARY KEY CLUSTERED (K12ProgramOrServiceId);
	END

	-- add RecordStartDateTime, RecordEndDateTime
	IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'RecordStartDateTime'
          AND Object_ID = Object_ID(N'ODS.K12ProgramOrService'))
	BEGIN
		-- Column Exists
		ALTER TABLE ODS.K12ProgramOrService ADD RecordStartDateTime DATETIME NOT NULL
	END
	GO

	IF NOT EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'RecordEndDateTime'
          AND Object_ID = Object_ID(N'ODS.K12ProgramOrService'))
	BEGIN
		-- Column Exists
		ALTER TABLE ODS.K12ProgramOrService ADD RecordEndDateTime DATETIME NULL
	END