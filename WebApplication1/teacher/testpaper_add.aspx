<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true"
    CodeBehind="testpaper_add.aspx.cs" Inherits="WebApplication1.teacher.testpaper_add" %>

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
        #d241
        {
            width: 110px;
            height: 22px;
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
            <td colspan="4" align="center" class="style1">
                <img height="25" src="../../res/add.png">
                <b>试卷添加</b>
            </td>
        </tr>
        <tr>
            <td nowrap class="style2" align="center">
                试题科目：
            </td>
            <td class="style2">
                <asp:DropDownList ID="ddlCourse" runat="server" Font-Size="9pt" Width="120px">
                </asp:DropDownList>
            </td>
            <td nowrap class="style2" align="center">
                练习名称：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtPaperName" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <script language="javascript" type="text/javascript" src="../DatePicker/WdatePicker.js"></script>
            <td nowrap class="style2" align="center">
                练习时间：
            </td>
            <td class="style2">
                <input type="text" id="d241" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
                    class="Wdate" runat="server" width="120px" />
            </td>
            <td nowrap class="style2" align="center">
                练习时长：
            </td>
            <td class="style2">
                <asp:TextBox ID="longth" runat="server" Width="90px"></asp:TextBox>分钟
            </td>
        </tr>
        <tr height="30">
            <td colspan="4">
                <b>单选题：</b>
            </td>
        </tr>
        <tr>
            <td class="style2" align="center">
                题目数目：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtSingleNum" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td class="style2" align="center">
                每题分值：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtSingleFen" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr height="30">
            <td colspan="4" style="height: 30px">
                <b>多选题：</b>
            </td>
        </tr>
        <tr>
            <td class="style2" align="center">
                题目数目：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtMultiNum" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td class="style2" align="center">
                每题分值：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtMultiFen" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr height="30">
            <td colspan="4">
                <b>判断题：</b>
            </td>
        </tr>
        <tr>
            <td class="style2" align="center">
                题目数目：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtJudgeNum" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td class="style2" align="center">
                每题分值：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtJudgeFen" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr height="30">
            <td colspan="4">
                <b>填空题：</b>
            </td>
        </tr>
        <tr>
            <td class="style2" align="center">
                题目数目：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtFillNum" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td class="style2" align="center">
                每题分值：
            </td>
            <td class="style2">
                <asp:TextBox ID="txtFillFen" runat="server" Width="120px"></asp:TextBox>
            </td>
        </tr>
        <tr height="40">
            <td colspan="4" align="center">
                <asp:Button ID="确定" runat="server" Text="确定" OnClick="sure_Click" />
                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                <asp:Button ID="清空" runat="server" Text="清空" OnClick="clear_Click" />
                &nbsp; &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="False">
                    <table cellspacing="0" style="font-size: 12px; font-family: Tahoma; border-collapse: collapse;"
                        cellpadding="0" width="500" align="center" bgcolor="#eeeeee" border="1" bordercolor="gray">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="一、选择题">
                                            <ItemTemplate>
                                                <table id="Table2" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                                    <tr>
                                                        <td colspan="3">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="35%">
                                                            <asp:RadioButton ID="RadioButton1" runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl">
                                                            </asp:RadioButton>
                                                        </td>
                                                        <td width="35%">
                                                            <asp:RadioButton ID="RadioButton2" runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl">
                                                            </asp:RadioButton>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="35%">
                                                            <asp:RadioButton ID="RadioButton3" runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl">
                                                            </asp:RadioButton>
                                                        </td>
                                                        <td width="35%">
                                                            <asp:RadioButton ID="RadioButton4" runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl">
                                                            </asp:RadioButton>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="二、多选题">
                                            <ItemTemplate>
                                                <table id="Table3" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                                    <tr>
                                                        <td colspan="3">
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 22px" width="35%">
                                                            <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("AnswerA") %>'></asp:CheckBox>
                                                        </td>
                                                        <td style="height: 22px" width="35%">
                                                            <asp:CheckBox ID="CheckBox2" runat="server" Text='<%# Eval("AnswerB") %>'></asp:CheckBox>
                                                        </td>
                                                        <td style="height: 22px">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="35%">
                                                            <asp:CheckBox ID="CheckBox3" runat="server" Text='<%# Eval("AnswerC") %>'></asp:CheckBox>
                                                        </td>
                                                        <td width="350%">
                                                            <asp:CheckBox ID="CheckBox4" runat="server" Text='<%# Eval("AnswerD") %>'></asp:CheckBox>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView3" runat="server" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="三、判断题">
                                            <ItemTemplate>
                                                <table id="Table4" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                                    <tr>
                                                        <td width="85%">
                                                            <asp:Label ID="Label19" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                                        </td>
                                                        <td width="15%">
                                                            <asp:CheckBox ID="CheckBox5" runat="server" Text="正确"></asp:CheckBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView4" runat="server" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="四、填空题">
                                            <ItemTemplate>
                                                <table id="Table5" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label16" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                            <asp:Label ID="Label17" runat="server" Text='<%# Eval("FrontTitle","、{0}") %>'></asp:Label>
                                                            <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                                                            <asp:Label ID="Label18" runat="server" Text='<%# Eval("BackTitle") %>'></asp:Label>
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Font-Size="12pt" HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 24px">
                                <asp:Button ID="保存" runat="server" Text="保存" OnClick="save_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
