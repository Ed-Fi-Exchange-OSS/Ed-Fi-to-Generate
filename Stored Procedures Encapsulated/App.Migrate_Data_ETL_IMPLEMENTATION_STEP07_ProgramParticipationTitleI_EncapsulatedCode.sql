USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_TitleIParticipation]    Script Date: 6/14/2018 4:42:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP07_ProgramParticipationTitleI_EncapsulatedCode]
	@SchoolYear SMALLINT
	AS

		/*************************************************************************************************************
		Date Created:  2/12/2018

		Purpose:
			The purpose of this ETL is to load Title 1 indicators about students for EDFacts reports that apply to the full year.

		Assumptions:
        
		Account executed under: LOGIN

		Approximate run time:  ~ 5 seconds

		Data Sources: 

		Data Targets:  Generate Database:   Generate

		Return Values:
    		 0	= Success
  
		Example Usage: 
		  EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP07_TitleIParticipation];
    
		Modification Log:
		  #	  Date		  Issue#   Description
		  --  ----------  -------  --------------------------------------------------------------------
		  01		  	 
		*************************************************************************************************************/

	BEGIN

		BEGIN TRY
	
			set nocount on;


			--------------------------------------------------------------
			--- Optimize indexes on Staging.ProgramParticipationTitleI --- 
			--------------------------------------------------------------
			ALTER INDEX ALL ON Staging.ProgramParticipationTitleI
			REBUILD WITH (FILLFACTOR = 100, SORT_IN_TEMPDB = ON, STATISTICS_NORECOMPUTE = ON);

			-------------------------------------------------------
			---Update the RefTitleIIndicatorId --------------------
			-------------------------------------------------------

			--Need to add RefTitleIIndicator to the ODS.EdFiReferenceData table


			-------------------------------------------------------
			---Associate the PersonId with the staging table ----
			-------------------------------------------------------

			UPDATE Staging.ProgramParticipationTitleI
			SET PersonID = pid.PersonId
			FROM Staging.ProgramParticipationTitleI mcc
			JOIN ODS.PersonIdentifier pid ON mcc.Student_Identifier_State = pid.Identifier
			WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
				AND pid.RefPersonalInformationVerificationId = App.GetRefPersonalInformationVerificationId('01011')

			--------------------------------------------------------------------
			---Associate the School OrganizationId with the staging table ----
			--------------------------------------------------------------------

			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationID_School = orgid.OrganizationId
			FROM Staging.ProgramParticipationTitleI mcc
			JOIN ODS.OrganizationIdentifier orgid ON mcc.School_Identifier_State = orgid.Identifier
			WHERE orgid.RefOrganizationIdentifierTypeId = [App].[GetOrganizationIdentifierTypeId]('001073')
				AND orgid.RefOrganizationIdentificationSystemId = [App].[GetOrganizationIdentifierSystemId]('SEA', '001073')


			-----------------------------------------------------------------------------
			---Associate the Title I Program OrganizationId with the staging table ----
			-----------------------------------------------------------------------------

			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationID_TitleIProgram = orgd.OrganizationId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.OrganizationRelationship orgr ON tp.OrganizationID_School = orgr.Parent_OrganizationId
			JOIN ODS.OrganizationDetail orgd ON orgr.OrganizationId = orgd.OrganizationId
			JOIN ODS.OrganizationProgramType orgpt ON orgd.OrganizationId = orgpt.OrganizationId
			JOIN ODS.RefProgramType rpt ON orgpt.RefProgramTypeId = rpt.RefProgramTypeId
			WHERE orgd.Name = 'Title I Program'
				AND rpt.Code = '09999'

			--Note: Need to change 09999 to the ID that represents Title I Programs when that is created ---

			--------------------------------------------------
			----Create Title I Indicator for the Student -----
			--------------------------------------------------

			--Check for Title I Records that already exist--
			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationPersonRoleID_TitleIProgram = opr.OrganizationPersonRoleId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.OrganizationPersonRole opr ON tp.PersonID = opr.PersonId
			WHERE tp.OrganizationID_TitleIProgram = opr.OrganizationId
				AND opr.RoleId = App.GetRoleId('K12 Student')
				AND opr.EntryDate = [App].[GetFiscalYearStartDate](@SchoolYear)
				AND opr.ExitDate = [App].[GetFiscalYearEndDate](@SchoolYear)

			--Create an OrganizationPersonRole (Enrollment) into the Title I Program for the last day of the year --

			INSERT INTO [ODS].[OrganizationPersonRole]
			   ([OrganizationId]
			   ,[PersonId]
			   ,[RoleId]
			   ,[EntryDate]
			   ,[ExitDate])
			SELECT DISTINCT
				tp.OrganizationID_TitleIProgram [OrganizationId]
			   ,tp.PersonID [PersonId]
			   ,App.GetRoleId('K12 Student') [RoleId]
			   ,[App].[GetFiscalYearStartDate](@SchoolYear) [EntryDate]
			   ,[App].[GetFiscalYearEndDate](@SchoolYear) [ExitDate] 
			FROM Staging.ProgramParticipationTitleI tp
			WHERE tp.OrganizationPersonRoleID_TitleIProgram IS NULL
				AND tp.OrganizationID_TitleIProgram IS NOT NULL
				AND tp.PersonID IS NOT NULL

			--Update the staging table with the Title I Program OrganizationPersonRoleId

			UPDATE Staging.ProgramParticipationTitleI
			SET OrganizationPersonRoleID_TitleIProgram = opr.OrganizationPersonRoleId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.OrganizationPersonRole opr 
				ON tp.PersonID = opr.PersonId
				AND tp.OrganizationID_TitleIProgram = opr.OrganizationId
			WHERE opr.RoleId = App.GetRoleId('K12 Student')
				AND opr.EntryDate = [App].[GetFiscalYearStartDate](@SchoolYear)
				AND opr.ExitDate = [App].[GetFiscalYearEndDate](@SchoolYear)

			--Check to see if a PersonProgramParticipation already exists for the Title I Program--

			UPDATE Staging.ProgramParticipationTitleI
			SET PersonProgramParticipationId = ppp.PersonProgramParticipationId
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.PersonProgramParticipation ppp 
				ON tp.OrganizationPersonRoleID_TitleIProgram = ppp.OrganizationPersonRoleId
			JOIN ODS.ProgramParticipationTitleI pp 
				ON ppp.PersonProgramParticipationId = pp.PersonProgramParticipationId
				AND pp.RefTitleIIndicatorId = tp.RefTitleIIndicatorId
			WHERE ppp.RecordStartDateTime = [App].[GetFiscalYearStartDate](@SchoolYear)
				AND ppp.RecordEndDateTime = [App].[GetFiscalYearEndDate](@SchoolYear)
			

			--Create a PersonProgramParticipation for each OrganizationPersonRole
			DECLARE @NewPersonProgramParticipationTitleI TABLE (
				  PersonProgramParticipationId INT
				, SourceId INT
			);

			MERGE [ODS].[PersonProgramParticipation] AS TARGET
			USING Staging.ProgramParticipationTitleI AS SOURCE
				ON SOURCE.PersonProgramParticipationId = TARGET.PersonProgramParticipationId
			WHEN NOT MATCHED AND SOURCE.OrganizationPersonRoleID_TitleIProgram IS NOT NULL THEN 
				INSERT 
			   ([OrganizationPersonRoleId]
			   ,[RefParticipationTypeId]
			   ,[RefProgramExitReasonId]
			   ,[RecordStartDateTime]
			   ,[RecordEndDateTime])
			VALUES
			   (OrganizationPersonRoleID_TitleIProgram 
			   ,NULL 
			   ,NULL 
			   ,[App].[GetFiscalYearStartDate](@SchoolYear) 
			   ,[App].[GetFiscalYearEndDate](@SchoolYear))
			OUTPUT
				  INSERTED.PersonProgramParticipationId 
				, SOURCE.ID
			INTO @NewPersonProgramParticipationTitleI;

			--Update the staging table with the new PersonProgramParticipationId
			UPDATE Staging.ProgramParticipationTitleI 
			SET PersonProgramParticipationId = nppp.PersonProgramParticipationId
			FROM Staging.ProgramParticipationTitleI ppi
			JOIN @NewPersonProgramParticipationTitleI nppp
				ON ppi.ID = nppp.SourceId

			--Create a ProgramParticipationTitleI for each PersonProgramParticipation--

			INSERT INTO [ODS].[ProgramParticipationTitleI]
			   ([PersonProgramParticipationId]
			   ,[RefTitleIIndicatorId])
			SELECT DISTINCT
				tp.PersonProgramParticipationId [PersonProgramParticipationId]
			   ,rti.RefTitleIIndicatorId [RefTitleIIndicatorId]
			FROM Staging.ProgramParticipationTitleI tp
			JOIN ODS.SourceSystemReferenceData rd 
				ON tp.TitleIIndicator = rd.InputCode
				AND rd.TableName = 'RefTitleIIndicator'
				AND rd.SchoolYear = @SchoolYear
			JOIN ODS.RefTitleIIndicator rti 
				ON rd.OutputCode = rti.Code
			WHERE tp.PersonProgramParticipationId IS NOT NULL
				AND rti.RefTitleIIndicatorId IS NOT NULL	


			---Add in validation and error checking in this location --

			set nocount off;


		END TRY
		BEGIN CATCH



		END CATCH; 

	END



