-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE EdFi_Sample_ODS_Data_For_Generate
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'extension')
EXEC sys.sp_executesql N'CREATE SCHEMA [extension]'
GO
