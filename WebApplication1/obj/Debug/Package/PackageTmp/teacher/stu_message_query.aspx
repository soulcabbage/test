<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true" CodeBehind="stu_message_query.aspx.cs" Inherits="WebApplication1.teacher.stu_message_query" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript">
        function CheckBoxSel(box) {
            for (var i = 0; i < document.Form1.elements.length; i++) {
                var e = document.Form1.elements[i];
                if (e.type == 'checkbox') {
                    var o = e.name.lastIndexOf('xuanze');
                    if (o != -1) {
                        e.checked = box.checked;
                    }
                }
            }
        }          
	</script>
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
    <table  cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;" cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
		<tr>
		    <td align=center class="style1"><b>学生信息</b>
		    </td>
		</tr>
        <%--<tr height=22>
		    <td align=center >考试科目：
                <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" Width="200px" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
		</tr>--%>
		<tr>
		    <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="UserID" CellPadding="4" GridLines="None" Width="100%"  
                    OnRowDeleting="GridView1_RowDeleting" ForeColor="#333333" >
                    <Columns>
                        <asp:TemplateField HeaderText="选择">
                            <ItemTemplate>
                                <asp:CheckBox ID="xuanze" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="成绩编号" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("UserID")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="学号">                                
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
                                <asp:Label ID="Label3" runat="server"><%# Eval("UserPower")%></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="邮箱">                                
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("UserEmail")%></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField> 
                                             
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" DeleteText="删除" >
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
		    <td style="height: 24px">
                <INPUT type="checkbox" onclick="CheckBoxSel(this)">全选/全不选
                 &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                <asp:Button ID="delete" runat="server" onclick="delete_Click" Text="删除" />
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:Button ID="export" runat="server" Text="导出" onclick="export_Click" />
                &nbsp; &nbsp;
            </td>
		</tr>
	</table>
</asp:Content>
