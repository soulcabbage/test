<%@ Page Title="" Language="C#" MasterPageFile="~/Account/Site.Master" AutoEventWireup="true"
    CodeBehind="Log_in.aspx.cs" Inherits="WebApplication1.Account.log_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 426px;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td class="style1">
                <h2>
                    用户登录
                </h2>
                <p>
                    请输入您的账号和密码
                    <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">注册</asp:HyperLink>
                </p>
                <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;"
                    cellpadding="0" width="350" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
                    <tr>
                        <td colspan="2" class="style1">
                            <img height="25" src="../../res/profile.png">
                            <b>账户信息</b>
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="right" width="60">
                            帐号：
                        </td>
                        <td height="30">
                            <asp:TextBox ID="txtUserNum" runat="server" MaxLength="20" Width="200px" Height="25px">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserNum"
                                ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" height="30">
                            密码：
                        </td>
                        <td height="30">
                            <asp:TextBox ID="txtPwd" runat="server" MaxLength="20" TextMode="Password" Width="200px" Height="25px">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                                ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr height="50">
                        <td align="center" colspan="2">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="red"></asp:Label><br />
                            <asp:Button ID="Login" runat="server" Text="登录" OnClick="Login_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
            <p>  &nbsp;</p>
                <img src="../../res/login.jpg" style="height: 319px; width: 482px">
            </td>
        </tr>
    </table>
    <div>
    </div>
</asp:Content>
