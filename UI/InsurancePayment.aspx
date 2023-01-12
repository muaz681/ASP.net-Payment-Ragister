<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsurancePayment.aspx.cs" Inherits="UI.PaymentRagister.InsurancePayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"><%: Scripts.Render("~/Content/Bundle/jqueryJS") %></asp:PlaceHolder> 
    <webopt:BundleReference ID="BundleReference2" runat="server" Path="~/Content/Bundle/defaultCSS" />     
    <webopt:BundleReference ID="BundleReference3" runat="server" Path="~/Content/Bundle/hrCSS" />

    <link href="../Content/CSS/bootstrap5.css" rel="stylesheet" />

    <style>
        .cust_crd{
            overflow-x: auto;
            height: 100vh;
        }
    </style>
    <script>

        //&& $("#ProviderID").val().length > 0
        $(function () {
            $("#btnShowID").css("visibility", "hidden");

            $("#form1").bind("change", function () {
                if ($("#UnitList").val().length > 0) {
                    $("#btnShowID").css("visibility", "visible");
                } else if ($("#ProviderID").val().length > 0) {
                    $("#btnShowID").css("visibility", "visible");
                }
                else {
                    $("#btnShowID").css("visibility", "hidden");
                }
            });
        });

        

        //let input = document.querySelector(".drp_unit");
        //let button = document.querySelector(".btn_sbmt");

        //button.disabled = true; //setting button state to disabled

        //input.addEventListener("change", stateHandle);

        //function stateHandle() {
        //    if (document.querySelector(".drp_unit").value === "0") {
        //        button.disabled = true; //button remains disabled
        //    } else {
        //        button.disabled = false; //button is enabled
        //    }
        //}
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h3 class="card-header">Insurance Payment</h3>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <asp:Label ID="unitID" Font-Size="Medium" runat="server" Text="UNIT"></asp:Label>
                                        <asp:DropDownList class="form-select form-select-sm mb-3 drp_unit" ID="UnitList" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="calenderID" Font-Size="Medium" runat="server" Text="From: "></asp:Label>
                                        <asp:TextBox ID="FromCalenID" runat="server" class="form-control form-control-sm" Enabled="true" AutoPostBack="false"></asp:TextBox>
                                        <script type="text/javascript"> new datepickr('FromCalenID', { 'dateFormat': 'Y-m-d' });</script>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="provID" Font-Size="Medium" runat="server" Text="Provider"></asp:Label>
                                        <asp:DropDownList class="form-select form-select-sm mb-3" ID="ProviderID" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <asp:Label ID="filterID" Font-Size="Medium" runat="server" Text="Filter By"></asp:Label>
                                        <asp:DropDownList class="form-select form-select-sm mb-3" ID="InsFilterID" runat="server">
                                            <asp:ListItem>Open this select menu</asp:ListItem>
                                            <asp:ListItem Value="Bill Forward">Bill Forward</asp:ListItem>
                                            <asp:ListItem Value="Payment">Payment</asp:ListItem>
                                            <asp:ListItem Value="Discount">Discount</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="Label1" Font-Size="Medium" runat="server" Text="To: "></asp:Label>
                                        <asp:TextBox ID="ToID" runat="server" class="form-control form-control-sm" Enabled="true" AutoPostBack="false"></asp:TextBox>
                                        <script type="text/javascript"> new datepickr('ToID', { 'dateFormat': 'Y-m-d' });</script>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="statusID" Font-Size="Medium" runat="server" Text="Status"></asp:Label>
                                        <asp:DropDownList class="form-select form-select-sm mb-3" ID="InsStatusID" runat="server">
                                            <asp:ListItem>Select Type</asp:ListItem>
                                            <asp:ListItem Value="0">Pending</asp:ListItem>
                                            <asp:ListItem Value="1">Forwarded</asp:ListItem>
                                            <asp:ListItem Value="2">All</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Button class="btn btn-sm btn-success btn_sbmt" ID="btnShowID" runat="server" OnClick="showBtnClick" Text="Show" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h3 class="card-header"></h3>
                        <div class="card-body cust_crd">
                            <asp:GridView ID="InsurancePaymentlist" runat="server" AutoGenerateColumns="False" Font-Size="12px" ShowFooter="True" CellPadding="8" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" CssClass="auto-style5" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="SL" SortExpression="emp">
                                        <ItemTemplate>
                                            <asp:Label ID="SlID" Font-Size="Medium" runat="server" Text='<%# Bind("intID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LC Number" SortExpression="coa">
                                        <ItemTemplate>
                                            <asp:Label ID="LcNumID" Font-Size="Medium" runat="server" Text='<%# Bind("strLC") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="DateID" Font-Size="Medium" runat="server" Text='<%# Bind("dteLcDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="PO No" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="PoNoID" Font-Size="Medium" runat="server" Text='<%# Bind("intPO") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Cover Note No" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="CoverNoteID" Font-Size="Medium" runat="server" Text='<%# Bind("strCN") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CN Date" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="CnDateID" Font-Size="Medium" runat="server" Text='<%# Bind("dteCnDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Policy No" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="PolicyNoID" Font-Size="Medium" runat="server" Text='<%# Bind("strPolicy") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="DateID2" Font-Size="Medium" runat="server" Text='<%# Bind("dtePolicyDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Invoice Amt." SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="InvoiceAmtID" Font-Size="Medium" runat="server" Text='<%# Bind("monInvoice") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Currency" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="CurrencyID" Font-Size="Medium" runat="server" Text='<%# Bind("strCurrency") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Insured BDT" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="InsuredBdtID" Font-Size="Medium" runat="server" Text='<%# Bind("monPolicy") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Premium" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="PremiumID" Font-Size="Medium" runat="server" Text='<%# Bind("monPremium") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="VAT" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="VatID" Font-Size="Medium" runat="server" Text='<%# Bind("monVAT") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Stamp" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="StampID" Font-Size="Medium" runat="server" Text='<%# Bind("monStamp") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="TotalID" Font-Size="Medium" runat="server" Text='<%# Bind("monTotal") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Discount" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="DiscountID" Font-Size="Medium" runat="server" Text='<%# Bind("monDiscount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Billing" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="BillingID" Font-Size="Medium" runat="server" Text='<%# Bind("strBillForward") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Store Bill ID" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="StrBilID" Font-Size="Medium" runat="server" Text='<%# Bind("intBill") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Payment" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="PaymentID" Font-Size="Medium" runat="server" Text='<%# Bind("strPay") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Discount Rcv." SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="DiscRcvID" Font-Size="Medium" runat="server" Text='<%# Bind("strDiscountRcv") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <%--<asp:TemplateField HeaderText="Action" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Button class="btn btn-sm btn-primary" ID="btnDiscID" runat="server" OnClick="discountBtnClick" Text="Recieve Discount" CommandArgument='<%# Eval("intPolicy") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>--%>

                                </Columns>

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
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"></script>
</body>
</html>
