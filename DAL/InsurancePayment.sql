USE [ERP_Inventory]
GO
/****** Object:  StoredProcedure [dbo].[sprImportReportInsurancePayment]    Script Date: 1/12/2023 12:01:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Jayed>
-- Create date: <Create Date, January 15, 2015>
-- Description:	<Description,Get Insurance Detail By Unit Agent and Lc Number>
-- ERP_Inventory.dbo.sprImportReportInsurancePayment 15,@intAgent=7,  @fDate= '2022-12-23', @tDate='2022-12-24', @strFilter='Bill Forward', @intStatus=0
-- =============================================
ALTER PROCEDURE [dbo].[sprImportReportInsurancePayment]
	@intUnit INT= NULL, @intAgent INT=NULL, @fDate Date, @tDate Date, @strFilter VARCHAR(100)=NULL, @intStatus INT=NULL
AS
BEGIN
	
	DECLARE @tblReturn TABLE (intID INT IDENTITY(1,1), intPolicy INT, strLC VARCHAR(50), dteLcDate DATE, intPO INT, strCN VARCHAR(250), dteCnDate DATE, strPolicy VARCHAR(250),
	dtePolicyDate DATE, strBlNo VARCHAR(250), dteBlDate DATE, monInvoice MONEY, strCurrency VARCHAR(250), monPolicy MONEY, monPremium MONEY, monVAT MONEY,
	monStamp MONEY, monTotal MONEY, monDiscount MONEY, strBillForward VARCHAR(50), intBill INT, strPay VARCHAR(50), strDiscountRcv VARCHAR (50))

	IF @intStatus=2 
	BEGIN
		INSERT INTO @tblReturn (intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
		monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv)

		SELECT pol.intPolicyID, lc.strLCNumber, lc.dteLcDate, pol.intPOID, cn.strCNoteNumber, cn.dteCNDate, pol.strPolicyNumber, CAST(pol.dteInsertTime AS DATE), 
		pol.monInvoiceAmount, curr.strCurrencyName+' @ '+ CAST(pol.monExchangeRate as varchar(50)), 
		pol.monInsuredTk, pol.monPremiumTotalTk, pol.monVatTk, pol.monStampTk, pol.monPremiumTotalTk+ pol.monVatTk+ pol.monStampTk, pol.monPremiumRebateTk,
		CASE ISNULL(pol.ysnBillForward,0) WHEN 1 THEN 'Forwarded' ELSE 'Pending' END, br.intBillID, CASE pr.ysnPaid WHEN 1 THEN 'Paid' ELSE 'Pending' END, 
		CASE ISNULL(pol.ysnDiscountReceive,0) WHEN 1 THEN 'Received' ELSE 'Pending' END       
		FROM ERP_Inventory.dbo.tblImportInsuranceShipmentWisePolicy pol JOIN ERP_Inventory.dbo.tblImportInsuranceCoverNote cn ON pol.intLcID=cn.intLcID 
		JOIN ERP_Inventory.dbo.tblImportLC lc ON pol.intLcID=lc.intLCID  
		JOIN ERP_Inventory.dbo.tblCurrencyConversion curr ON lc.intCurrency=curr.intCurrencyID
		LEFT JOIN ERP_Payment.dbo.tblBillRegister br ON CAST(pol.intPOID AS VARCHAR(20))=br.strReffNo 
		LEFT JOIN ERP_Payment.dbo.tblPaymentRequest pr ON br.intBillID=pr.intBillID 
		WHERE CAST(pol.dteInsertTime AS DATE) BETWEEN @fDate AND @tDate AND pol.intUnit=@intUnit AND cn.intInsProvider=@intAgent 
		ORDER BY pol.intPolicyID
	END
	ELSE IF @strFilter='Bill Forward' AND @intStatus=0
	BEGIN
		INSERT INTO @tblReturn (intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
		monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv)

		SELECT pol.intPolicyID, lc.strLCNumber, lc.dteLcDate, pol.intPOID, cn.strCNoteNumber, cn.dteCNDate, pol.strPolicyNumber, CAST(pol.dteInsertTime AS DATE), 
		pol.monInvoiceAmount, curr.strCurrencyName+' @ '+ CAST(pol.monExchangeRate as varchar(50)), 
		pol.monInsuredTk, pol.monPremiumTotalTk, pol.monVatTk, pol.monStampTk, pol.monPremiumTotalTk+ pol.monVatTk+ pol.monStampTk, pol.monPremiumRebateTk,
		CASE ISNULL(pol.ysnBillForward,0) WHEN 1 THEN 'Forwarded' ELSE 'Pending' END, br.intBillID, CASE pr.ysnPaid WHEN 1 THEN 'Paid' ELSE 'Pending' END, 
		CASE ISNULL(pol.ysnDiscountReceive,0) WHEN 1 THEN 'Received' ELSE 'Pending' END       
		FROM ERP_Inventory.dbo.tblImportInsuranceShipmentWisePolicy pol JOIN ERP_Inventory.dbo.tblImportInsuranceCoverNote cn ON pol.intLcID=cn.intLcID 
		JOIN ERP_Inventory.dbo.tblImportLC lc ON pol.intLcID=lc.intLCID 
		JOIN ERP_Inventory.dbo.tblCurrencyConversion curr ON lc.intCurrency=curr.intCurrencyID
		LEFT JOIN ERP_Payment.dbo.tblBillRegister br ON CAST(pol.intPOID AS VARCHAR(20))=br.strReffNo 
		LEFT JOIN ERP_Payment.dbo.tblPaymentRequest pr ON br.intBillID=pr.intBillID
		WHERE ISNULL(pol.ysnBillForward,0)=0 AND pol.intUnit=@intUnit AND cn.intInsProvider=@intAgent
		ORDER BY pol.intPolicyID			
	END
	ELSE IF @strFilter='Bill Forward' AND @intStatus=1
	BEGIN
		INSERT INTO @tblReturn (intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
		monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv)

		SELECT 
		pol.intPolicyID, 
		lc.strLCNumber, 
		lc.dteLcDate, 
		pol.intPOID, 
		cn.strCNoteNumber, 
		cn.dteCNDate, 
		pol.strPolicyNumber, 
		CAST(pol.dteInsertTime AS DATE), 
		pol.monInvoiceAmount, 
		curr.strCurrencyName+' @ '+ CAST(pol.monExchangeRate as varchar(50)), 
		pol.monInsuredTk, 
		pol.monPremiumTotalTk, 
		pol.monVatTk, 
		pol.monStampTk, 
		pol.monPremiumTotalTk+ pol.monVatTk+ pol.monStampTk, 
		pol.monPremiumRebateTk,
		CASE ISNULL(pol.ysnBillForward,0) WHEN 1 THEN 'Forwarded' ELSE 'Pending' END, 
		br.intBillID, 
		CASE pr.ysnPaid WHEN 1 THEN 'Paid' ELSE 'Pending' END, 
		CASE ISNULL(pol.ysnDiscountReceive,0) WHEN 1 THEN 'Received' ELSE 'Pending' END
		
		FROM ERP_Inventory.dbo.tblImportInsuranceShipmentWisePolicy pol JOIN ERP_Inventory.dbo.tblImportInsuranceCoverNote cn ON pol.intLcID=cn.intLcID 
		JOIN ERP_Inventory.dbo.tblImportLC lc ON pol.intLcID=lc.intLCID 
		JOIN ERP_Inventory.dbo.tblCurrencyConversion curr ON lc.intCurrency=curr.intCurrencyID
		LEFT JOIN ERP_Payment.dbo.tblBillRegister br ON CAST(pol.intPOID AS VARCHAR(20))=br.strReffNo 
		LEFT JOIN ERP_Payment.dbo.tblPaymentRequest pr ON br.intBillID=pr.intBillID
		WHERE ISNULL(pol.ysnBillForward,0)=1 AND pol.intUnit=@intUnit AND cn.intInsProvider=@intAgent AND CAST(pol.dteInsertTime AS DATE) BETWEEN @fDate AND @tDate
		ORDER BY pol.intPolicyID			
	END
	ELSE IF @strFilter='Payment' AND @intStatus=0
	BEGIN
		INSERT INTO @tblReturn (intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
		monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv)

		SELECT pol.intPolicyID, lc.strLCNumber, lc.dteLcDate, pol.intPOID, cn.strCNoteNumber, cn.dteCNDate, pol.strPolicyNumber, CAST(pol.dteInsertTime AS DATE), 
		pol.monInvoiceAmount, curr.strCurrencyName+' @ '+ CAST(pol.monExchangeRate as varchar(50)), 
		pol.monInsuredTk, pol.monPremiumTotalTk, pol.monVatTk, pol.monStampTk, pol.monPremiumTotalTk+ pol.monVatTk+ pol.monStampTk, pol.monPremiumRebateTk,
		CASE ISNULL(pol.ysnBillForward,0) WHEN 1 THEN 'Forwarded' ELSE 'Pending' END, br.intBillID, CASE pr.ysnPaid WHEN 1 THEN 'Paid' ELSE 'Pending' END, 
		CASE ISNULL(pol.ysnDiscountReceive,0) WHEN 1 THEN 'Received' ELSE 'Pending' END       
		FROM ERP_Inventory.dbo.tblImportInsuranceShipmentWisePolicy pol JOIN ERP_Inventory.dbo.tblImportInsuranceCoverNote cn ON pol.intLcID=cn.intLcID 
		JOIN ERP_Inventory.dbo.tblImportLC lc ON pol.intLcID=lc.intLCID 
		JOIN ERP_Inventory.dbo.tblCurrencyConversion curr ON lc.intCurrency=curr.intCurrencyID
		LEFT JOIN ERP_Payment.dbo.tblBillRegister br ON CAST(pol.intPOID AS VARCHAR(20))=br.strReffNo 
		LEFT JOIN ERP_Payment.dbo.tblPaymentRequest pr ON br.intBillID=pr.intBillID
		WHERE ISNULL(pol.ysnBillForward,0)=0 AND pol.intUnit=@intUnit AND cn.intInsProvider=@intAgent
		ORDER BY pol.intPolicyID			
	END
	ELSE IF @strFilter='Payment' AND @intStatus=1
	BEGIN
		INSERT INTO @tblReturn (intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
		monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv)

		SELECT pol.intPolicyID, lc.strLCNumber, lc.dteLcDate, pol.intPOID, cn.strCNoteNumber, cn.dteCNDate, pol.strPolicyNumber, CAST(pol.dteInsertTime AS DATE), 
		pol.monInvoiceAmount, curr.strCurrencyName+' @ '+ CAST(pol.monExchangeRate as varchar(50)), 
		pol.monInsuredTk, pol.monPremiumTotalTk, pol.monVatTk, pol.monStampTk, pol.monPremiumTotalTk+ pol.monVatTk+ pol.monStampTk, pol.monPremiumRebateTk,
		CASE ISNULL(pol.ysnBillForward,0) WHEN 1 THEN 'Forwarded' ELSE 'Pending' END, br.intBillID, CASE pr.ysnPaid WHEN 1 THEN 'Paid' ELSE 'Pending' END, 
		CASE ISNULL(pol.ysnDiscountReceive,0) WHEN 1 THEN 'Received' ELSE 'Pending' END       
		FROM ERP_Inventory.dbo.tblImportInsuranceShipmentWisePolicy pol JOIN ERP_Inventory.dbo.tblImportInsuranceCoverNote cn ON pol.intLcID=cn.intLcID 
		JOIN ERP_Inventory.dbo.tblImportLC lc ON pol.intLcID=lc.intLCID 
		JOIN ERP_Inventory.dbo.tblCurrencyConversion curr ON lc.intCurrency=curr.intCurrencyID
		LEFT JOIN ERP_Payment.dbo.tblBillRegister br ON CAST(pol.intPOID AS VARCHAR(20))=br.strReffNo 
		LEFT JOIN ERP_Payment.dbo.tblPaymentRequest pr ON br.intBillID=pr.intBillID
		WHERE ISNULL(pol.ysnBillForward,0)=0 AND pol.intUnit=@intUnit AND cn.intInsProvider=@intAgent AND CAST(pol.dteInsertTime AS DATE) BETWEEN @fDate AND @tDate
		ORDER BY pol.intPolicyID			
	END
	ELSE IF @strFilter='Discount' AND @intStatus=0
	BEGIN
		INSERT INTO @tblReturn (intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
		monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv)

		SELECT pol.intPolicyID, lc.strLCNumber, lc.dteLcDate, pol.intPOID, cn.strCNoteNumber, cn.dteCNDate, pol.strPolicyNumber, CAST(pol.dteInsertTime AS DATE), 
		pol.monInvoiceAmount, curr.strCurrencyName+' @ '+ CAST(pol.monExchangeRate as varchar(50)), 
		pol.monInsuredTk, pol.monPremiumTotalTk, pol.monVatTk, pol.monStampTk, pol.monPremiumTotalTk+ pol.monVatTk+ pol.monStampTk, pol.monPremiumRebateTk,
		CASE ISNULL(pol.ysnBillForward,0) WHEN 1 THEN 'Forwarded' ELSE 'Pending' END, br.intBillID, CASE pr.ysnPaid WHEN 1 THEN 'Paid' ELSE 'Pending' END, 
		CASE ISNULL(pol.ysnDiscountReceive,0) WHEN 1 THEN 'Received' ELSE 'Pending' END       
		FROM ERP_Inventory.dbo.tblImportInsuranceShipmentWisePolicy pol JOIN ERP_Inventory.dbo.tblImportInsuranceCoverNote cn ON pol.intLcID=cn.intLcID 
		JOIN ERP_Inventory.dbo.tblImportLC lc ON pol.intLcID=lc.intLCID 
		JOIN ERP_Inventory.dbo.tblCurrencyConversion curr ON lc.intCurrency=curr.intCurrencyID
		LEFT JOIN ERP_Payment.dbo.tblBillRegister br ON CAST(pol.intPOID AS VARCHAR(20))=br.strReffNo 
		LEFT JOIN ERP_Payment.dbo.tblPaymentRequest pr ON br.intBillID=pr.intBillID
		WHERE ISNULL(pol.ysnDiscountReceive,0)=0 AND pol.intUnit=@intUnit AND cn.intInsProvider=@intAgent
		ORDER BY pol.intPolicyID			
	END
	ELSE IF @strFilter='Discount' AND @intStatus=1
	BEGIN
		INSERT INTO @tblReturn (intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
		monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv)

		SELECT pol.intPolicyID, lc.strLCNumber, lc.dteLcDate, pol.intPOID, cn.strCNoteNumber, cn.dteCNDate, pol.strPolicyNumber, CAST(pol.dteInsertTime AS DATE), 
		pol.monInvoiceAmount, curr.strCurrencyName+' @ '+ CAST(pol.monExchangeRate as varchar(50)), 
		pol.monInsuredTk, pol.monPremiumTotalTk, pol.monVatTk, pol.monStampTk, pol.monPremiumTotalTk+ pol.monVatTk+ pol.monStampTk, pol.monPremiumRebateTk,
		CASE ISNULL(pol.ysnBillForward,0) WHEN 1 THEN 'Forwarded' ELSE 'Pending' END, br.intBillID, CASE pr.ysnPaid WHEN 1 THEN 'Paid' ELSE 'Pending' END, 
		CASE ISNULL(pol.ysnDiscountReceive,0) WHEN 1 THEN 'Received' ELSE 'Pending' END       
		FROM ERP_Inventory.dbo.tblImportInsuranceShipmentWisePolicy pol JOIN ERP_Inventory.dbo.tblImportInsuranceCoverNote cn ON pol.intLcID=cn.intLcID 
		JOIN ERP_Inventory.dbo.tblImportLC lc ON pol.intLcID=lc.intLCID 
		JOIN ERP_Inventory.dbo.tblCurrencyConversion curr ON lc.intCurrency=curr.intCurrencyID
		LEFT JOIN ERP_Payment.dbo.tblBillRegister br ON CAST(pol.intPOID AS VARCHAR(20))=br.strReffNo 
		LEFT JOIN ERP_Payment.dbo.tblPaymentRequest pr ON br.intBillID=pr.intBillID
		WHERE ISNULL(pol.ysnDiscountReceive,0)=1 AND pol.intUnit=@intUnit AND cn.intInsProvider=@intAgent AND CAST(pol.dteInsertTime AS DATE) BETWEEN @fDate AND @tDate
		ORDER BY pol.intPolicyID			
	END
		
	SELECT intID, intPolicy, strLC, dteLcDate, intPO, strCN, dteCnDate, strPolicy, dtePolicyDate, monInvoice, strCurrency, 
	monPolicy, monPremium, monVAT, monStamp, monTotal, monDiscount, strBillForward, intBill, strPay, strDiscountRcv FROM @tblReturn 

END


