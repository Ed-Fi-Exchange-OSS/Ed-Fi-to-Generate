-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP09_StaffAssignment]    Script Date: 5/31/2018 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_PersonStatus_MetaEd') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_PersonStatus_MetaEd]
END

GO

CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_PersonStatus_MetaEd]
	@SchoolYear SMALLINT = NULL
	AS
   /*************************************************************************************************************
    Created by:    Andy Tsovma | andriy.tsovma@aemcorp.com 
    Date Created:  9/26/2019

    Purpose:
        

    Assumptions:
        

    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources:  Data Warehouse: edfi.extension.CedsStudentHomelessProgramAssociation

    Data Targets:  Generate Database:   Generate.ODS.PersonProgramParticipation


    Return Values:
    	 0	= Success
       All Errors are Thrown via Try/Catch Block	
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP05_A_PersonStatus_MetaEd] 2018;
    
    Modification Log:
      #	  Date		    Developer	  Issue#	 Description
      --  ----------  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/
    BEGIN

        SET NOCOUNT ON;

		
		IF @SchoolYear IS NULL BEGIN
			SELECT @SchoolYear = d.Year + 1
			FROM rds.DimDateDataMigrationTypes dd 
			JOIN rds.DimDates d 
				ON dd.DimDateId = d.DimDateId 
			JOIN rds.DimDataMigrationTypes b 
				ON b.DimDataMigrationTypesId = dd.DataMigrationTypeId 
			WHERE dd.IsSelected = 1 
				AND DataMigrationTypeCode = 'ODS'
		END 

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------Begin State Specific Information Section----------------------------------------
			---------------------------------------------------------------------------------------------------------------------
			----This section is designed to be unique to each state or ETL instance. The entire ETL past this point has been ----
			----created to work with the data standardized in this location. Do not make any changes to table names or column----
			----names or to any of the code after this section.  The only information that should be modified is the source  ----
			----of this information and any code mappings from a states custom codes over to the applicable CEDS value ----------
			---------------------------------------------------------------------------------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		-- step 1 
		UPDATE Staging.PersonStatus
		SET HomelessServicedIndicator = homelessext.HomelessServicedIndicator
		FROM Staging.PersonStatus ps
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s ON s.StudentUniqueId=ps.Student_Identifier_State
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentHomelessProgramAssociation homeless ON
			homeless.StudentUSI = s.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsStudentHomelessProgramAssociation homelessext 
			ON homeless.BeginDate = homelessext.BeginDate
			AND homeless.EducationOrganizationId = homelessext.EducationOrganizationId
			AND homeless.ProgramEducationOrganizationId = homelessext.ProgramEducationOrganizationId
			AND homeless.ProgramName = homelessext.CedsProgramName
			AND homeless.ProgramTypeDescriptorId = homelessext.ProgramTypeDescriptorId
			AND homeless.StudentUSI = homelessext.StudentUSI
		
		UPDATE Staging.PersonStatus
		SET PerkinsLEPStatus = d.CodeValue
			, PerkinsLEPStatus_StatusStartDate = svs.ServiceBeginDate
			, PerkinsLEPStatus_StatusEndDate = svs.ServiceEndDate
		FROM Staging.PersonStatus ps
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Student s ON s.StudentUniqueId=ps.Student_Identifier_State
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].StudentCTEProgramAssociation cte ON
			cte.StudentUSI = s.StudentUSI
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[extension].CedsStudentCTEProgramAssociation cteext 
			ON cte.BeginDate = cte.BeginDate
			AND cte.EducationOrganizationId = cteext.EducationOrganizationId
			AND cte.ProgramEducationOrganizationId = cteext.ProgramEducationOrganizationId
			AND cte.ProgramName = cteext.ProgramName
			AND cte.ProgramTypeDescriptorId = cteext.ProgramTypeDescriptorId
			AND cte.StudentUSI = cteext.StudentUSI	
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].Descriptor d ON d.DescriptorId = cteext.PerkinsLEPStatusDescriptorId
		JOIN [EdFi_Sample_ODS_Data_For_Generate].[edfi].[StudentCTEProgramAssociationService] svs 
			ON cte.BeginDate = cte.BeginDate
			AND cte.EducationOrganizationId = cteext.EducationOrganizationId
			AND cte.ProgramEducationOrganizationId = cteext.ProgramEducationOrganizationId
			AND cte.ProgramName = cteext.ProgramName
			AND cte.ProgramTypeDescriptorId = cteext.ProgramTypeDescriptorId
			AND cte.StudentUSI = cteext.StudentUSI	

			---------------------------------------------------------------------------------------------------------------------
			-------------------------------------End State Specific Information Section------------------------------------------
			---------------------------------------------------------------------------------------------------------------------

		UPDATE Staging.PersonStatus SET RunDateTime = GETDATE() WHERE (SELECT COUNT(*) FROM Staging.PersonStatus) > 0

		----Validate Staging.StaffAssignment----
		EXEC App.Migrate_Data_Validation 'Migrate_Data_ETL_IMPLEMENTATION_STEP10_A_PersonStatus_MetaEd', 'PersonStatus', @SchoolYear

		SET NOCOUNT OFF;

	END
