<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubAccount.aspx.cs" Inherits="UI.PaymentRagister.SubAccount" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <asp:PlaceHolder ID="PlaceHolder1" runat="server"><%: Scripts.Render("~/Content/Bundle/jqueryJS") %></asp:PlaceHolder> 
    <webopt:BundleReference ID="BundleReference2" runat="server" Path="~/Content/Bundle/defaultCSS" />     
    <webopt:BundleReference ID="BundleReference3" runat="server" Path="~/Content/Bundle/hrCSS" />

    <link href="../Content/CSS/bootstrap5.css" rel="stylesheet" />
    <script type="text/javascript">


        function Confirm() {
            document.getElementById("hdnconfirm").value = "0";
            var txtSection = document.forms["frmreq"]["txtSection"].value;
            var txtQuantity = document.forms["frmreq"]["txtQuantity"].value;

            if (txtSection == null || txtSection == "") {
                ShowNotification("Please enter valid section", "Requsition", "warning");
                return false;
            }
            else if (!isDecimal(txtQuantity) ||
                txtQuantity.length <= 0 ||
                txtQuantity == "0" ||
                txtQuantity == "0.00") {
                ShowNotification("Please enter valid quantity", "Requsition", "warning");
                return false;
            } else {
                document.getElementById("hdnconfirm").value = "1";
                return true;
            }
        }ipt>
        function isDecimal(value) {
            return parseFloat(value) == value; // Check Intiger values by value % 1 === 0;
        }



        function Viewdetails(id) {
            window.open('RequisitionDetails.aspx?ID=' + id, '', "height=375, width=830, scrollbars=yes, left=250, top=200, resizable=no, title=Preview");
        }

        function ViewPolicy(id, filepath) { window.open('ReqPolicyView.aspx?ID=' + id + '&FP=' + filepath, 'sub', "height=550, width=850, scrollbars=yes, left=300, top=250, resizable=yes, title=Preview"); }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="hdnAccntID" runat="server" />
    <asp:HiddenField ID="coaValueID" runat="server" />
        <asp:ScriptManager ID="ScriptManager0" EnablePageMethods="true" runat="server"></asp:ScriptManager>
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mt-3">
                          <h5 class="card-header bg-dark text-light text-center">Add Supplier to Chart of Account</h5>
                          <div class="card-body">
                              <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="unitID" Font-Size="Medium" runat="server" Text="UNIT"></asp:Label>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                     ControlToValidate="UnitList" ValueToCompare="0" Operator="NotEqual"
                                     Type="Integer" ErrorMessage="* Please select a Unit type" ForeColor="Red" />
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="UnitList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drdlUnitChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-8">
                                    <asp:Label ID="emplyID" Font-Size="Medium" runat="server" Text="Employee"></asp:Label>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                     ControlToValidate="EmployeList" ValueToCompare="0" Operator="NotEqual"
                                     Type="Integer" ErrorMessage="* Please select an Employee List" ForeColor="Red" />
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="EmployeList" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-5">
                                    <asp:Label ID="coalID" Font-Size="Medium" runat="server" Text="COA"></asp:Label>
                                    <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                     ControlToValidate="CoaList" ValueToCompare="0" Operator="NotEqual"
                                     Type="Integer" ErrorMessage="* Please select a Chart of Account" ForeColor="Red" />
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="CoaList" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="typeID" Font-Size="Medium" runat="server" Text="Type"></asp:Label>
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                     ControlToValidate="TypeList" ValueToCompare="0" Operator="NotEqual"
                                     Type="Integer" ErrorMessage="* Please select a Type" ForeColor="Red" />
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="TypeList" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="actionId" class="d-block" Font-Size="Medium" runat="server" Text="Action"></asp:Label>
                                    <div class="btn-group btn-group-sm" role="group">
                                        <asp:Button class="btn btn-sm btn-success" ID="btnAddID" runat="server" OnClick="addBtnClick" Text="ADD" />
                                        <asp:Button class="btn btn-sm btn-info" ID="btnPermsID" runat="server" OnClick="permsBtnClick" Text="Give Permission" />
                                    </div>
                                </div>
                              </div>
                              <hr/>
                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="card-body">
                                          <asp:GridView ID="SubAccountlist" runat="server" AutoGenerateColumns="False" 
                                              Font-Size="12px" ShowFooter="True" CellPadding="8" FooterStyle-Font-Bold="true" 
                                              FooterStyle-HorizontalAlign="Right" BackColor="#DEBA84" 
                                              BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                                              CellSpacing="2" CssClass="auto-style5" Width="100%" 
                                              OnRowDataBound="dgvlist_RowDataBound"
                                              OnRowDeleting="dgv_RowDeleting">
                                            <Columns>
                                                

                                                <asp:TemplateField HeaderText="Unit" SortExpression="unitTx">
                                                    <ItemTemplate>
                                                        <asp:Label ID="UnitTxt" Font-Size="Medium" runat="server" Text='<%# Bind("unitText") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="false" HeaderText="UnitID" SortExpression="unitID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="UnitID" Font-Size="Medium" runat="server" Text='<%# Bind("unitId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Employee Name" SortExpression="unit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="employeeName" Font-Size="Medium" runat="server" Text='<%# Bind("emplyName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="false" HeaderText="Enroll ID" SortExpression="emp">
                                                    <ItemTemplate>
                                                        <asp:Label ID="EmplID" Font-Size="Medium" runat="server" Text='<%# Bind("emEnroll") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left"/>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Account Name" SortExpression="accName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="accountName" Font-Size="Medium" runat="server" Text='<%# Bind("coaText") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left"/>
                                                </asp:TemplateField>

                                                 <asp:TemplateField Visible="false" HeaderText="COA" SortExpression="coa">
                                                    <ItemTemplate>
                                                        <asp:Label ID="coaID" Font-Size="Medium" runat="server" Text='<%# Bind("coaId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left"/>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Account Type" SortExpression="accType">
                                                    <ItemTemplate>
                                                        <asp:Label ID="AccTypeID" Font-Size="Medium" runat="server" Text='<%# Bind("typeText") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField Visible="false" HeaderText="Type ID" SortExpression="typeId">
                                                    <ItemTemplate>
                                                        <asp:Label ID="typeID" Font-Size="Medium" runat="server" Text='<%# Bind("paymentType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>

                                                <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="White" ControlStyle-CssClass="p-2" ControlStyle-BackColor="#cc0000" ControlStyle-Font-Underline="false" ControlStyle-Font-Bold="true" />

                                            </Columns>
                                            <EmptyDataTemplate>
                                                 <div align="center">No records found.</div>
                                            </EmptyDataTemplate>

                                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                                          </asp:GridView>
                                      </div>
                                  </div>
                              </div>
                            
                          </div>
                          <p class="card-footer bg-dark text-light text-center" style="font-size: 10px; margin-bottom: 0px; padding: 3px 0;">
                              This is Akij Assets Product
                          </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="../Content/JS/bootstrap.min.js"></script>
</body>
</html>
