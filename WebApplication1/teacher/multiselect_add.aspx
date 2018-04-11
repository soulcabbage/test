<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true" CodeBehind="multiselect_add.aspx.cs" Inherits="WebApplication1.teacher.multiselect_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
    {
        height: 50px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>&nbsp;</p>

    </div>
    <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;" cellpadding="0" width="350" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
		<tr>
			<td colSpan="2" align=center class="style2">						
				<IMG height="25" src="../../res/add.png">
                <b>多选题</b>				
			</td>
		</tr>				
		<tr>
			<td align="center" width="60">科目：</td>
			<td>
                <asp:dropdownlist id="ddlCourse" runat="server" Font-Size="9pt" Width="200px">
                </asp:dropdownlist>
                章：
                <asp:dropdownlist runat="server" width="40px" Height="16px">
                </asp:dropdownlist>
            节：
                <asp:dropdownlist runat="server" width="40px" Height="16px">
                </asp:dropdownlist>
            难度：
                <asp:dropdownlist runat="server" width="40px" Height="16px">
                </asp:dropdownlist>
            </td>            
		</tr>				
				
		<tr>
			<td align="center" width="60">题&nbsp; &nbsp;目：</td>
			<td>
				<asp:textbox id="txtTitle"  runat="server" Width="500px" TextMode="MultiLine" Height="80px">
                </asp:textbox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td align="center" nowrap width="60">答案A：</td>
			<td>
				<asp:textbox id="txtAnswerA"  runat="server"  Width="500px" TextMode="MultiLine" Height="50px">
                </asp:textbox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAnswerA" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
		</tr>
		<tr>
			<td align="center">答案B：</td>
			<td>
				<asp:textbox id="txtAnswerB"  runat="server"  Width="500px" TextMode="MultiLine" Height="50px">
                </asp:textbox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAnswerB" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
		</tr>
		<tr>
			<td align="center">答案C：</td>
			<td>
				<asp:textbox id="txtAnswerC"  runat="server"  Width="500px" TextMode="MultiLine" Height="50px">
                </asp:textbox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAnswerC" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
		</tr>
		<tr>
			<td align="center">答案D：</td>
			<td>
				<asp:textbox id="txtAnswerD" runat="server"  Width="500px" TextMode="MultiLine" Height="50px">
                </asp:textbox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAnswerD" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
		</tr>
		<tr>
			<td align="center" height="10">答&nbsp; &nbsp;案：</td>
			<td>
                <asp:CheckBoxList ID="cblAnswer" runat="server" Repeatdirection="Horizontal">
                    <asp:ListItem>A</asp:ListItem>
                    <asp:ListItem>B</asp:ListItem>
                    <asp:ListItem>C</asp:ListItem>
                    <asp:ListItem>D</asp:ListItem>
                </asp:CheckBoxList>
            </td>
		</tr>
		<tr align="center" height="50">
			<td colSpan="2"><asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
				<asp:Button ID="保存" runat="server" Text="保存" onclick="save_Click" />
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:Button ID="清空" runat="server" Text="清空" onclick="clear_Click" />
                &nbsp; &nbsp;
			</td>
		</tr>
	</table>
</asp:Content>
