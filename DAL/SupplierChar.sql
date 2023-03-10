USE [ERP_Accounts]
GO
/****** Object:  StoredProcedure [dbo].[sprPaymentRegisterSupplierChart]    Script Date: 1/12/2023 11:55:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mowaz Ahmad
-- Create date: 12 December-2022
-- Description:	This is Payment Register Add Supplier chart of Account

/*

exec [dbo].[sprPaymentRegisterSupplierChart] 1,15,0

exec [dbo].[sprPaymentRegisterSupplierChart] 2,15,34016

exec [dbo].[sprPaymentRegisterSupplierChart] 4,0,0

exec [dbo].[sprPaymentRegisterSupplierChart] 5,61632,0
*/
-- =============================================

ALTER PROCEDURE [dbo].[sprPaymentRegisterSupplierChart]
  @inttype int,@intUnitID INT,@intAccountId int
AS
BEGIN
SET NOCOUNT ON

	if(@inttype=1)
	begin
 
		Select ROW_NUMBER() OVER (ORDER BY strSupplierName), s.intSupplierID, strSupplierName, strSupplierType, s.intCOAID, coa.strCode, coa.strAccName 
		From ERP_Inventory.dbo.tblSupplier s 
		LEFT JOIN ERP_Accounts.dbo.tblAccountsChartOfAcc coa on s.intCOAID=coa.intAccID 
		Where s.intUnitID=@intUnitID
		AND s.ysnActive=1 
		AND s.strSupplierType 
		IS NOT NULL and ISNULL(s.intCOAID,0)= 0 
		ORDER BY strSupplierName
	end
	else if (@inttype=2)
	begin
		Exec sprGetAccountsByParentandUnit @intAccountId,@intUnitID
	end
	else if(@inttype=3)
	begin
		SELECT intAccID FROM ERP_Accounts.dbo.tblAccountsChartOfAcc WHERE intAccTemplateID=1427 AND intUnitID=@intUnitID
	end
	else if(@inttype=4)
	begin
		SELECT intUnitID, strUnit FROM ERP_HR.dbo.tblUnit WHERE (ysnPFUnit = 0) AND (intUnitID NOT IN (80, 103, 127, 133))
	end
	else if(@inttype=5)
	begin
		UPDATE ERP_Inventory.dbo.tblSupplier SET intCOAID=@intUnitID WHERE intSupplierID=@intAccountId
	end

 
END


