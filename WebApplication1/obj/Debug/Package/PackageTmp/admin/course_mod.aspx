<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="course_mod.aspx.cs" Inherits="WebApplication1.admin.course_mod" %>
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
        <p>&nbsp;</p>
    </div>
    <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;" cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
            <tr>
                <td align="center" class="style1">
                    <b>科目管理</b>
                </td>
            </tr>            
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        Width=100% CellPadding="4" DataKeyNames="ID"
                        GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" 
                        OnRowUpdating="GridView1_RowUpdating" ForeColor="#333333" >
                        <Columns>
                            <asp:TemplateField HeaderText="编号">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server"><%# Eval("ID") %></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="考试科目">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"><%# Eval("Name") %></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' Width="80"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>                                                     
                            <asp:CommandField HeaderText="编辑" ShowEditButton="True" EditText="编辑" />
                            <asp:TemplateField HeaderText="删除" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确认要删除吗？');" 
                                        Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                <td style="height: 24px" align=center>
                </td>
            </tr>
        </table>
</asp:Content>
