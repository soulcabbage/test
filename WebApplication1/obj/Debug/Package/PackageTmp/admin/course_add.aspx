<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="course_add.aspx.cs" Inherits="WebApplication1.admin.course_add" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>&nbsp;</p>
    </div>
    <table cellSpacing="0" style="FONT-SIZE: 14px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=560 align="center" bgcolor="#eeeeee" border="1" bordercolor=gray>
	    <tr>
			<td colSpan="2" align=center class="style1">						
				<IMG height="25" src="../../res/add.png">
                <b>考试科目</b>				
			</td>
		</tr>
		<tr>
			<td align=right nowrap class="style2" width=200>科目名称：</td>
			<td class="style2" >
				<asp:TextBox id="txtName"  runat="server" width=200 MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="不能为空！"></asp:RequiredFieldValidator>
            </td>
		</tr>				
						
		<tr align="center" height="55">
			<td colSpan="2"><asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
				<asp:Button ID="保存" runat="server" Text="保存" onclick="save_Click" />
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  
                <asp:Button ID="清空" runat="server" Text="清空" onclick="clear_Click" />
                &nbsp; &nbsp;
			</td>
		</tr>				
	</table>
</asp:Content>
