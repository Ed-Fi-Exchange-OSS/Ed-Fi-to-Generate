-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

IF NOT EXISTS(SELECT 1 FROM sys.Objects 
    WHERE  Object_id = OBJECT_ID(N'[ODS].[SourceSystemReferenceData]') AND Type = N'U')
begin

	CREATE TABLE [ODS].[SourceSystemReferenceData](
		[SourceSystemReferenceDataId] int IDENTITY NOT NULL,
		[SchoolYear] [smallint] NOT NULL,
		[TableName] [varchar](100) NOT NULL,
		[TableFilter] [varchar](100) NULL,
		[InputCode] [nvarchar](200) NULL,
		[OutputCode] [nvarchar](200) NULL
	CONSTRAINT [PK_SourceSystemReferenceData] PRIMARY KEY CLUSTERED 
	(
		[SourceSystemReferenceDataId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	CREATE UNIQUE INDEX [IX_SourceSystemReferenceData_Unique] ON [ODS].[SourceSystemReferenceData]
	(
		[SchoolYear] DESC,
		[TableName] ASC,
		[TableFilter] ASC,
		[InputCode] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

end