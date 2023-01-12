using Purchase_BLL.Payment_Register;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.ClassFiles;
using Utility;

namespace UI.PaymentRagister
{
    public partial class InsurancePayment : System.Web.UI.Page
    {
        PaymentBLL paymentRegData = new PaymentBLL();
        private DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                unitReadData();
                provideReadData();
            }
        }

        private void unitReadData()
        {
            dt = paymentRegData.GetSubAccTable(2, 0, 0);
            UnitList.LoadWithSelect(dt, "intUnitID", "strUnit");

        }
        private void provideReadData()
        {
            dt = paymentRegData.GetInsProvTable();
            ProviderID.LoadWithSelect(dt, "intInsuranceProvider", "strInsuranceProvider");

        }

        [Obsolete]
        protected void showBtnClick(object sender, EventArgs e)
        {
            try
            {
                int selectedUnitID = int.Parse(UnitList.SelectedValue);
                int selectedProviderID = int.Parse(ProviderID.SelectedValue);
                DateTime selectFromCalenID = DateTime.FromOADate(selectedUnitID);
                DateTime selectToCalenID = DateTime.FromOADate(selectedProviderID);
                string selectInsFilterID = InsFilterID.SelectedValue;
                int selectedInsStatusID = int.Parse(InsStatusID.SelectedValue);
                DataTable dt = paymentRegData.GetImpReportInsurancePaymTable(selectedUnitID, selectedProviderID,
                    selectFromCalenID, selectToCalenID, selectInsFilterID, selectedInsStatusID);
                InsurancePaymentlist.DataSource = dt;
                InsurancePaymentlist.DataBind();
            }
            catch
            {
                Page.RegisterStartupScript("captcha",
                "<script language='javascript'>" +
                    "function disableSubmitButton() {" +
                        "document.getElementById('***submitButtonID***').onclick = function(){return false;}" +
                    "}" +
                    "if(window.addEventListener) {" +
                    "    window.addEventListener('load',disableSubmitButton,false);" +
                    "} else {" +
                    "    window.attachEvent('onload',disableSubmitButton);" +
                    "}" +
                    "alert('Please Select all values then enter Sumbit Button');" +
                "</script>");
            }
        }

        protected void InsurancePayment_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
        //protected void discountBtnClick(object sender, EventArgs e)
        //{
            
        //    int srid = int.Parse(Request.QueryString["ID"]);
        //    int actionBy = int.Parse(HttpContext.Current.Session[SessionParams.USER_ID].ToString());
        //    DataTable dt = paymentRegData.GetInsShipmentUpdateTable(srid, actionBy);
        //}
    }
}