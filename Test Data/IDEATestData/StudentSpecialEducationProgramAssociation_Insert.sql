use EdFi_Sample_ODS_Data_For_Generate

		declare @ProgramTypeDescriptorId int
		declare @EducationOrganizationId int
		declare @ProgramEducationOrganizationId int
		declare @ProgramName varchar(60)
		declare @StudentUSI int
		declare @HomelessPrimaryNighttimeResidenceDescriptorId int

		select @ProgramTypeDescriptorId = DescriptorId from edfi.Descriptor where CodeValue = 'Special Education'
			and Namespace = 'uri://ed-fi.org/ProgramTypeDescriptor'

		select @EducationOrganizationId = 255901
		select @ProgramEducationOrganizationId = 255901
		select @ProgramName = 'Special Education'
		select @StudentUSI = 1

		-- new homeless program
		if not exists (select * from edfi.Program where ProgramName = @ProgramName
			and ProgramTypeDescriptorId = @ProgramTypeDescriptorId and EducationOrganizationId = @EducationOrganizationId)
			insert into edfi.Program (
				[EducationOrganizationId]
				,[ProgramName]
				,[ProgramId]
				,[Id]
				,[LastModifiedDate]
				,[CreateDate]
				,[ProgramTypeDescriptorId]
				,[Discriminator]
			) 
			values (
				@EducationOrganizationId
				,@ProgramName
				,'2559010_07'
				,NEWID ()
				,GetDate()
				,GetDate()
				,@ProgramTypeDescriptorId
				,NULL
			)

----------------------------------------


IF EXISTS (SELECT 1 from INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'XMLTemp')
	DROP TABLE XMLTemp


CREATE TABLE XMLTemp
(
	Id INT IDENTITY PRIMARY KEY,
	XMLData XML,
	CreatedDateTime DATETIME
)

INSERT INTO XMLTemp(XMLData, CreatedDateTime)
SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
FROM OPENROWSET(BULK 'C:\Repos\Ed-Fi-Samples\Ed-Fi-Standard-development\v3.0\Samples\Sample XML\StudentProgram.xml', SINGLE_BLOB) AS x;

DECLARE @studentSpecialEd TABLE
(
  StudentQuniqueId INT
  ,EducationOrganizationId INT
  ,IdeaEligibility BIT
  ,SpecialEducationSetting nvarchar(200)
  ,SpecialEducationHoursPerWeek decimal(9,3)
  ,SchoolHoursPerWeek decimal(9,3)
, MultiplyDisabled BIT
,MedicallyFragile BIT
, LastEvaluationDate DATE
,IEPReviewDate DATE
,IEPBeginDate DATE
, EndDate DATE
)

 ;WITH XMLNAMESPACES 
('http://ed-fi.org/0300' AS ns)
INSERT INTO
@studentSpecialEd
  SELECT 
  c.value('(ns:StudentReference/ns:StudentIdentity/ns:StudentUniqueId)[1]', 'int') as StudentQuniqueId
  ,c.value('(ns:EducationOrganizationReference/ns:EducationOrganizationIdentity/ns:EducationOrganizationId)[1]', 'int') as EducationOrganizationId
  ,c.value('(ns:IdeaEligibility)[1]', 'bit') as IdeaEligibility
  ,SUBSTRING(c.value('(ns:SpecialEducationSetting)[1]', 'nvarchar(200)'), 51, 100) as SpecialEducationSetting
  ,c.value('(ns:SpecialEducationHoursPerWeek)[1]', 'decimal(9,3)') as SpecialEducationHoursPerWeek
  ,c.value('(ns:SchoolHoursPerWeek)[1]', 'decimal(9,3)') as SchoolHoursPerWeek
  ,c.value('(ns:MultiplyDisabled)[1]', 'bit') as MultiplyDisabled
  ,c.value('(ns:MedicallyFragile)[1]', 'bit') as MedicallyFragile
  ,c.value('(ns:LastEvaluationDate)[1]', 'date') as LastEvaluationDate
  ,c.value('(ns:IEPReviewDate)[1]', 'date') as IEPReviewDate
  ,c.value('(ns:IEPBeginDate)[1]', 'date') as IEPBeginDate
  ,c.value('(ns:EndDate)[1]', 'date') as EndDate
 FROM dbo.XMLTemp s
 cross apply XMLData.nodes('/ns:InterchangeStudentProgram/ns:StudentSpecialEducationProgramAssociation') M(c)




 			insert into edfi.GeneralStudentProgramAssociation (
				[BeginDate]
				,[EducationOrganizationId]
				,[ProgramEducationOrganizationId]
				,[ProgramName]
				,[ProgramTypeDescriptorId]
				,[StudentUSI]
				,[EndDate]
				,[ReasonExitedDescriptorId]
				,[ServedOutsideOfRegularSession]
				,[CreateDate]
				,[LastModifiedDate]
				,[Id]
				,[Discriminator]
			) 
SELECT
				ed.IEPBeginDate
				,@EducationOrganizationId
				,@ProgramEducationOrganizationId
				,@ProgramName
				,@ProgramTypeDescriptorId
				, s.StudentUSI
				, DATEADD(YEAR, 8, ed.IEPBeginDate)
				,NULL
				,NULL
				,GetDate()
				,GetDate()
				,NEWID ()
				,'edfi.StudentProgramAssociation'
 FROM @studentSpecialEd ed
 JOIN edfi.Student s ON s.StudentUniqueId = ed.StudentQuniqueId
 LEFT JOIN edfi.GeneralStudentProgramAssociation  ga ON s.StudentUSI = ga.StudentUSI
 WHERE ga.Id is NULL


select * from
edfi.GeneralStudentProgramAssociation  ga
join @studentSpecialEd ed on ga.StudentUSI = ed.StudentQuniqueId

-----------------------------------------

INSERT INTO [edfi].[StudentSpecialEducationProgramAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[ProgramName]
           ,[ProgramEducationOrganizationId]
           ,[BeginDate]
           ,[IdeaEligibility]
           ,[SpecialEducationSettingDescriptorId]
           ,[SpecialEducationHoursPerWeek]
           ,[SchoolHoursPerWeek]
           ,[MultiplyDisabled]
           ,[MedicallyFragile]
           ,[LastEvaluationDate]
           ,[IEPReviewDate]
           ,[IEPBeginDate]
             ,[IEPEndDate]
           ,[ProgramTypeDescriptorId])
		select 		
				s.StudentUSI
				,ga.EducationOrganizationId
				,ga.ProgramName
				,ga.ProgramEducationOrganizationId 
				,ga.BeginDate
				,ed.IdeaEligibility
				, d.DescriptorId SpecialEducationSetting
				,ed.SpecialEducationHoursPerWeek
				, ed.SchoolHoursPerWeek
				, ed.MultiplyDisabled
				, ed.MedicallyFragile
				, DATEADD(YEAR, 8, ed.LastEvaluationDate)
				, DATEADD(YEAR, 8, ed.IEPReviewDate)
				, DATEADD(YEAR, 8, ed.IEPBeginDate)
				, DATEADD(YEAR, 8, ed.EndDate)
				,ga.ProgramTypeDescriptorId
	     FROM @studentSpecialEd ed
		 JOIN edfi.Student s ON s.StudentUniqueId = ed.StudentQuniqueId
		 JOIN [edfi].[GeneralStudentProgramAssociation] ga ON ga.StudentUSI = s.StudentUSI

		 LEFT JOIN EDFI.Descriptor d ON d.CodeValue = ed.SpecialEducationSetting
		 LEFT JOIN [edfi].[StudentSpecialEducationProgramAssociation] pa ON pa.StudentUSI = s.StudentUSI
		 WHERE pa.StudentUSI IS NULL 

		-- [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])