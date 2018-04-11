<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="user_add.aspx.cs" Inherits="WebApplication1.admin.user_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 50px;
        }
        .style2
        {
            height: 22px;
        }
    </style>
    <%--<div class=codesniptitle>[Column(Storage="_UserID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]</div>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table cellSpacing="0" style="FONT-SIZE: 14px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=500 align="center" bgcolor="#eeeeee" border="1" bordercolor=gray>
		<tr>
			<td colSpan="2" align=center class="style1">						
				<IMG height="25" src="../../res/add.png">
                <b>添加用户</b>			
			</td>
		</tr>	
		<tr height="30px">
			<td align="center" nowrap class="style2" width=150>用户编号</td>
			<td >
				<asp:TextBox id="txtUserNum"  runat="server" width=200 MaxLength="20" style="margin-left: 0px" Height="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserNum" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
            </td>
		</tr>				
		<tr height="30px">
			<td align="center" nowrap class="style2" width=150>用户姓名</td>
			<td>
				<asp:TextBox id="txtUserName" runat="server" width=200 MaxLength="20" Height="25"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
			</td>
		</tr>
				
		<tr height="30px">
			<td align="center" nowrap class="style2" width=150>用户密码</td>
			<td>
				<asp:TextBox id="txtUserPwd"  runat="server" width=200 MaxLength="20" TextMode=password Height="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserPwd" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
            </td>
		</tr>
        <tr height="30px">
			<td align="center" nowrap class="style2" width=150>用户邮箱</td>
			<td >
				<asp:TextBox id="txtUserEmail"  runat="server" width=200 MaxLength="20" Height="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
            </td>
		</tr>	
		<tr height="30px">
			<td align="center" class="style2">用户角色</td>
			<td>
				<asp:DropDownList id="ddlUserPower" runat="server" Width="150px">
                    <asp:ListItem Value="0">学生</asp:ListItem>
                    <asp:ListItem Value="1">教师</asp:ListItem>
                    <asp:ListItem Value="2">管理员</asp:ListItem>
                </asp:DropDownList></td>
		</tr>			
		<tr align="center" height="55">
			<td colSpan="2">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br />
				<asp:Button ID="保存" runat="server" Text="保存" onclick="save_Click" />
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  
                <asp:Button ID="清空" runat="server" Text="清空" onclick="clear_Click" />
                &nbsp; &nbsp;
			</td>
		</tr>
	</table>
</asp:Content>
