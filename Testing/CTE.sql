

	SELECT s.* FROM ODS.PersonIdentifier pir
	JOIN RDS.DimStudents s ON s.StudentPersonId=pir.PersonId
	WHERE pir.Identifier in ('604822', '604881', '605175', '605739')
	
