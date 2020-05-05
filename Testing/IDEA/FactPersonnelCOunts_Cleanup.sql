use generate

truncate table rds.FactOrganizationCounts
truncate table rds.FactStudentDisciplines
truncate table rds.FactPersonnelCounts
truncate table rds.FactStudentCounts
truncate table rds.FactStudentAssessments

delete from [RDS].[DimSchools]
delete from rds.DimLeas
delete from rds.DimSeas
delete from rds.DimStudents
delete from [RDS].[BridgePersonnelDate]
delete from rds.DimPersonnel

delete  from rds.FactOrganizationCountReports
--select * from rds.FactStudentAssessments where ReportCode ='c130'

ALTER DATABASE generate SET RECOVERY SIMPLE

select object_name(id) from syscomments where text like '%Danger%'
