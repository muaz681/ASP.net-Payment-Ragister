<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierChart.aspx.cs" Inherits="UI.PaymentRagister.SupplierChart" %>

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

            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden"; confirm_value.name = "confirm_value";
            if (confirm("Do you want to proceed?")) { confirm_value.value = "Yes"; document.getElementById("hdnconfirm").value = "1"; }
            else { confirm_value.value = "No"; document.getElementById("hdnconfirm").value = "0"; }

        }
        function isDecimal(value) {
            return parseFloat(value) == value; // Check Intiger values by value % 1 === 0;
        }



        function Viewdetails(id, type) {
            window.open('SalesReturnDetails.aspx?type=' + type + '&ID=' + id, '', 'height=375, width=830, scrollbars=yes, left=250, top=200, resizable=no, title=Preview');
            /* window.open('SalesReturnDetails.aspx?ID=' + id, '', "height=375, width=830, scrollbars=yes, left=250, top=200, resizable=no, title=Preview");*/
        }

        function ViewPolicy(id, filepath) { window.open('SalesReturnDetails.aspx?ID=' + id + "height=550, width=850, scrollbars=yes, left=300, top=250, resizable=yes, title=Preview"); }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager0" EnablePageMethods="true" runat="server"></asp:ScriptManager>
        <asp:HiddenField ID="hdnconfirm" runat="server" />
        <asp:HiddenField ID="hdntype" runat="server" />
        <asp:HiddenField ID="hdnAccntID" runat="server" />
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mt-3">
                          <h5 class="card-header bg-dark text-light text-center">
                              Add Supplier to Chart of Account
                             
                          </h5>
                          <div class="card-body">
                              <div class="row">
                                    <div class="col-md-12">
                                        <div class="row" style="justify-content: center">
                                            <asp:DropDownList class="form-select form-select-sm mb-3 col-md-6" ID="UnitList" AutoPostBack="true" OnSelectedIndexChanged="drdlUnitChanged" runat="server" >
                                            </asp:DropDownList>
                                            <%--<asp:Button class="btn btn-sm btn-outline-success col-md-6" ID="Button1" runat="server" OnClick="submitBtnClick" Text="Submit" />--%>
                                        </div>
                                        
                                    </div>
                                </div>
                              <hr/>
                              <div class="row">
                                  <div class="col-md-12">
                                      <div class="card-body">
                                          <asp:GridView ID="SupplierChartlist" runat="server" AutoGenerateColumns="False" Font-Size="12px" ShowFooter="True" CellPadding="8" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" CssClass="auto-style5" Width="100%" OnRowDataBound="SupplierChartlist_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID" SortExpression="intId">
                                                    <ItemTemplate>
                                                        <asp:Label ID="intID" Font-Size="Medium" runat="server" Text='<%# Bind("intSupplierID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left"/>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Supplier Name" SortExpression="supplyName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="suppName" Font-Size="Medium" runat="server" Text='<%# Bind("strSupplierName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Department" SortExpression="dprt">
                                                    <ItemTemplate>
                                                        <asp:Label ID="dprtName" Font-Size="Medium" runat="server" Text='<%# Bind("strSupplierType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Account Name" SortExpression="accName">
                                                    <ItemTemplate>
                                                        <asp:DropDownList class="form-select form-select-sm mb-3" ID="accntNameList" runat="server">
                                                        </asp:DropDownList>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action" SortExpression="srId">
                                                    <ItemTemplate>
                                                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic mixed styles example">
                                                            <asp:Button class="btn btn-sm btn-info" ID="btnUpda" runat="server" OnClick="updtBtnClick" Text="Update COA" CommandArgument='<%# Eval("intSupplierID") %>' />
                                                               
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="left" />
                                                </asp:TemplateField>
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
