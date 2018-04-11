<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true" CodeBehind="singleselect_mod.aspx.cs" Inherits="WebApplication1.teacher.singleselect_mod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>&nbsp;</p>
    </div>
    <table  cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;" cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
		<tr height=40>
		    <td align="center"><b>单选题信息</b>
		    </td>
		</tr>
		<tr height=30>
		    <td align="center">考试科目：
                <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" Width="200px" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
		</tr>
		<tr>
		    <td align="center">
                <asp:GridView ID="GridView1" runat="server" Width="100%" 
                    AutoGenerateColumns="False" DataKeyNames="ID" CellPadding="4" GridLines="None" 
                    OnRowDeleting="GridView1_RowDeleting" ForeColor="#333333">
                    <Columns>
                        <asp:TemplateField HeaderText="编号" Visible=false>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("ID") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <%# (Container.DataItemIndex+1)%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="题目">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("Title") %>......</asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                                                               
                        <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="singleselect_add.aspx?ID={0}" HeaderText="详细..." Text="详细..." />                                           
                        
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" DeleteText="删除" />
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
