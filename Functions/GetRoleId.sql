USE [generate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_SCHEMA = 'APP' AND ROUTINE_NAME = 'GetRoleId') BEGIN
	DROP FUNCTION [App].[GetRoleId]
END

GO

CREATE FUNCTION App.GetRoleId (@RoleName VARCHAR(30))
RETURNS INT
AS BEGIN
	DECLARE @RoleId INT
	
          SELECT @RoleId = RoleID
          FROM ods.[Role]
          WHERE [Name] = @RoleName
		  
	RETURN (@RoleId)
END