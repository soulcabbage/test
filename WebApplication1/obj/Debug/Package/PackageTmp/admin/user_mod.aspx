<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true"
    CodeBehind="user_mod.aspx.cs" Inherits="WebApplication1.admin.user_mod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>
            &nbsp;</p>
    </div>
    <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;"
        cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
        <tr>
            <td align="center" class="style1">
                <b>用户信息</b>
            </td>
        </tr>
        <tr height=22>
		    <td align=center >用户权限：
                <asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="True" Width="200px" 
                    onselectedindexchanged="ddlUser_SelectedIndexChanged" >
                    <asp:ListItem Value="0">学生</asp:ListItem>
                    <asp:ListItem Value="1">教师</asp:ListItem>
                    <asp:ListItem Value="2">管理员</asp:ListItem>
                </asp:DropDownList>
            </td>
		</tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID"
                    CellPadding="4" GridLines="None" Width="100%" OnRowDeleting="GridView1_RowDeleting"
                    ForeColor="#333333">
                    <Columns>
                        <asp:TemplateField HeaderText="用户ID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("UserID")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <%# (Container.DataItemIndex+1)%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="账号">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server"><%# Eval("UserNum")%></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("UserName") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="密码">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("UserPwd")%></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="邮箱">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("UserEmail")%></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" DeleteText="删除">
                            <HeaderStyle Wrap="False" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="height: 24px" align="right">
                <asp:Button ID="export" runat="server" Text="导出" OnClick="export_Click" />
                &nbsp; &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
