USE [generate]
GO

DECLARE @SchoolYear INT = 2018, @TableName varchar(100) = 'RefSpecialEducationStaffCategory'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Psychological Services')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Psychological Services', 'PSYCH'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Social Work Services')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Social Work Services', 'SOCIALWORK'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Occupational And Physical Therapy')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Occupational And Physical Therapy', 'OCCTHERAP'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Counseling Services')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Counseling Services', 'COUNSELOR'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Interpreting Services')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Interpreting Services', 'INTERPRET'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Medical Services')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Medical Services', 'MEDNURSE'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Orientation And Mobility')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Orientation And Mobility', 'ORIENTMOBIL'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Recreation, Including Therapeutic Recreation')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Recreation, Including Therapeutic Recreation', 'PEANDREC'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'School Health and/or School Nurse Services')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'School Health and/or School Nurse Services', 'MEDNURSE'

IF NOT EXISTS (SELECT 1 FROM [ODS].[SourceSystemReferenceData] WHERE [InputCode] = 'Speech-Language And Audiology Services')
INSERT INTO [ODS].[SourceSystemReferenceData]
           ([SchoolYear]
           ,[TableName]
           ,[InputCode]
           ,[OutputCode])
SELECT @SchoolYear, @TableName, 'Speech-Language And Audiology Services', 'SPEECHPATH'

GO


