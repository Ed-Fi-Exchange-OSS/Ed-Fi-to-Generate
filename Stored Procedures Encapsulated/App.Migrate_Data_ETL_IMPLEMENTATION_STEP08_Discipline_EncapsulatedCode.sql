USE [generate]
GO
/****** Object:  StoredProcedure [App].[Migrate_Data_ETL_STEP02_Discipline]    Script Date: 10/20/2017 10:45:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode') BEGIN
	DROP PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode]
END

GO


CREATE PROCEDURE [App].[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode] 
	@SchoolYear SMALLINT
AS 
  /*************************************************************************************************************
    Date Created:  2/12/2018

    Purpose:
        The purpose of this ETL is to load the data for membership (C052) and Special Education Child Count
		(C002, C089).

    Assumptions:
        
    Account executed under: LOGIN

    Approximate run time:  ~ 5 seconds

    Data Sources: 

    Data Targets:  Generate Database:   Generate

    Return Values:
    	 0	= Success
  
    Example Usage: 
      EXEC App.[Migrate_Data_ETL_IMPLEMENTATION_STEP08_Discipline_EncapsulatedCode];
    
    Modification Log:
      #	  Date		  Issue#   Description
      --  ----------  -------  --------------------------------------------------------------------
      01		  	 
    *************************************************************************************************************/

BEGIN

	BEGIN TRY
	
		set nocount on;

		-------------------------------------------------------
		----Grab the student person and enrollment records ----
		-------------------------------------------------------

		UPDATE Staging.Discipline 
		SET   PersonId = pid.PersonId
			, OrganizationPersonRoleId_School = opr.OrganizationPersonRoleId
			, OrganizationId_School = oid.OrganizationId
		FROM Staging.Discipline d 
		JOIN ODS.PersonIdentifier pid 
			ON pid.Identifier = d.Student_Identifier_State
		JOIN ODS.OrganizationIdentifier oid 
			ON oid.Identifier = d.School_Identifier_State
		JOIN ODS.OrganizationPersonRole opr 
			ON pid.PersonId = opr.PersonId
			AND oid.OrganizationId = opr.OrganizationId
			AND d.DisciplinaryActionStartDate BETWEEN opr.EntryDate AND ISNULL(opr.ExitDate, GETDATE())
		
		-------------------------------------------------------------------------------------------------
		----Merge Incident records so that we don't create duplicate discipline entries accidentally ----
		-------------------------------------------------------------------------------------------------

		DECLARE @NewIncidents TABLE (
			  IncidentId INT
			, IncidentIdentifier VARCHAR(40)
			, OrganizationPersonRoleId INT
		)

		MERGE ODS.Incident AS TARGET
		USING Staging.Discipline AS SOURCE 
			ON TARGET.IncidentIdentifier = SOURCE.IncidentIdentifier
		WHEN NOT MATCHED THEN 
			INSERT VALUES (
				  SOURCE.IncidentIdentifier
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, SOURCE.OrganizationPersonRoleId_School
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
				, NULL
			)
		OUTPUT 
			  INSERTED.IncidentId
			, SOURCE.IncidentIdentifier
			, SOURCE.OrganizationPersonRoleId_School
		INTO @NewIncidents;


		-------------------------------------------
		----Merge K12StudentDiscipline records ----
		-------------------------------------------
		-- We cannot update the records in K12StudentDiscipline without K12StudentDisciplineId, so we have to kill & fill the table 
		DELETE FROM [ODS].[K12StudentDiscipline]
		FROM [ODS].[K12StudentDiscipline] sd
		JOIN Staging.Discipline d
			ON sd.IncidentId = d.IncidentId
			AND sd.OrganizationPersonRoleId = d.OrganizationPersonRoleId_School

		INSERT INTO [ODS].[K12StudentDiscipline]
           ([OrganizationPersonRoleId]
           ,[RefDisciplineReasonId]
           ,[RefDisciplinaryActionTakenId]
           ,[DisciplinaryActionStartDate]
           ,[DisciplinaryActionEndDate]
           ,[DurationOfDisciplinaryAction]
           ,[RefDisciplineLengthDifferenceReasonId]
           ,[FullYearExpulsion]
           ,[ShortenedExpulsion]
           ,[EducationalServicesAfterRemoval]
           ,[RefIdeaInterimRemovalId]
           ,[RefIdeaInterimRemovalReasonId]
           ,[RelatedToZeroTolerancePolicy]
           ,[IncidentId]
           ,[IEPPlacementMeetingIndicator]
           ,[RefDisciplineMethodFirearmsId]
           ,[RefDisciplineMethodOfCwdId]
           ,[RefIDEADisciplineMethodFirearmId])
		SELECT DISTINCT
            d.OrganizationPersonRoleId_School [OrganizationPersonRoleId]
           ,dr.RefDisciplineReasonId [RefDisciplineReasonId]
           ,dat.RefDisciplinaryActionTakenId [RefDisciplinaryActionTakenId]
           ,d.DisciplinaryActionStartDate [DisciplinaryActionStartDate]
           ,CASE WHEN d.DisciplinaryActionEndDate IS NULL THEN DisciplinaryActionStartDate
				ELSE d.DisciplinaryActionEndDate END [DisciplinaryActionEndDate]
           ,d.DurationOfDisciplinaryAction [DurationOfDisciplinaryAction]
           ,NULL [RefDisciplineLengthDifferenceReasonId]
           ,NULL [FullYearExpulsion]
           ,NULL [ShortenedExpulsion]
           ,d.EducationalServicesAfterRemoval [EducationalServicesAfterRemoval]
           ,iir.RefIdeaInterimRemovalId [RefIdeaInterimRemovalId]
           ,iirr.RefIdeaInterimRemovalReasonId [RefIdeaInterimRemovalReasonId]
           ,NULL [RelatedToZeroTolerancePolicy]
           ,i.IncidentId [IncidentId]
           ,NULL [IEPPlacementMeetingIndicator]
           ,NULL [RefDisciplineMethodFirearmsId]
           ,dm.RefDisciplineMethodOfCwdId [RefDisciplineMethodOfCwdId]
           ,NULL [RefIDEADisciplineMethodFirearmId]
		FROM ODS.Person p
		JOIN ODS.PersonIdentifier pid ON p.PersonID = pid.PersonId
		JOIN Staging.Discipline d ON pid.Identifier = d.Student_Identifier_State
		JOIN @NewIncidents i ON d.IncidentIdentifier = i.IncidentIdentifier
			AND d.OrganizationPersonRoleId_School = i.OrganizationPersonRoleId
		LEFT JOIN ods.SourceSystemReferenceData rddr
			ON d.DisciplineReason = rddr.InputCode
			AND rddr.TableName = 'RefDisciplineReason'
			AND rddr.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefDisciplineReason dr
			ON rddr.OutputCode = dr.Code
		LEFT JOIN ods.SourceSystemReferenceData rdda
			ON d.DisciplinaryActionTaken = rdda.InputCode
			AND rdda.TableName = 'RefDisciplinaryActionTaken'
			AND rdda.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefDisciplinaryActionTaken dat
			ON rdda.OutputCode = dat.Code
		LEFT JOIN ods.SourceSystemReferenceData rdiir
			ON d.IdeaInterimRemoval = rdiir.InputCode
			AND rdiir.TableName = 'RefIdeaInterimRemoval'
			AND rdiir.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefIdeaInterimRemoval iir
			ON rdiir.OutputCode = iir.Code
		LEFT JOIN ods.SourceSystemReferenceData rdiirr
			ON d.IdeaInterimRemovalReason = rdiirr.InputCode
			AND rdiirr.TableName = 'RefIdeaInterimRemovalReason'
			AND rdiirr.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefIdeaInterimRemovalReason iirr
			ON rdiirr.OutputCode = iirr.Code
		LEFT JOIN ods.SourceSystemReferenceData rdidm
			ON d.DisciplineMethodOfCwd = rdidm.InputCode
			AND rdidm.TableName = 'RefDisciplineMethodOfCwd'
			AND rdidm.SchoolYear = @SchoolYear
		LEFT JOIN ods.RefDisciplineMethodOfCwd dm
			ON rdidm.OutputCode = dm.Code
		WHERE pid.RefPersonIdentificationSystemId = App.GetRefPersonIdentificationSystemId('State', '001075')
			AND d.OrganizationPersonRoleId_School IS NOT NULL


		--------------------------------------------------------------------------------------------------
		---- Update Educational Services After Removal based on Disciplinary Action Taken If NULL Value --
		--------------------------------------------------------------------------------------------------

		UPDATE ODS.K12StudentDiscipline
		SET EducationalServicesAfterRemoval = 1
		FROM ODS.K12StudentDiscipline ksd
		JOIN ODS.RefDisciplinaryActionTaken dat ON ksd.RefDisciplinaryActionTakenId = dat.RefDisciplinaryActionTakenId
		WHERE dat.Code IN ('03086', '03101')
		AND ksd.EducationalServicesAfterRemoval IS NULL

		UPDATE ODS.K12StudentDiscipline SET EducationalServicesAfterRemoval = 0 WHERE EducationalServicesAfterRemoval IS NULL



		set nocount off;

	END TRY
	BEGIN CATCH

		declare @msg as nvarchar(max)
		set @msg = ERROR_MESSAGE()

		declare @sev as int
		set @sev = ERROR_SEVERITY()

		RAISERROR(@msg, @sev, 1)

	END CATCH; 

END

