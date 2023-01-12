<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreasuryDeposit.aspx.cs" Inherits="UI.PaymentRagister.TreasuryDeposit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"><%: Scripts.Render("~/Content/Bundle/jqueryJS") %></asp:PlaceHolder>
    <webopt:BundleReference ID="BundleReference2" runat="server" Path="~/Content/Bundle/defaultCSS" />
    <webopt:BundleReference ID="BundleReference3" runat="server" Path="~/Content/Bundle/hrCSS" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.css" rel="stylesheet" />
    <script>
        //line
        var ctxL = document.getElementById("lineChart").getContext('2d');
        var myLineChart = new Chart(ctxL, {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [{
                    label: "My First dataset",
                    data: [65, 59, 80, 81, 56, 55, 40],
                    backgroundColor: [
                        'rgba(105, 0, 132, .2)',
                    ],
                    borderColor: [
                        'rgba(200, 99, 132, .7)',
                    ],
                    borderWidth: 2
                },
                {
                    label: "My Second dataset",
                    data: [28, 48, 40, 19, 86, 27, 90],
                    backgroundColor: [
                        'rgba(0, 137, 132, .2)',
                    ],
                    borderColor: [
                        'rgba(0, 10, 130, .7)',
                    ],
                    borderWidth: 2
                }
                ]
            },
            options: {
                responsive: true
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <h3 class="card-header">Treasury Deposit Forecast</h3>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <asp:Label ID="unitID" Font-Size="Medium" runat="server" Text="UNIT"></asp:Label>
                                        <div class="row">
                                            <asp:DropDownList class="form-select form-select-sm mb-3 col-8" ID="UnitList" runat="server">
                                                <asp:ListItem>Open this select menu</asp:ListItem>
                                                <asp:ListItem>One</asp:ListItem>
                                                <asp:ListItem>Two</asp:ListItem>
                                                <asp:ListItem>Three</asp:ListItem>
                                             </asp:DropDownList>
                                            <asp:Button class="btn btn-sm btn-success col-4" ID="showReportID" runat="server" OnClick="showReportClick" Text="Show Report" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="banklID" Font-Size="Medium" runat="server" Text="Bank"></asp:Label>
                                        <asp:DropDownList class="form-select form-select-sm mb-3" ID="BankID" runat="server">
                                            <asp:ListItem>Open this select menu</asp:ListItem>
                                            <asp:ListItem>One</asp:ListItem>
                                            <asp:ListItem>Two</asp:ListItem>
                                            <asp:ListItem>Three</asp:ListItem>
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="acID" Font-Size="Medium" runat="server" Text="A/C No"></asp:Label>
                                        <asp:DropDownList class="form-select form-select-sm mb-3" ID="AccountID" runat="server">
                                            <asp:ListItem>Select Type</asp:ListItem>
                                            <asp:ListItem>One</asp:ListItem>
                                            <asp:ListItem>Two</asp:ListItem>
                                            <asp:ListItem>Three</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Label ID="calenderID" Font-Size="Medium" runat="server" Text="Voucher Date"></asp:Label>
                                        <asp:TextBox ID="CalenID" runat="server" class="form-control form-control-sm" Enabled="true" AutoPostBack="false"></asp:TextBox>
                                        <script type="text/javascript"> new datepickr('CalenID', { 'dateFormat': 'Y-m-d' });</script>
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="card-header"></h4>
                        <div class="card-body">
                            <asp:GridView ID="TreasuryDepositlist" runat="server" AutoGenerateColumns="False" Font-Size="12px" ShowFooter="True" CellPadding="8" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" CssClass="auto-style5" Width="100%" OnSelectedIndexChanged="TreasuryDeposit_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="SL" SortExpression="emp">
                                        <ItemTemplate>
                                            <asp:Label ID="SlID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Deposite For" SortExpression="coa">
                                        <ItemTemplate>
                                            <asp:Label ID="DepositeID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-7" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="Day7" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-6" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="Day6" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-5" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="Day5" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-4" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="Day4" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-3" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="Day3" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-2" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="Day2" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-1" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="Day1" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Day-0 (Forecasted Pay)" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="DayForcID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Current Balance" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="CurrentBalanID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Net Pay" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="NetPayID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Amount" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="TotalID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

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
                <div class="row">
                    
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"></script>
</body>
</html>
