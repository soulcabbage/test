<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true"
    CodeBehind="testpaper_mod.aspx.cs" Inherits="WebApplication1.teacher.testpaper_mod" %>

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
                    DataKeyNames="PaperID" CellPadding="4" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
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
                        <asp:TemplateField HeaderText="试卷状态">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"><%#GetState(DataBinder.Eval(Container, "DataItem.PaperState"))%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPaperState" runat="server" Text='<%# Eval("PaperState") %>' Width="30"></asp:TextBox>
                            </EditItemTemplate>
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
                        <asp:CommandField ShowEditButton="True" HeaderText="编辑" EditText="编辑" UpdateText="更新"
                            CancelText="取消">
                            <HeaderStyle Wrap="False" />
                        </asp:CommandField>
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
            <td style="height: 24px" align="center">
            </td>
        </tr>
    </table>
</asp:Content>
