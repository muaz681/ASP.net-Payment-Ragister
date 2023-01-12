<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudgetEntry.aspx.cs" Inherits="UI.PaymentRagister.BudgetEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                        <h3 class="card-header">Budget Entry</h3>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="entID" Font-Size="Medium" runat="server" Text="Entry"></asp:Label>
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="EntryID" runat="server">
                                        <asp:ListItem>Open this select menu</asp:ListItem>
                                        <asp:ListItem>One</asp:ListItem>
                                        <asp:ListItem>Two</asp:ListItem>
                                        <asp:ListItem>Three</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="unid" Font-Size="Medium" runat="server" Text="Unit: "></asp:Label>
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="UnitID" runat="server">
                                        <asp:ListItem>Open this select menu</asp:ListItem>
                                        <asp:ListItem>One</asp:ListItem>
                                        <asp:ListItem>Two</asp:ListItem>
                                        <asp:ListItem>Three</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="yeaId" Font-Size="Medium" runat="server" Text="Year: "></asp:Label>
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="YearID" runat="server">
                                        <asp:ListItem>Open this select menu</asp:ListItem>
                                        <asp:ListItem>2019</asp:ListItem>
                                        <asp:ListItem>2020</asp:ListItem>
                                        <asp:ListItem>2021</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="typId" Font-Size="Medium" runat="server" Text="Type: "></asp:Label>
                                    <asp:DropDownList class="form-select form-select-sm mb-3" ID="TypeID" runat="server">
                                        <asp:ListItem>Open this select menu</asp:ListItem>
                                        <asp:ListItem>One</asp:ListItem>
                                        <asp:ListItem>Two</asp:ListItem>
                                        <asp:ListItem>Three</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="showId" class="d-block" Font-Size="Medium" runat="server" Text="Show Action"></asp:Label>
                                    <asp:Button class="btn btn-sm btn-info" ID="btnShowID" runat="server" OnClick="showBtnClick" Text="Show Budget" />
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="saveId" class="d-block" Font-Size="Medium" runat="server" Text="Save Action"></asp:Label>
                                    <asp:Button class="btn btn-sm btn-success" ID="btnSaveID" runat="server" OnClick="saveBtnClick" Text="Save Budget" />
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
                            <asp:GridView ID="BudgEntrlist" runat="server" AutoGenerateColumns="False" Font-Size="12px" ShowFooter="True" CellPadding="8" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" CssClass="auto-style5" Width="100%" OnSelectedIndexChanged="BudgEntrlist_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="COA Code" SortExpression="emp">
                                        <ItemTemplate>
                                            <asp:Label ID="CoaCode" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Account Head" SortExpression="coa">
                                        <ItemTemplate>
                                            <asp:Label ID="AccountHead" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left"/>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Distribution Type" SortExpression="coaName">
                                        <ItemTemplate>
                                            <asp:Label ID="DistrTyp" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total Amount" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="AccTypeID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="July" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="JulAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="JulTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="August" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="AugAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="AugTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="September" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="SepAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="SepTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="October" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="OctAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="OctTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="November" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="NovAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="NovTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="December" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="DecAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="DecTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="January" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="JanAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="JanTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="February" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="FebAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="FebTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="March" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="MarAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="MarTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="April" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="AprAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="AprTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="May" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="MayAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="MayTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="June" SortExpression="accType">
                                        <ItemTemplate>
                                            <asp:Label ID="JunAmntID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="JunTolID" Font-Size="Medium" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="center" />
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
