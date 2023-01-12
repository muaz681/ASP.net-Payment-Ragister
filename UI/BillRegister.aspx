<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillRegister.aspx.cs" Inherits="UI.PaymentRagister.BillRegister" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <h3 class="card-header">Bill Register</h3>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <asp:Label ID="untId" class="input-group-text text-dark" Font-Size="Medium" runat="server" Text="Unit"></asp:Label>
                                        <asp:TextBox ID="UnitID" runat="server" class="form-control form-control-sm"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <asp:Label ID="frmId" class="input-group-text text-dark" Font-Size="Medium" runat="server" Text="From: "></asp:Label>
                                        <asp:TextBox ID="FromID" runat="server" class="form-control form-control-sm" Enabled="true" AutoPostBack="false"></asp:TextBox>
                                        <script type="text/javascript"> new datepickr('FormID', { 'dateFormat': 'Y-m-d' });</script>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group input-group-sm mb-3">
                                        <asp:Label ID="toId" class="input-group-text text-dark" Font-Size="Medium" runat="server" Text="TO: "></asp:Label>
                                        <asp:TextBox ID="CalToID" runat="server" class="form-control form-control-sm" Enabled="true" AutoPostBack="false"></asp:TextBox>
                                        <script type="text/javascript"> new datepickr('CalToID', { 'dateFormat': 'Y-m-d' });</script>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <asp:Button class="btn btn-sm btn-info" ID="btnShowID" runat="server" OnClick="showBtnClick" Text="Show Details" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group input-group-sm mb-3">
                                        <asp:Label ID="blRgId" class="input-group-text text-dark" Font-Size="Medium" runat="server" Text="Bill Reg No: "></asp:Label>
                                        <asp:TextBox ID="BillRegID" runat="server" class="form-control form-control-sm"></asp:TextBox>
                                        <asp:Button class="btn btn-sm btn-success" ID="GoID" runat="server" OnClick="GoBtnClick" Text="Go" />
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
                        <div class="card-header"></div>
                        <div class="card-body">
                            <asp:GridView ID="BillRegisterList" runat="server" AutoGenerateColumns="False" Font-Size="12px" ShowFooter="True" CellPadding="8" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" CssClass="auto-style5" Width="100%" OnSelectedIndexChanged="BillRegisterList_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Bill ID" SortExpression="emp">
                                        <ItemTemplate>
                                            <asp:Label ID="BillID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Bill Reg No" SortExpression="coa">
                                        <ItemTemplate>
                                            <asp:Label ID="BillRegNo" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Party Name" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="PartNameID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Reff" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="ReffID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Bill No" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="BillNoID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Bill Date" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="BillDateID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Rcv Date" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="RcvDateID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Bill Amount" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="BillAmountID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Remarks" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="RemarksID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Audit Status" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="AuditStsID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="DateID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Audit Remarks" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="AdtRmrkID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Approve Amount" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="ApprvAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Pay Date" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="PayDateID" Font-Size="Medium" runat="server" Text=""></asp:Label>
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
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"></script>
</body>
</html>
