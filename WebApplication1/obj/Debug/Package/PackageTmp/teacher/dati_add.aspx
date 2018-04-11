<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.Master" AutoEventWireup="true" CodeBehind="dati_add.aspx.cs" Inherits="WebApplication1.teacher.dati_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #title {
            width:60px;
            margin:50px auto;
            font-weight:900;
            font-size:16px;
            background:url("../../res/add.png") no-repeat;
            text-align:right;
        }
        #neirong {
            display:inline-block;
            width:60%;
            height:200px;
            margin:20px auto;
            
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>&nbsp;</p>
    </div>
    <!--<p id="title">大题</p>-->
    <table cellspacing="0" style="FONT-SIZE: 14px; FONT-FAMILY: Tahoma; BORDER-COLLAPSE: collapse; " cellPadding="0" width=500 align="center" bgcolor="#eeeeee" border="1" bordercolor=gray>
        <tr>
			<td colSpan="2" align=center class="style1">						
				<IMG height="25" src="../../res/add.png">
                <b>大题</b>				
			</td>
		</tr>				
		<tr>
			<td align="center" width="60">科目：</td>
			<td>
                <asp:dropdownlist id="ddlCourse" runat="server" Font-Size="9pt" Width="200px">
                </asp:dropdownlist>
                章：
                <asp:dropdownlist id="zhang" runat="server" width="40px" Height="16px">
                </asp:dropdownlist>
            节：
                <asp:dropdownlist id="jie" runat="server" width="40px" Height="16px">
                </asp:dropdownlist>
            难度：
                <asp:dropdownlist id="nadu" runat="server" width="40px" Height="16px">
                </asp:dropdownlist>
            </td>
            
                
            
		</tr>				
		<tr>
			<td align="center" nowrap>描述：</td>
			<td>
				<asp:textbox id="txtFrontTitle"  runat="server" Width="500px" TextMode="MultiLine" Height="80px">
                </asp:textbox>
			</td>
		</tr>
		
						
		<tr align="center" height="55">
			<td colSpan="2"><asp:Label ID="lblMessage" runat="server" ForeColor=red></asp:Label><br />
				<asp:Button ID="保存" runat="server" Text="保存" onclick="save_Click" />
                &nbsp; &nbsp;   
                <asp:Button ID="清空" runat="server" Text="清空" onclick="clear_Click" />
                &nbsp;&nbsp; &nbsp; 
                <asp:FileUpload ID="FileUpload1" runat="server" Width="115px" />
                &nbsp;
                &nbsp; 
                <asp:Button ID="Img_btn" runat="server" Text="预览" Width="40px" OnClick="Img_btn_Click" />
                &nbsp;
			</td>
		</tr>
        <tr align="center" width="60">
            <td>图片:</td>
            <td>
                <div>
                <asp:Image ID="btmimg" runat="server" Visible="False" />
                </div>
            </td>
        </tr>
           
        
	</table>
 
</asp:Content>
