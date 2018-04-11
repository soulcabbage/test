<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="not_test.aspx.cs" Inherits="WebApplication1.student.not_test" %>
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
    <table id="Form1" cellspacing="0" style="font-size: 14px; font-family: Tahoma; border-collapse: collapse;"
        cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
        <tr>
            <td align="center" class="style1">
                <b>试卷管理</b>
            </td>
        </tr>
        <tr height="22">
            <td align="center">
                考试科目：
                <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" Width="200px"
                    OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False"
                    DataKeyNames="PaperID" CellPadding="4" GridLines="None"
                    ForeColor="#333333">
                    <Columns>
                        <asp:TemplateField HeaderText="编号" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"><%# Eval("PaperID") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <%# (Container.DataItemIndex+1)%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="试卷名称">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"><%# Eval("PaperName") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="考试时间">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server"><%# Eval("Time") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="考试时长">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"><%# Eval("Longth") %></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="总分" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server"><%# Eval("SumMark") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="PaperID" 
                            DataNavigateUrlFormatString="exam_a.aspx?PaperID={0}" HeaderText="操作" 
                            Text="开始考试" />
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
            <td style="height: 24px" align="center">
            </td>
        </tr>
    </table>
</asp:Content>
