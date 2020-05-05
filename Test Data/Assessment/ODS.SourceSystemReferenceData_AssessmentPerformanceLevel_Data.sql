use generate

DECLARE @TableName varchar(100) = 'AssessmentPerformanceLevel_Identifier'
DECLARE @SchoolYear INT = 2018
DECLARE @InputValue varchar(1000) = 'Advanced'
DECLARE @OutputValue varchar(1000) = 'L6' -- the highest level

DELETE FROM ODS.SourceSystemReferenceData WHERE TableName = @TableName 

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Basic'
SET @OutputValue = 'L4' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Below Basic'
SET @OutputValue = 'L3' -- Not Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Pass'
SET @OutputValue = 'L4' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Fail'
SET @OutputValue = 'L1' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Proficient'
SET @OutputValue = 'L6' --

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Well Below Basic'
SET @OutputValue = 'L1' --

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Above Benchmark'
SET @OutputValue = 'L5' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Commended Performance'
SET @OutputValue = 'L4' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Met Standard'
SET @OutputValue = 'L4' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Minimum'
SET @OutputValue = 'L3' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Satisfactory'
SET @OutputValue = 'L5' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue

SET @InputValue = 'Unsatisfactory'
SET @OutputValue = 'L2' -- Pass

IF NOT EXISTS (SELECT 1 FROM ODS.SourceSystemReferenceData WHERE InputCode = @InputValue AND TableName = @TableName)
INSERT INTO [ODS].[SourceSystemReferenceData]
    (
	[SchoolYear], [TableName], [InputCode], [OutputCode]
	)
SELECT @SchoolYear, @TableName, @InputValue, @OutputValue