﻿-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.



	SELECT s.* FROM ODS.PersonIdentifier pir
	JOIN RDS.DimStudents s ON s.StudentPersonId=pir.PersonId
	WHERE pir.Identifier in ('604822', '604881', '605175', '605739')
	
