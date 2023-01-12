using iTextSharp.tool.xml.html;
using Microsoft.Office.Interop.Excel;
using Org.BouncyCastle.Asn1.X509;
using Purchase_BLL.Payment_Register;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml;
using UI.ClassFiles;
using UI.SAD.Sales;
using Utility;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Tab;
using DataTable = System.Data.DataTable;
using Label = System.Web.UI.WebControls.Label;
using Page = System.Web.UI.Page;

namespace UI.PaymentRagister
{
    public partial class SubAccount : System.Web.UI.Page
    {
        PaymentBLL paymentRegData = new PaymentBLL();
        private DataTable dt = new DataTable();
        
        string filePathForXML, xmlString, xmlpath;
        protected void Page_Load(object sender, EventArgs e)
        {
            filePathForXML = Server.MapPath("~/SAD/Order/Data/OR/" + HttpContext.Current.Session[SessionParams.USER_ID].ToString() + "_" + "subaccount.xml");
            xmlpath = Server.MapPath("~/SAD/Order/Data/OR/" + HttpContext.Current.Session[SessionParams.USER_ID].ToString() + ".xml");

            if (!IsPostBack)
            {
                try { File.Delete(filePathForXML); }
                catch { }

                try
                {
                    try { File.Delete(xmlpath); } catch { }


                }
                catch { }
                unitReadData();
            }
        }
        private void unitReadData()
        {
            dt = paymentRegData.GetSubAccTable(2, 0, 0);
            UnitList.LoadWithSelect(dt, "intUnitID", "strUnit");

        }

        protected void drdlUnitChanged(object sender, EventArgs e)
        {

            int selectedUnitID = int.Parse(UnitList.SelectedValue);
            dt = paymentRegData.GetSubAccTable(1, selectedUnitID, 0);
            DropDownList ddl = EmployeList.FindControl("EmployeList") as DropDownList;
            ddl.LoadWithSelect(dt, "intEmployeeID", "strEmployee");
            readData();
            paymentMethodData();

        }
        private void readData()
        {
            int selectedUnitID = int.Parse(UnitList.SelectedValue.ToString());
            dt = paymentRegData.GetChildTable(selectedUnitID, false, false, false, false, false, true);
            CoaList.LoadWithSelect(dt, "intAccID", "strAccName");
        }
        private void paymentMethodData()
        {
            dt = paymentRegData.GetSubAccTable(3, 0, 0);
            TypeList.LoadWithSelect(dt, "intAccountType", "strAccountType");
        }

        private void LoadGridwithXml()
        {
            try
            {
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.Load(filePathForXML);
                System.Xml.XmlNode dSftTm = doc.SelectSingleNode("Subaccount");
                xmlString = dSftTm.InnerXml;
                xmlString = "<Subaccount>" + xmlString + "</Subaccount>";
                StringReader sr = new StringReader(xmlString);
                DataSet ds = new DataSet();
                ds.ReadXml(sr);
                if (ds.Tables[0].Rows.Count > 0)
                { SubAccountlist.DataSource = ds; }
                else { SubAccountlist.DataSource = ""; }

                SubAccountlist.DataBind();

            }
            catch { }
        }

        private void CreateVoucherXml(string unitId, string unitText, string emEnroll, string emplyName, string coaId, string coaText, string paymentType, string typeText)
        {
            XmlDocument doc = new XmlDocument();
            if (System.IO.File.Exists(filePathForXML))
            {
                doc.Load(filePathForXML);
                XmlNode rootNode = doc.SelectSingleNode("Subaccount");
                XmlNode addItem = CreateItemNode(doc, unitId, unitText, emEnroll, emplyName, coaId, coaText, paymentType, typeText);
                rootNode.AppendChild(addItem);
            }
            else
            {
                XmlNode xmldeclerationNode = doc.CreateXmlDeclaration("1.0", "", "");
                doc.AppendChild(xmldeclerationNode);
                XmlNode rootNode = doc.CreateElement("Subaccount");
                XmlNode addItem = CreateItemNode(doc, unitId, unitText, emEnroll, emplyName, coaId, coaText, paymentType, typeText);
                rootNode.AppendChild(addItem);
                doc.AppendChild(rootNode);
            }
            doc.Save(filePathForXML);
            LoadGridwithXml();
            //Clear();
        }
        private void Clear()
        {
            UnitList.SelectedValue = null;
            EmployeList.SelectedValue = null;
            CoaList.SelectedValue = null;
            TypeList.SelectedValue = null;

        }

        private XmlNode CreateItemNode(XmlDocument doc, string unitId, string unitText, string emEnroll, string emplyName, string coaId, string coaText, string paymentType, string typeText)
        {
            XmlNode node = doc.CreateElement("items");


            XmlAttribute UnitId = doc.CreateAttribute("unitId");
            UnitId.Value = unitId;
            
            XmlAttribute UnitText = doc.CreateAttribute("unitText");
            UnitText.Value = unitText;

            XmlAttribute EmEnroll = doc.CreateAttribute("emEnroll");
            EmEnroll.Value = emEnroll;

            XmlAttribute EmplyName = doc.CreateAttribute("emplyName");
            EmplyName.Value = emplyName;


            XmlAttribute CoaId = doc.CreateAttribute("coaId");
            CoaId.Value = coaId;
            
            XmlAttribute CoaText = doc.CreateAttribute("coaText");
            CoaText.Value = coaText;


            XmlAttribute PaymentType = doc.CreateAttribute("paymentType");
            PaymentType.Value = paymentType;

            XmlAttribute TypeText = doc.CreateAttribute("typeText");
            TypeText.Value = typeText;



            node.Attributes.Append(UnitId);
            node.Attributes.Append(UnitText);
            node.Attributes.Append(EmEnroll);
            node.Attributes.Append(EmplyName);
            node.Attributes.Append(CoaId);
            node.Attributes.Append(CoaText);

            node.Attributes.Append(PaymentType);
            node.Attributes.Append(TypeText);


            return node;
        }

        [Obsolete]

        protected void addBtnClick(object sender, EventArgs e)
        {
            int prdid;
            char[] ch = { '[', ']' };
            char[] prc = { '^', '^' };
            //type = int.Parse(drdlreportype.SelectedValue.ToString());
            int actionBy = int.Parse(HttpContext.Current.Session[SessionParams.USER_ID].ToString());
            
            string unitId = UnitList.SelectedValue.ToString();
            
            string unitText = UnitList.SelectedText();
            string emplyId = EmployeList.SelectedValue.ToString();
            string emplyName = EmployeList.SelectedText();
            string coaId = CoaList.SelectedValue.ToString();
            string coaText = CoaList.SelectedText();
            string typeId = TypeList.SelectedValue.ToString();
            string typeText = TypeList.SelectedText();


            int intCoaID = int.Parse(coaId);
            int intEmpID = int.Parse(emplyId);
            dt = paymentRegData.GetSubAccTable(4, intCoaID, intEmpID);
            string totalCoaID = dt.Rows[0]["coaValue"].ToString();

            if (totalCoaID == "0") 
            {
                string validationCheckString = "coaId=\"" + coaId + "\"";

                if (System.IO.File.Exists(filePathForXML))
                {
                    System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                    doc.Load(filePathForXML);
                    System.Xml.XmlNode dSftTm = doc.SelectSingleNode("Subaccount");
                    xmlString = dSftTm.InnerXml;
                    xmlString = "<Subaccount>" + xmlString + "</Subaccount>";

                    if (!xmlString.Contains(validationCheckString))
                    {

                        CreateVoucherXml(unitId, unitText, emplyId, emplyName, coaId, coaText, typeId, typeText);
                    }
                    else
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
                            "alert('Sorry! This Supplier already added the list');" +
                        "</script>");
                    }

                }
                else
                {
                    CreateVoucherXml(unitId, unitText, emplyId, emplyName, coaId, coaText, typeId, typeText);
                }
                
                
            } 
            else
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
                    "alert('Sorry! This account already added for the selected user');" +
                "</script>");
            }

        }

        protected void permsBtnClick(object sender, EventArgs e)
        {
            if (SubAccountlist.Rows.Count > 0)
            {
                try
                {
                    for (int i = 0; i< SubAccountlist.Rows.Count; i++)
                    {
                        int user = int.Parse(HttpContext.Current.Session[SessionParams.USER_ID].ToString());

                        Label lblUnitID = (Label) SubAccountlist.Rows[i].FindControl("UnitID");
                        int unitID = int.Parse(lblUnitID.Text);

                        Label lblEmplID = SubAccountlist.Rows[i].FindControl("EmplID") as Label;
                        int empID = int.Parse(lblEmplID.Text);

                        Label lblCoaID = (Label)SubAccountlist.Rows[i].FindControl("coaID");
                        int coaID = int.Parse(lblCoaID.Text);

                        Label lblTypeID = SubAccountlist.Rows[i].FindControl("typeID") as Label;
                        int typeID = int.Parse(lblEmplID.Text);

                        dt = paymentRegData.GetInsertTable(empID, coaID, typeID, unitID, user);


                    }



                }
                catch (Exception ex)
                {
                    File.Delete(xmlpath);
                }
            }
            Clear();
            File.Delete(filePathForXML); SubAccountlist.DataSource = ""; SubAccountlist.DataBind();
        }
        

        protected void btnRemID(object sender, EventArgs e)
        {

        }

        protected void dgvlist_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            foreach (GridViewRow gvRow in SubAccountlist.Rows)
            {

                

            }
        }
        
        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                LoadGridwithXml();
                DataSet dsGrid = (DataSet)SubAccountlist.DataSource;
                dsGrid.Tables[0].Rows[SubAccountlist.Rows[e.RowIndex].DataItemIndex].Delete();
                dsGrid.WriteXml(filePathForXML);
                DataSet dsGridAfterDelete = (DataSet)SubAccountlist.DataSource;
                if (dsGridAfterDelete.Tables[0].Rows.Count <= 0)
                { File.Delete(filePathForXML); SubAccountlist.DataSource = ""; SubAccountlist.DataBind(); }
                else { LoadGridwithXml(); }
            }
            catch { }
        }


        
    }
}