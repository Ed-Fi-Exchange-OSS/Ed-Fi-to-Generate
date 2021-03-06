﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_Validation_Logging]    Script Date: 3/19/2018 12:05:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_Validation_Logging') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_Validation_Logging]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_Validation_Logging]
	  @eStoredProc VARCHAR(500)
	, @eTable VARCHAR(100)
	, @ColumnName VARCHAR(500)
	, @eSimpleMessage VARCHAR(500)
AS

/*************************************************************************************************************
Date Created:  3/19/2019

Purpose: Insert validation error log records into the Validation Errors table.  

Assumptions: This stored procedure will only be called when an error has occured in the execution of ETL code. 
If this is used more universally then the following changes will need to be made:
1. ErrorGroup value will need to be passed as a parameter instead of manually set to 1. 
2. Identifier value will need to be passed as a parameter instead of manually set to NULL. 
 
Account executed under: LOGIN

Approximate run time:  ~ 1 millisecond.

Data Sources:  N/A

Data Targets:  Generate Database:   Staging.ValidationErrors

Return Values: N/A
  
Error Group
1	Code Execution Failure
2	Table Did Not Populate
3	Field Required But Not Populated
4	Source Value Not In The ODS
*************************************************************************************************************/
BEGIN

DECLARE @eDetailMessage		varchar(500)

SET @eDetailMessage = ERROR_MESSAGE() 

	INSERT INTO [Staging].[ValidationErrors] VALUES 
	(@eStoredProc		 -- Field: ProcessName
	, @eTable			 -- Field: TableName
	, @ColumnName		 -- Field: ElementName
	, @eSimpleMessage	 -- Field: ErrorSimple
	, @eDetailMessage	 -- Field: ErrorDetail
	, 1					 -- Field: ErrorGroup
	, NULL				 -- Field: Identifier
	, NULL				 -- Field: CreateDate - This is populated after each Migration Step executes 
	)


END
