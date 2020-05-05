use generate
DECLARE @SchoolYear INT
SET @SchoolYear = 2018

exec [App].[Migrate_Data_ETL_PRELIMINARY_STEP01_CompletelyClearDataFromODS] @SchoolYear


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_A_Organization_MetaEd] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP01_Organization_EncapsulatedCode] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person] 2018


EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP02_Person_EncapsulatedCode] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment] 2018

EXEC [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP03_Enrollment_EncapsulatedCode] 2018

exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation] 2018

exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP04_ProgramParticipationSpecialEducation_EncapsulatedCode] 2018


exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment] @SchoolYear

exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_A_StaffAssignment_MetaEd] 2018

exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment_EncapsulatedCode] @SchoolYear


exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus] 2018


exec  [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP11_PersonStatus_EncapsulatedCode] 2018


--exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP15_ProgramParticipationTitleIII] 2018

--exec [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP14_ProgramParticipationCTE_EncapsulatedCode] 2018
