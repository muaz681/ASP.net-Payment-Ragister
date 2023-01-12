<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemMasterBridge.aspx.cs" Inherits="UI.PaymentRagister.ItemMasterBridge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"><%: Scripts.Render("~/Content/Bundle/jqueryJS") %></asp:PlaceHolder> 
    <webopt:BundleReference ID="BundleReference2" runat="server" Path="~/Content/Bundle/defaultCSS" />     
    <webopt:BundleReference ID="BundleReference3" runat="server" Path="~/Content/Bundle/hrCSS" />

    <link href="../Content/CSS/bootstrap5.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">

                <div class="card">
                    <h3 class="card-header"></h3>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12" style="text-align: center;">
                                <asp:Label ID="lblItmMstr" CssClass="lbl" runat="server" Font-Size="X-Large" Text="Item Master Bridge" BorderColor="#CCCCCC" ForeColor="black" Style="background-color: #efeff5; text-align: center"></asp:Label>
                            </div>

                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-5" style="text-align: right;">
                                        <asp:Label ID="lblUnt" runat="server" Text="Unit:"></asp:Label>
                                    </div>
                                    <div class="col-md-7">
                                        <asp:DropDownList ID="ddUnt" runat="server" class="form-select form-select-sm">
                                            <asp:ListItem Text="Akij Assets Ltd" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Akij City Center" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Akij Health Care Ltd." Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Akij Jute Mills Ltd." Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Akij Match Factory Ltd." Value="5"></asp:ListItem>
                                            <asp:ListItem Text="AKij Plastic Ltd.(Pipes & Fittings Unit)" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="AKij Plastic Pipes and Fittings PF Unit" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="Akij Plastics Ltd" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="Mark Limited" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="Mark Wash And Dyeing Limited" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="Sk Nasir Uddin & Co." Value="11"></asp:ListItem>
                                            <asp:ListItem Text="Universal Jute Mills Ltd." Value="12"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="btnRfsItmLst" runat="server" class="btn btn-success" Text="Refresh Item List" />
                                    </div>
                                    <div class="col-md-6">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <br />

        <asp:GridView ID="dgvlist" runat="server" AutoGenerateColumns="False" Font-Size="12px" ShowFooter="True" CellPadding="3" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="auto-style5" Width="1351px" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="dgvlist_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
               <%-- <asp:TemplateField HeaderText="SL" SortExpression="intId">
                    <ItemTemplate>
                        <asp:Label ID="lbSL" Font-Size="Medium" runat="server" Text='<%# Bind("intEnroll") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Unit" SortExpression="srId">
                    <ItemTemplate>
                        <asp:Label ID="txtName" Font-Size="Medium" runat="server" Text='<%# Bind("strName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Full Item Name" SortExpression="srId">
                    <ItemTemplate>
                        <asp:Label ID="lblFatherName" Font-Size="Medium" runat="server" Text='<%# Bind("strFather") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ID" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Master Id" SortExpression="chlnAmount">
                    <ItemTemplate>
                        <asp:Button ID="btnMasterId" runat="server" Text="Master ID" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="125px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UOM" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Item Type" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cluster" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Commodity" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Sub-Catagorey" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Procure Type" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="VAT" SortExpression="srIdsd">
                    <ItemTemplate>
                        <asp:Label ID="lblMotherName" Font-Size="Medium" runat="server" Text='<%# Bind("strMother") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>--%>

            </Columns>

            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.1/mdb.min.js"></script>
</body>
</html>
