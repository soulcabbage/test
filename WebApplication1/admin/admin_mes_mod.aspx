<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="admin_mes_mod.aspx.cs" Inherits="WebApplication1.admin.admin_mes_mod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
        <p>&nbsp;</p>
    </div>
      
    <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;"
        cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
        <tr>
            <td colspan="2" height="50" align="center">
                <img height="25" src="../../res/modify.png">
                <b>账户信息修改</b>
            </td>
        </tr>
        <tr>
            <td align="center" width="150" class="style1">
                用户账号
            </td>
            <td class="style1">
                <asp:Label ID="txtUserNum" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" height="30" width="150">
                用户姓名
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" MaxLength="20" Width="200px" Height="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                    ErrorMessage="*" ForeColor="red" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" height="30" width="150">
                用户密码
            </td>
            <td>
                <asp:TextBox ID="txtUserPwd" runat="server" AssociatedControlID="txtUserPwd" Width="200"
                    Height="25px" MaxLength="20" TextMode="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd"
                    ErrorMessage="*" ValidationGroup="UpdateUserValidationGroup" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" height="30" width="150">
                确认密码
            </td>
            <td>
                <asp:TextBox ID="txtUserPwd2" runat="server" AssociatedControlID="txtUserPwd2" Width="200"
                    Height="25px" MaxLength="20" TextMode="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserPwd2"
                    ErrorMessage="*" ValidationGroup="UpdateUserValidationGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="txtUserPwd"
                    ControlToValidate="txtUserPwd2" Display="Dynamic" ErrorMessage="密码不一致" ValidationGroup="UpdateUserValidationGroup"
                    ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="center" height="30" width="150">
                用户邮箱
            </td>
            <td>
                <asp:TextBox ID="txtUserEmail" runat="server" MaxLength="50" Width="200px" Height="25"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserEmail"
                    ErrorMessage="*" ForeColor="red"  ValidationGroup="UpdateUserValidationGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr height="50">
            <td align="center" colspan="2">
                <asp:Button ID="Sure" runat="server" Text="确认" OnClick="Sure_Click"  ValidationGroup="UpdateUserValidationGroup"/>
            </td>
        </tr>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="false" ShowSummary="false" CssClass="failureNotification" 
                 ValidationGroup="UpdateUserValidationGroup" />
    </table>
</asp:Content>
