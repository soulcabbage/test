<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true"
    CodeBehind="stu_grade_query.aspx.cs" Inherits="WebApplication1.teacher.stu_grade_query" %>

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
        <p>
            &nbsp;</p>
    </div>
    <table cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;"
        cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
        <tr>
            <td align="center" class="style1">
                <b>学生成绩</b>
            </td>
        </tr>
        <tr height="30px">
            <td align="center">
                课程：
                <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" Width="150px"
                    OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;&nbsp; 试卷：
                <asp:DropDownList ID="ddlPaper" runat="server" AutoPostBack="True" Width="150px"
                    OnSelectedIndexChanged="ddlPaper_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                    CellPadding="4" GridLines="None" Width="100%" OnRowDeleting="GridView1_RowDeleting"
                    ForeColor="#333333">
                    <Columns>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <%# (Container.DataItemIndex+1)%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="成绩编号" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("ID") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="用户姓名">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("UserName") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="试卷">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("PaperName") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="成绩">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%# Eval("Score") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="考试时间">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server"><%# Eval("ExamTime") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="删除" DeleteText="删除">
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
            <td style="height: 24px" align="right">
                <asp:Button ID="delete" runat="server" OnClick="delete_Click" Text="删除" Visible="false" />
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:Button ID="export" runat="server" Text="导出" OnClick="export_Click" />
                &nbsp; &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
