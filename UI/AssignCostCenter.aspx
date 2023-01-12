<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignCostCenter.aspx.cs" Inherits="UI.PaymentRagister.AssignCostCenter" %>

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
                                <asp:Label ID="lblAssign" CssClass="lbl" runat="server" Font-Size="X-Large" Text="ASSIGN COST CENTER" BorderColor="#CCCCCC" ForeColor="black" Style="background-color: #efeff5; text-align: center"></asp:Label>
                            </div>
                        </div>

                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-4" style="text-align: right;">
                                        <asp:Label ID="lblUnit" runat="server" Text="Unit:"></asp:Label>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:DropDownList ID="ddUnit" runat="server" class="form-select form-select-sm" OnSelectedIndexChanged="ddUnit_SelectedIndexChanged">
                                            <asp:ListItem Text="AHCL" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="AJML" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="AMFL" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="APL" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="APPFL" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="ML" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="MWDL" Value="7"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-6" style="text-align: right;">
                                        <asp:Label ID="lblJs" runat="server" Text="Job Station:"></asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlJs" runat="server" class="form-select form-select-sm">
                                            <asp:ListItem Text="Job Station1" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Job Station2" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-4" style="text-align: right;">
                                    <asp:Label ID="lblEmp" runat="server" Text="Employee:"></asp:Label>
                                </div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txtEmp" runat="server" Width="400px"></asp:TextBox>
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
                <%-- <asp:TemplateField HeaderText="ID" SortExpression="intId">
                    <ItemTemplate>
                        <asp:Label ID="lblintId" Font-Size="Medium" runat="server" Text='<%# Bind("intEnroll") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cost Center Name" SortExpression="intId">
                    <ItemTemplate>
                        <asp:Label ID="lblintId" Font-Size="Medium" runat="server" Text='<%# Bind("intEnroll") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Last Level" SortExpression="srId">
                    <ItemTemplate>
                        <asp:Label ID="txtName" Font-Size="Medium" runat="server" Text='<%# Bind("strName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Responsible" SortExpression="srId">
                    <ItemTemplate>
                        <asp:Label ID="lblFatherName" Font-Size="Medium" runat="server" Text='<%# Bind("strFather") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Action" SortExpression="srId">
                    <ItemTemplate>
                        <div class="btn-group btn-group-sm" role="group" aria-label="Basic mixed styles example">
                            <asp:Button class="btn btn-sm btn-info" ID="btnShowSUb" runat="server" OnClick="showBtnClick" Text="Show Sub" />
                            <asp:Button class="btn btn-sm btn-info" ID="btnAssign" runat="server" OnClick="assignBtnClick" Text="Assign" />
                            <asp:Button class="btn btn-sm btn-info" ID="btnCancel" runat="server" OnClick="cancelBtnClick" Text="Cancel Assign" />
                        </div>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="left" />
                </asp:TemplateField>

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
</body>
</html>
