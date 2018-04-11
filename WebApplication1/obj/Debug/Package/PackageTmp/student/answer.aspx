<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.Master" AutoEventWireup="true" CodeBehind="answer.aspx.cs" Inherits="WebApplication1.student.answer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>&nbsp;</p>
    </div>
    <table cellSpacing="0" style="FONT-SIZE: 14px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=500 align="center" bgcolor="#eeeeee" border="1" bordercolor=gray>
		<tr height=40>
			<td align=center>						
				<IMG height="25" src="../../res/spellcheck.png">
                <b><asp:Label ID="lblPaperName" runat="server"></asp:Label>试题答案</b>				
			</td>
		</tr>				
		<tr>
			<td>                        
                <asp:GridView ID="GridView1" runat="server" Width=100% AutoGenerateColumns="False">
                    <Columns>
				        <asp:TemplateField>
				            <HeaderTemplate>				                    
				                <asp:Label id="Label24" runat="server" Text="一、单选题(每题"></asp:Label>
								<asp:Label id="Label27" runat="server"></asp:Label>
                                <asp:Label ID="Label25" runat="server" Text="分)"></asp:Label>
				            </HeaderTemplate>
					        <ItemTemplate>
						        <table id="Table2" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							        <tr>
								        <td colSpan="3">
									        <asp:Label id=Label1 runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
									        <asp:Label id=Label2 runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
									        <asp:Label id=Label3 runat="server" ForeColor=red Text='<%# Eval("Answer") %>' ></asp:Label>
									        <asp:Label id=Label4 runat="server" Text='<%# Eval("Mark") %>' Visible=false></asp:Label>									                
									    </td>
							        </tr>
							        <tr>
								        <td width="35%">
									        <asp:RadioButton id=RadioButton1 runat="server" Text='<%# Eval("AnswerA") %>' GroupName="Sl">
									        </asp:RadioButton>
                                        </td>
								        <td width="35%">
									        <asp:RadioButton id=RadioButton2 runat="server" Text='<%# Eval("AnswerB") %>' GroupName="Sl">
									        </asp:RadioButton>
                                        </td>
								        <td></td>
							        </tr>
							        <tr>
								        <td width="35%">
									        <asp:RadioButton id=RadioButton3 runat="server" Text='<%# Eval("AnswerC") %>' GroupName="Sl">
									        </asp:RadioButton>
                                        </td>
								        <td width="35%">
									        <asp:RadioButton id=RadioButton4 runat="server" Text='<%# Eval("AnswerD") %>' GroupName="Sl">
									        </asp:RadioButton>
                                        </td>
								        <td></td>
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
                <asp:GridView ID="GridView2" runat="server" Width=100% AutoGenerateColumns="False">
                    <Columns>
				        <asp:TemplateField>
				            <HeaderTemplate>				                    
				                <asp:Label id="Label22" runat="server" Text="二、多选题(每题"></asp:Label>
								<asp:Label id="Label28" runat="server"></asp:Label>
                                <asp:Label ID="Label23" runat="server" Text="分)"></asp:Label>
				            </HeaderTemplate>
					        <ItemTemplate>
						        <table id="Table3" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							        <tr>
								        <td colSpan="3">
									        <asp:Label id=Label5 runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
									        <asp:Label id=Label6 runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
									        <asp:Label id=Label7 runat="server" ForeColor=red Text='<%# Eval("Answer") %>'></asp:Label>
									        <asp:Label id=Label8 runat="server" Text='<%# Eval("Mark") %>' Visible="false"></asp:Label>									                
									    </td>
							        </tr>
							        <tr>
								        <td style="HEIGHT: 22px" width="35%">
									        <asp:CheckBox id=CheckBox1 runat="server" Text='<%# Eval("AnswerA") %>'>
									        </asp:CheckBox>
                                        </td>
								        <td style="HEIGHT: 22px" width="35%">
									        <asp:CheckBox id=CheckBox2 runat="server" Text='<%# Eval("AnswerB") %>'>
									        </asp:CheckBox>
                                        </td>
								        <td style="HEIGHT: 22px"></td>
							        </tr>
							        <tr>
								        <td width="35%">
									        <asp:CheckBox id=CheckBox3 runat="server" Text='<%# Eval("AnswerC") %>'>
									        </asp:CheckBox>
                                        </td>
								        <td width="350%">
									        <asp:CheckBox id=CheckBox4 runat="server" Text='<%# Eval("AnswerD") %>'>
									        </asp:CheckBox>
                                        </td>
								        <td></td>
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
                <asp:GridView ID="GridView3" runat="server" Width=100% AutoGenerateColumns="False">
                    <Columns>
				        <asp:TemplateField>
				            <HeaderTemplate>				                    
				                <asp:Label id="Label20" runat="server" Text="三、判断题(每题"></asp:Label>
								<asp:Label id="Label29" runat="server"></asp:Label>
                                <asp:Label ID="Label21" runat="server" Text="分)"></asp:Label>
				            </HeaderTemplate>
					        <ItemTemplate>
						        <table id="Table4" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							        <tr>
								        <td width="85%">
									        <asp:Label id=Label9 runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
									        <asp:Label id=Label10 runat="server" Text='<%# Eval("Title","、{0}") %>'></asp:Label>
									        <asp:Label id=Label11 runat="server" ForeColor=red Text='<%# Eval("Answer") %>'></asp:Label>
									        <asp:Label id=Label12 runat="server" Text='<%# Eval("Mark") %>' Visible="false"></asp:Label>									                
									    </td>
								        <td width="15%">
									        <asp:CheckBox id="CheckBox5" runat="server" Text="正确"></asp:CheckBox>
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
                <asp:GridView ID="GridView4" runat="server" Width=100% AutoGenerateColumns="False">
                    <Columns>
				        <asp:TemplateField >
				            <HeaderTemplate>				                    
				                <asp:Label id="Label18" runat="server" Text="四、填空题(每题"></asp:Label>
								<asp:Label id="Label30" runat="server" ></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text="分)"></asp:Label>
				            </HeaderTemplate>
					        <ItemTemplate>
						        <table id="Table5" cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">
							        <tr>
								        <td>
									        <asp:Label id=Label13 runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
									        <asp:Label id=Label14 runat="server" Text='<%# Eval("FrontTitle","、{0}") %>'></asp:Label>
									        <asp:TextBox id="TextBox1" runat="server" ForeColor=red Width="100px" Text='<%# Eval("Answer") %>'></asp:TextBox>
									        <asp:Label id=Label15 runat="server" Text='<%# Eval("BackTitle") %>'></asp:Label>									                
									        <asp:Label id=Label17 runat="server" Text='<%# Eval("Mark") %>' Visible=false></asp:Label>									                												                
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
	</table>
</asp:Content>
