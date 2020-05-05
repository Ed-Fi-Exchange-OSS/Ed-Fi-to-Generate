/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [StaffUSI]
      ,[ProgramAssignmentDescriptorId]
      ,[SchoolId]
      ,[SchoolYear]
      ,[Id]
      ,[LastModifiedDate]
      ,[CreateDate]
      ,[CalendarCode]
      ,[Discriminator]
  FROM [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StaffSchoolAssociation]
  where [ProgramAssignmentDescriptorId] = 576

  Update [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StaffSchoolAssociation]
  set [ProgramAssignmentDescriptorId] = 576
  where [StaffUSI] in (8, 10)

  use EdFi_Sample_ODS_Data_For_Generate
  select * from edfi.StaffSchoolAssociationAcademicSubject
  
  update edfi.StaffSchoolAssociationAcademicSubject
  set [ProgramAssignmentDescriptorId] = 576
  where [StaffUSI] in (8)

  Update [edfi].[StaffSchoolAssociationGradeLevel]
    set [ProgramAssignmentDescriptorId] = 576
  where [StaffUSI] in (8, 10)