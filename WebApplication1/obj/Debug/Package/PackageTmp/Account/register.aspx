<%@ Page Title="Register" Language="C#" MasterPageFile="~/Account/Site.master" AutoEventWireup="true"
    CodeBehind="register.aspx.cs" Inherits="WebApplication1.Account.register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 426px;
            height:50px;
        }
        .style2
        {
            width: 70px;
            height: 30px;
        }

    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table>
        <tr>
            <td class="style1">
                <h2>
                    用户注册
                </h2>
                <p>
                    请按提示输入您的信息
                    <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">登陆</asp:HyperLink>
                </p>
                <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;"
                    cellpadding="0" width="350" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
                    <tr>
                        <td colspan="2" class="style1">
                            <img height="25" src="../../res/profile.png">
                            <b>添加用户</b>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap class="style2">
                            编号：
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserNum" runat="server" Width="200" Height="25px" MaxLength="20" Style="margin-left: 0px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserNum"
                                ErrorMessage="*" ValidationGroup="RegisterUserValidationGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" nowrap class="style2">
                            姓名：
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserName" runat="server" Width="200" Height="25px" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="*" ValidationGroup="RegisterUserValidationGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2">
                            密码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserPwd" runat="server" AssociatedControlID="txtUserPwd" Width="200" Height="25px" MaxLength="20" TextMode="password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserPwd"
                                ErrorMessage="*" ValidationGroup="RegisterUserValidationGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2">
                            确认密码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserPwd2" runat="server" AssociatedControlID="txtUserPwd2" Width="200" Height="25px" MaxLength="20" TextMode="password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserPwd2"
                                ErrorMessage="*" ValidationGroup="RegisterUserValidationGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br /><asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="txtUserPwd" ControlToValidate="txtUserPwd2" 
                              Display="Dynamic" ErrorMessage="密码不一致" ValidationGroup="RegisterUserValidationGroup" ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2">
                            邮箱：
                        </td>
                        <td>
                            <asp:TextBox ID="txtUserEmail" runat="server" Width="200" Height="25px"  MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserEmail"
                                ErrorMessage="*" ValidationGroup="RegisterUserValidationGroup" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2">
                            角色：
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUserPower" runat="server" Width="120px" Height="25px">
                                <asp:ListItem Value="0">学生</asp:ListItem>
                                <asp:ListItem Value="1">教师</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr align="center" height="55">
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br />
                            <asp:Button ID="保存" runat="server" Text="保存" OnClick="save_Click"  ValidationGroup="RegisterUserValidationGroup"/>
                            &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                            <asp:Button ID="清空" runat="server" Text="清空" OnClick="clear_Click" />
                            &nbsp; &nbsp;
                        </td>
                    </tr>
                    <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" ShowMessageBox="false" ShowSummary="false" CssClass="failureNotification" 
                 ValidationGroup="RegisterUserValidationGroup"/>
                </table>
            </td>
            <td>
                <img src="../../res/login.jpg" style="height: 319px; width: 482px">
            </td>
        </tr>
    </table>
    <div>
    </div>
</asp:Content>
