<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true"
    CodeBehind="exam_a.aspx.cs" Inherits="WebApplication1.student.exam_a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div  align="center">
         <b>考试剩余时间：</b><asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
        
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                 <asp:Timer ID="Timer2" runat="server" Interval="1000" ontick="Timer2_Tick">
                 </asp:Timer>
                 <asp:Label ID="Label31" runat="server" Text=""></asp:Label>
             </ContentTemplate>
         </asp:UpdatePanel>
        
    </div>
    <table cellSpacing="0" style="FONT-SIZE: 14px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=500 align="center" bgcolor="#eeeeee" border="1" bordercolor=gray>
        <tr>
            <td align="center" class="style1">
                <img height="25" src="../../res/modify.png">
                <b>试题:<asp:Label ID="lblPaperName" runat="server"></asp:Label></b>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle">
                <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="false" Height="27px">
                    <asp:Button ID="Answer" runat="server" Text="答案" OnClick="Answer_Click" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label24" runat="server" Text="一、单选题(每题"></asp:Label>
                                <asp:Label ID="Label27" runat="server"></asp:Label>
                                <asp:Label ID="Label25" runat="server" Text="分)"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table id="Table2" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Answer") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Mark") %>' Visible="false"></asp:Label>
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
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label22" runat="server" Text="二、多选题(每题"></asp:Label>
                                <asp:Label ID="Label28" runat="server"></asp:Label>
                                <asp:Label ID="Label23" runat="server" Text="分)"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table id="Table3" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="Label5" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Answer") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Mark") %>' Visible="false"></asp:Label>
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
                                        <td width="35%">
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
                <asp:GridView ID="GridView3" runat="server" Width="100%" AutoGenerateColumns="False"
                    PageSize="2">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label20" runat="server" Text="三、判断题(每题"></asp:Label>
                                <asp:Label ID="Label29" runat="server"></asp:Label>
                                <asp:Label ID="Label21" runat="server" Text="分)"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table id="Table4" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                    <tr>
                                        <td width="85%">
                                            <asp:Label ID="Label9" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Answer") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Mark") %>' Visible="false"></asp:Label>
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
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:Label ID="Label18" runat="server" Text="四、填空题(每题"></asp:Label>
                                <asp:Label ID="Label30" runat="server"></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text="分)"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <table id="Table5" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("FrontTitle","、{0}") %>'></asp:Label>
                                            <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("BackTitle") %>'></asp:Label>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Eval("Answer") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Label17" runat="server" Text='<%# Eval("Mark") %>' Visible="false"></asp:Label>
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
            <td align="center">
                <asp:Button ID="Submit" runat="server" Text="提交" OnClick="Submit_Click" />
            </td>
        </tr>
        
    </table>
</asp:Content>
