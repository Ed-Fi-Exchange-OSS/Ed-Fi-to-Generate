use EdFi_Sample_ODS_Data_For_Generate
IF EXISTS (SELECT 1 from INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'XMLTemp')
	DROP TABLE XMLTemp
GO

CREATE TABLE XMLTemp
(
	Id INT IDENTITY PRIMARY KEY,
	XMLData XML,
	CreatedDateTime DATETIME
)

INSERT INTO XMLTemp(XMLData, CreatedDateTime)
SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
FROM OPENROWSET(BULK 'C:\Repos\generate-etl\Test Data\StudentEnrollment.xml', SINGLE_BLOB) AS x;

BEGIN TRANSACTION
BEGIN TRY

  INSERT INTO [edfi].[Calendar]
           ([CalendarCode]
           ,[SchoolId]
           ,[SchoolYear]
           ,[CalendarTypeDescriptorId]
		)
   SELECT 
   data.CalendarCode
   ,data.SchoolId
   ,data.SchoolYear
   ,d.DescriptorId
   FROM
   (
	SELECT 2010605675 CalendarCode
	,'Student Specific' CalendarType
	, 255901107 SchoolId
    , 2010 SchoolYear
	) data
	LEFT JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d on d.CodeValue = data.CalendarType
	LEFT JOIN [edfi].[Calendar] C on c.CalendarCode = data.CalendarCode and c.SchoolId = data.SchoolId and c.SchoolYear = data.SchoolYear
	where c.CalendarCode IS NULL

 ;WITH XMLNAMESPACES 
('http://ed-fi.org/0300' AS ns)

INSERT INTO [edfi].[GraduationPlan]
           ([GraduationPlanTypeDescriptorId]
           ,[EducationOrganizationId]
           ,[GraduationSchoolYear]
           ,[TotalRequiredCredits])
SELECT d.DescriptorId
	, gp.EducationOrganizationId
	, SchoolYear
	, Credits
 FROM 
(
  SELECT (select top 1 token from  [util].[Split](c.value('(ns:GraduationPlanType)[1]', 'nvarchar(256)'), '#') order by id desc)  as GraduationPlanType
  ,c.value('(ns:TotalRequiredCredits/ns:Credits)[1]', 'decimal(9,3)') as Credits
  ,c.value('(ns:EducationOrganizationReference/ns:EducationOrganizationIdentity/ns:EducationOrganizationId)[1]', 'int') as EducationOrganizationId
  ,SUBSTRING(c.value('(ns:GraduationSchoolYear)[1]', 'nvarchar(64)'), 1, 4) as SchoolYear
 FROM dbo.XMLTemp s
 cross apply XMLData.nodes('/ns:InterchangeStudentEnrollment/ns:GraduationPlan') M(c)
 ) GP 
 INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d On d.CodeValue = GP.GraduationPlanType 
 left join [edfi].[GraduationPlan] gpt on gpt.GraduationPlanTypeDescriptorId = d.DescriptorId and gpt.EducationOrganizationId = gp.EducationOrganizationId and gpt.GraduationSchoolYear = gp.SchoolYear
 where d.Namespace = 'uri://ed-fi.org/GraduationPlanTypeDescriptor'
 and gpt.EducationOrganizationId IS NULL

;WITH XMLNAMESPACES 
('http://ed-fi.org/0300' AS ns)

INSERT INTO [edfi].[StudentSchoolAssociation]
           ([StudentUSI]
           ,[SchoolId]
           ,[SchoolYear]
           ,[EntryDate]
           ,[EntryGradeLevelDescriptorId]
           ,[EducationOrganizationId]
           ,[GraduationPlanTypeDescriptorId]
           ,[GraduationSchoolYear]
           ,[CalendarCode]
)
Select 
st.StudentUSI
,SchoolId
,stsch.SchoolYear
,EntryDate
,grade.DescriptorId gradelevel
,SchoolId
--,EntryGradeLevel
--,GraduationPlanReference
, grdplan.DescriptorId graduationplan
,SUBSTRING(grdplan.GraduationSchoolYear, 1, 4)
,CalendarCode
--,gradelvl.DescriptorId
--,gradplan.DescriptorId
from (
  SELECT  c.value('(ns:StudentReference/ns:StudentIdentity/ns:StudentUniqueId)[1]', 'int') as StudentUniqueId
  ,c.value('(ns:SchoolReference/ns:SchoolIdentity/ns:SchoolId)[1]', 'int') as SchoolId
  ,c.value('(ns:EntryDate)[1]', 'date') as EntryDate
 -- ,c.value('(ns:EntryGradeLevel)[1]', 'nvarchar(256)') as EntryGradeLevel
  ,(select top 1 token from  [util].[Split](c.value('(ns:EntryGradeLevel)[1]', 'nvarchar(256)'), '#') order by id desc) as EntryGradeLevel
  ,c.value('(ns:GraduationPlanReference/@ref)[1]', 'nvarchar(256)') as GraduationPlanReference
  ,c.value('(ns:CalendarReference/ns:CalendarIdentity/ns:CalendarCode)[1]', 'int') as CalendarCode
  ,SUBSTRING(c.value('(ns:CalendarReference/ns:CalendarIdentity/ns:SchoolYear)[1]', 'nvarchar(64)'), 1, 4) as SchoolYear
 FROM dbo.XMLTemp s
 cross apply XMLData.nodes('/ns:InterchangeStudentEnrollment/ns:StudentSchoolAssociation') M(c)
 ) stsch
  INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student st ON st.StudentUniqueId = stsch.StudentUniqueId
  INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] grade ON grade.CodeValue = stsch.EntryGradeLevel and Namespace = 'uri://ed-fi.org/GradeLevelDescriptor'
 INNER JOIN 
 (
	 SELECT d.DescriptorId
		, EducationOrganizationId
		, GraduationSchoolYear
		, Credits
		, GraduationPlanId
	 FROM 
	(
	  SELECT (select top 1 token from  [util].[Split](c.value('(ns:GraduationPlanType)[1]', 'nvarchar(256)'), '#') order by id desc)  as GraduationPlanType
	  ,c.value('(ns:TotalRequiredCredits/ns:Credits)[1]', 'decimal(9,3)') as Credits
	  ,c.value('(ns:EducationOrganizationReference/ns:EducationOrganizationIdentity/ns:EducationOrganizationId)[1]', 'int') as EducationOrganizationId
	  ,c.value('(ns:GraduationSchoolYear)[1]', 'nvarchar(64)') as GraduationSchoolYear
	  ,c.value('(@id)[1]', 'nvarchar(256)') as GraduationPlanId
	 FROM dbo.XMLTemp s
	 cross apply XMLData.nodes('/ns:InterchangeStudentEnrollment/ns:GraduationPlan') M(c)
	 ) GP 
	 INNER JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[Descriptor] d On d.CodeValue = GP.GraduationPlanType 
	 where d.Namespace = 'uri://ed-fi.org/GraduationPlanTypeDescriptor'
 ) grdplan on grdplan.GraduationPlanId = stsch.GraduationPlanReference

 COMMIT
 END TRY
 BEGIN CATCH
 print 'rollback'
 print ERROR_MESSAGE ( ) 
 ROLLBACK
 END CATCH