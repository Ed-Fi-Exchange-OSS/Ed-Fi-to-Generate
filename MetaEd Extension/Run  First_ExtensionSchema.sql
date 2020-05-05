USE EdFi_Sample_ODS_Data_For_Generate
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'extension')
EXEC sys.sp_executesql N'CREATE SCHEMA [extension]'
GO
