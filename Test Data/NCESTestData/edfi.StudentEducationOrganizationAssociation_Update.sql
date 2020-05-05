/****** Script for SelectTopNRows command from SSMS  ******/

INSERT INTO [edfi].[StudentEducationOrganizationAssociation]
           ([StudentUSI]
           ,[EducationOrganizationId]
           ,[LastModifiedDate]
           ,[CreateDate]
           ,[LimitedEnglishProficiencyDescriptorId]
           ,[SexDescriptorId]
)
SELECT  ga.[StudentUSI]
		,ga.EducationOrganizationId
		,ga.LastModifiedDate
		,ga.CreateDate
		, 564
      ,1387
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[GeneralStudentProgramAssociation] ga
 left JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentEducationOrganizationAssociation] sa ON ga.StudentUSI = sa.StudentUSI
    where sa.StudentUSI is null