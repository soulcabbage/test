<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true"
    CodeBehind="singleselect_add.aspx.cs" Inherits="WebApplication1.teacher.singleselect_add" %>

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
    <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;" cellpadding="0" width="350" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
        <tr>
            <td colspan="2" align=center class="style1">
                <img height="25" src="../../res/add.png" alt="单选题" />
                <b>单选题</b>
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
            <td align="center" width="60" nowrap>题&nbsp; &nbsp;目：</td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="500px" TextMode="MultiLine" Height="80px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitle" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" >答案A：</td>
            <td>
                <asp:TextBox ID="txtAnswerA" runat="server" Width="500px" TextMode="MultiLine" Height="50px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAnswerA"  ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" width="60">答案B：</td>
            <td>
                <asp:TextBox ID="txtAnswerB" runat="server" Width="500px" TextMode="MultiLine" Height="50px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAnswerB" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" width="60">答案C：</td>
            <td>
                <asp:TextBox ID="txtAnswerC" runat="server" Width="500px" TextMode="MultiLine" Height="50px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAnswerC"  ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" width="60">答案D：</td>
            <td>
                <asp:TextBox ID="txtAnswerD" runat="server" Width="500px" TextMode="MultiLine" Height="50px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAnswerD" ErrorMessage="不能为空！">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" height="10" width="60"> 答&nbsp; &nbsp;案：</td>
            <td>
                <asp:DropDownList ID="ddlAnswer" runat="server" Font-Size="9pt" Width="50px">
                    <asp:ListItem Value="A">A</asp:ListItem>
                    <asp:ListItem Value="B">B</asp:ListItem>
                    <asp:ListItem Value="C">C</asp:ListItem>
                    <asp:ListItem Value="D">D</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr align="center" height="50">
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" ForeColor="red"></asp:Label><br />
                <asp:Button ID="保存" runat="server" Text="保存" onclick="save_Click" 
                    style="height: 26px" />
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:Button ID="清空" runat="server" Text="清空" onclick="clear_Click" />
                &nbsp; &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
