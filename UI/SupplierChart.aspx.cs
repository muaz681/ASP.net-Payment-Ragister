using HR_DAL.Reports;
using IT_BLL.DBInfo;
using iTextSharp.tool.xml.html;
using LOGIS_BLL.Trip;
using Purchase_BLL.Payment_Register;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Metadata.Edm;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UI.ClassFiles;
using UI.SAD.Sales;
using Utility;
namespace UI.PaymentRagister
{
    public partial class SupplierChart : System.Web.UI.Page
    {
        PaymentBLL paymentRegData = new PaymentBLL();
        private DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                unitReadData();
            }
        }
        private void unitReadData()
        {
            dt = paymentRegData.GetReadShowTable(4, 0, 0);
            UnitList.LoadWithSelect(dt, "intUnitID", "strUnit");
      
        }
        
        protected void drdlUnitChanged(object sender, EventArgs e)
        {

            int selectedUnitID = int.Parse(UnitList.SelectedValue);
            readData();
            DataTable dt = paymentRegData.GetReadShowTable(1, selectedUnitID, 0);
            SupplierChartlist.DataSource = dt;
            SupplierChartlist.DataBind();
            
        }
        private void readData()
        {
            int selectedUnitID = int.Parse(UnitList.SelectedValue.ToString());
            DataTable dt = paymentRegData.GetReadShowTable(3, selectedUnitID, 0);
            hdnAccntID.Value = dt.Rows[0]["intAccID"].ToString();
        }
        
        protected void SupplierChartlist_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (GridViewRow gvRow in SupplierChartlist.Rows)
            {
              
                int selectedUnitID = int.Parse(UnitList.SelectedValue.ToString());
                DataTable dt = paymentRegData.GetReadShowTable(2, selectedUnitID, int.Parse(hdnAccntID.Value));
                DropDownList ddl = gvRow.FindControl("accntNameList") as DropDownList;
                ddl.DataSource = dt;
                ddl.DataValueField = "intAccID";
                ddl.DataTextField = "strAccName";
                ddl.DataBind();

            }

        }
        protected void updtBtnClick(object sender, EventArgs e)
        {
            string clickHist = ((Button)sender).ClientID.ToString();
            string[] chars; ;
            chars = clickHist.Split('_');
            int clickedRow = int.Parse(chars[2]);
            int srid = int.Parse(((Button)sender).CommandArgument.ToString());
            DropDownList type = (DropDownList)SupplierChartlist.Rows[clickedRow].FindControl("accntNameList");
            int typeId = int.Parse(type.SelectedValue.Trim());
            paymentRegData.GetReadShowTable(5, typeId, srid);
            int selectedUnitID = int.Parse(UnitList.SelectedValue.ToString());
            DataTable dt = paymentRegData.GetReadShowTable(1, selectedUnitID, 0);
            SupplierChartlist.DataSource = dt;
            SupplierChartlist.DataBind();
        }


    }
}