<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true" CodeBehind="teacher_mes.aspx.cs" Inherits="WebApplication1.teacher.teacher_mes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>&nbsp;</p>
    </div>
      
    <table cellSpacing="0" style="FONT-SIZE: 14px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=500 align="center" bgcolor="#eeeeee" border="1" bordercolor=gray>
        <tr >
            <td colspan="2" height="50" align="center">
                <img height="25" src="../../res/profile.png">
                <b>账户信息</b>
            </td>
        </tr>   
        <tr>
            <td align="center" height="30" width="150">
                用户账号
            </td>
            <td>          
                <asp:Label ID="UserNum" runat="server" Text=""></asp:Label>          
            </td>
            
        </tr>
        <tr>
            <td align="center" height="30" width="150">
                用户姓名
            </td>
            <td>           
                <asp:Label ID="UserName" runat="server" Text=""></asp:Label>           
            </td>
        </tr>
        <tr>
            <td align="center" height="30" width="150">
                用户密码
            </td>
            <td>        
                <asp:Label ID="UserPwd" runat="server" Text=""></asp:Label>            
            </td>
        </tr>
        <tr>
            <td align="center" height="30" width="150">
                用户邮箱
            </td>
            <td>          
                <asp:Label ID="UserEmail" runat="server" Text=""></asp:Label>           
            </td>
        </tr>
        <tr height="50">
            <td align="center" colspan="2">
                <asp:Button ID="Change" runat="server" Text="修改" OnClick="Change_Click" />
            </td>
        </tr>
    </table>

</asp:Content>
