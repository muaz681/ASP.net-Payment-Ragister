using Purchase_DAL.Payment_Register.PaymentDALTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Purchase_BLL.Payment_Register
{
    public class PaymentBLL
    {
        DataTable dt = new DataTable();
        
        public DataTable GetReadShowTable(int type,int unitID, int accntID)
        {
            sprPaymentRegisterSupplierChartTableAdapter typeObj = new sprPaymentRegisterSupplierChartTableAdapter();
            try
            {
                return typeObj.GetData(type,unitID, accntID);
                
            }
            catch
            {
                return new DataTable();
            }
            
        }
        public DataTable GetSubAccTable(int type, int unitID, int accntID)
        {
            sprPaymentRegisterSubAccountTableAdapter typeObj = new sprPaymentRegisterSubAccountTableAdapter();
            try
            {
                return typeObj.GetSubbAccData(type, unitID, accntID);

            }
            catch
            {
                return new DataTable();
            }
        }

        public DataTable GetChildTable(int intUnit, bool ysnAdvance, bool ysnPurchase, bool ysnCreditors, bool ysnAll, bool ysnBillReg, bool ysnInventory)
        {
            sprGetCOAChildByUnitTableAdapter typeObj = new sprGetCOAChildByUnitTableAdapter();
            try
            {
                return typeObj.GetChildData(intUnit, ysnAdvance, ysnPurchase, ysnCreditors, ysnAll, ysnBillReg, ysnInventory);

            }
            catch
            {
                return new DataTable();
            }
        }

        public DataTable GetInsertTable(int intEmplID, int intCoaID, int intType, int intUnit, int intUser)
        {
            tblSubAccountsChartOfAccByUserTableAdapter typeObj = new tblSubAccountsChartOfAccByUserTableAdapter();
            try
            {
                return typeObj.GetInsertData(intEmplID, intCoaID, intType, intUnit, intUser);

            }
            catch
            {
                return new DataTable();
            }
        }

        public DataTable GetInsProvTable()
        {
            tblImportInsuranceProviderTableAdapter typeObj = new tblImportInsuranceProviderTableAdapter();
            try
            {
                return typeObj.GetInsProvData();
            }
            catch
            {
                return new DataTable();
            }
        }

        public DataTable GetImpReportInsurancePaymTable(int intUnit, int intProvider, DateTime fromDate, DateTime toDate, string strFilter, int intStatus)
        {
            sprImportReportInsurancePaymentTableAdapter typeObj = new sprImportReportInsurancePaymentTableAdapter();
            try
            {
                return typeObj.GetImpReportInsurancePaymData(intUnit, intProvider, fromDate, toDate, strFilter, intStatus);
            }
            catch
            {
                return new DataTable();
            }
        }

        public DataTable GetInsShipmentUpdateTable(int intUser, int intPolicy)
        {
            tblImportInsuranceShipmentWisePolicyTableAdapter typeObj = new tblImportInsuranceShipmentWisePolicyTableAdapter();
            try
            {
                return typeObj.GetInsShipmentUpdateData(intUser, intPolicy);
            }
            catch
            {
                return new DataTable();
            }
        }

        



    }
}
