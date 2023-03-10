USE [ERP_Accounts]
GO
/****** Object:  StoredProcedure [dbo].[sprPaymentRegisterSubAccount]    Script Date: 1/12/2023 11:55:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mowaz Ahmad
-- Create date: 26 December-2022
-- Description:	This is Payment Register Add Supplier chart of Account

/*

exec [dbo].[sprPaymentRegisterSubAccount] 1,15,0

exec [dbo].[sprPaymentRegisterSubAccount] 2,0,0

exec [dbo].[sprPaymentRegisterSubAccount] 3,0,0

exec [dbo].[sprPaymentRegisterSubAccount] 4,34902,7543
*/
-- =============================================

ALTER PROCEDURE [dbo].[sprPaymentRegisterSubAccount]
  @inttype int,@intUnitID INT,@intAccountId int
AS
BEGIN
SET NOCOUNT ON

	if(@inttype=1)
	begin
 
		SELECT em.strEmployeeName +' (' + desg.strDesignation +', ' + dept.strDepatrment + ')' AS strEmployee, em.intEmployeeID 
		FROM ERP_Accounts.dbo.tblSubAccountsUnitByUser su 
		JOIN ERP_HR.dbo.tblEmployee em ON su.intEmployeeID=em.intEmployeeID 
		JOIN ERP_HR.dbo.tblUserDesignation desg ON em.intDesignationID=desg.intDesignationID 
		JOIN ERP_HR.dbo.tblDepartment dept ON em.intDepartmentID=dept.intDepartmentID 
		WHERE em.ysnActive=1 AND su.intAccUnitID=@intUnitID

	end
	else if(@inttype=2)
	begin
		SELECT intUnitID, strUnit FROM ERP_HR.dbo.tblUnit WHERE (ysnPFUnit = 0) AND (intUnitID NOT IN (80, 103, 127, 133))
	end
	else if (@inttype=3)
	begin
		SELECT strAccountType, intAccountType FROM ERP_Accounts.dbo.tblSubAccountsType
	end
	else if(@inttype=4)
	begin
		SELECT count(intCOAID) as coaValue FROM ERP_Accounts.dbo.tblSubAccountsChartOfAccByUser WHERE intCOAID=@intUnitID AND intEmployeeID=@intAccountId
	end
 
END


