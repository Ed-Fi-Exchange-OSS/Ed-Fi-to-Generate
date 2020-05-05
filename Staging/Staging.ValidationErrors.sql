USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Staging' AND TABLE_NAME = 'ValidationErrors') BEGIN
	DROP TABLE [Staging].[ValidationErrors]
END

GO


CREATE TABLE Staging.ValidationErrors
    ( Id INT IDENTITY(1, 1) PRIMARY KEY
	, ProcessName VARCHAR(100)
	, TableName VARCHAR(100)
	, ElementName VARCHAR(100)
	, ErrorSimple VARCHAR(500)
	, ErrorDetail VARCHAR(500)
	, ErrorGroup INT
	, Identifier VARCHAR(100)
	, CreateDate DATETIME
	)

