IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'extension')
EXEC sys.sp_executesql N'CREATE SCHEMA [extension]'
GO
