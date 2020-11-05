-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_Validation]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_Validation') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_Validation]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_Validation]
	  @ETLName VARCHAR(100)
	, @StagingTableName VARCHAR(100)
	, @SchoolYear SMALLINT
AS

/*************************************************************************************************************
Date Created:  2/12/2018

Purpose:
    This stored procedure contains all of the validation rules for the Staging tables and populates the Staging.ValidationErorrs table

Assumptions:
        

Account executed under: LOGIN

Approximate run time:  ~ 5 seconds

Data Sources:  Staging tables in the generate database

Data Targets:  Generate Database:   Staging.ValidationErrors

Return Values:
    	0	= Success
    All Errors are Thrown via Try/Catch Block	
  
Example Usage: 
    EXEC App.[Migrate_Data_Validation];
    
Modification Log:
    #	  Date		    Developer	  Issue#	 Description
    --  ----------  ----------  -------  --------------------------------------------------------------------
    01		  	 
*************************************************************************************************************/
BEGIN

	--Delete records from the previous run for this ETL & Table Name
	DELETE FROM Staging.ValidationErrors 
	WHERE ETLName = @ETLName 
	AND StagingTableName = @StagingTableName


	DECLARE @ColumnName VARCHAR(100), @SQL VARCHAR(MAX), @PrimaryKeyField VARCHAR(100)
		
	SELECT @PrimaryKeyField = Col.Column_Name 
	FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS Tab
	JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE Col 
		ON Col.Constraint_Name = Tab.Constraint_Name
	WHERE Col.Table_Name = Tab.Table_Name
		AND Constraint_Type = 'PRIMARY KEY'
		AND Col.TABLE_SCHEMA = 'Staging'
		AND Col.Table_Name = @StagingTableName

		
	SET @SQL = 'IF (SELECT COUNT(*) FROM Staging.' + @StagingTableName + ') = 0 BEGIN INSERT INTO Staging.ValidationErrors VALUES (''' + @ETLName + ''', ''' + @StagingTableName + ''', NULL, ''"' + @StagingTableName + '" table did not populate'', NULL, NULL) END'

	EXECUTE(@SQL)

	DECLARE SourceColumnList CURSOR FOR
	SELECT DISTINCT C.Name 
	FROM sys.extended_properties EP
	LEFT JOIN sys.all_objects O ON ep.major_id = O.object_id 
	LEFT JOIN sys.schemas S on O.schema_id = S.schema_id
	LEFT JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
	WHERE S.Name = 'Staging' 
		AND O.Name = @StagingTableName
		AND (ep.Name = 'Lookup'
			OR ep.Name = 'Required')

	OPEN SourceColumnList

	FETCH NEXT FROM SourceColumnList
	INTO @ColumnName

	WHILE @@FETCH_STATUS = 0  
	BEGIN	
		--Table contains data, but element is empty
		SET @SQL = 'INSERT INTO Staging.ValidationErrors SELECT ''' + @ETLName + ''', ''' + @StagingTableName + ''', ''' + @ColumnName + ''', ''' + @ColumnName + ' is required, but a record was found without a value'', ' + @PrimaryKeyField + ', NULL FROM Staging.' + @StagingTableName + ' WHERE ' + @ColumnName + ' IS NULL'

		EXECUTE(@SQL)


		-- Validate that all lookup values have a corresponding value in ODS.SourceSystemReferenceData
		DECLARE @LookupTable VARCHAR(100), @TableFilter VARCHAR(100)
		SET @LookupTable = null
		SET @TableFilter = NULL

		SELECT @LookupTable = CONVERT(VARCHAR(100), ep.Value)
		FROM sys.extended_properties EP
		JOIN sys.all_objects O ON ep.major_id = O.object_id 
		JOIN sys.schemas S on O.schema_id = S.schema_id
		JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
		WHERE S.Name = 'Staging' 
			AND O.Name = @StagingTableName 
			AND C.Name = @ColumnName 
			AND ep.Name = 'Lookup'

		SELECT @TableFilter = CONVERT(VARCHAR(100), ep.Value)
		FROM sys.extended_properties EP
		JOIN sys.all_objects O ON ep.major_id = O.object_id 
		JOIN sys.schemas S on O.schema_id = S.schema_id
		JOIN sys.columns AS c ON ep.major_id = c.object_id AND ep.minor_id = c.column_id
		WHERE S.Name = 'Staging' 
			AND O.Name = @StagingTableName 
			AND C.Name = @ColumnName 
			AND ep.Name = 'TableFilter'

		IF (@LookupTable IS NOT NULL AND @LookupTable <> '') BEGIN
			SET @SQL = 'INSERT INTO Staging.ValidationErrors '
			SET @SQL = @SQL + 'SELECT ''' + @ETLName + ''', ''' + @StagingTableName + ''', ''' + @ColumnName + ''', ''No match for lookup value "'' + stg.' + @ColumnName + ' + ''" in ODS.SourceSystemReferenceData for Staging.' + @StagingTableName + '.' + @ColumnName + ''', ' + @PrimaryKeyField + ', NULL '
			SET @SQL = @SQL + 'FROM Staging.' + @StagingTableName + ' stg '
			SET @SQL = @SQL + 'LEFT JOIN ODS.SourceSystemReferenceData ref ON ref.TableName = ''' + @LookupTable + ''' AND InputCode = stg.' + @ColumnName + ' '
			IF (@TableFIlter IS NOT NULL) BEGIN
				SET @SQL = @SQL + ' AND ref.TableFilter = ''' + @TableFilter + ''' '
			END
			SET @SQL = @SQL + 'WHERE stg.' + @ColumnName + ' IS NOT NULL AND ref.OutputCode IS NULL'

			EXECUTE(@SQL)
		END

		
		FETCH NEXT FROM SourceColumnList
		INTO @ColumnName
	END 

	DEALLOCATE SourceColumnList
			
	--Apply the same getdate/time to every record recorded for this ETL & Table Name
	UPDATE Staging.ValidationErrors
	SET CreateDate = GETDATE()
	WHERE ETLName = @ETLName
	AND StagingTableName = @StagingTableName

END









