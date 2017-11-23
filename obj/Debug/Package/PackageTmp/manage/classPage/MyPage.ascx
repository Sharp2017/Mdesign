<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyPage.ascx.cs" Inherits="Mdesign.manage.classPage.MyPage" %>
<div align="right">
	<table width="100%"  >
		<TBODY>
			<tr>
				<td align="left">
					&nbsp;<asp:label id="Label1" runat="server">当前 x/n 页 共3条记录</asp:label>
					 
				</td>
				<td align="right">
					 
					<asp:linkbutton id="Hfirst" runat="server" onclick="Hfirst_Click">首页</asp:linkbutton>&nbsp;|
					<asp:linkbutton id="Hpre" runat="server" onclick="Hpre_Click">前一页</asp:linkbutton>&nbsp;| &nbsp;
					<asp:linkbutton id="Hnext" runat="server" onclick="Hnext_Click">下一页</asp:linkbutton>&nbsp;| &nbsp;
					<asp:linkbutton id="Hend" runat="server" onclick="Hend_Click">末页</asp:linkbutton>&nbsp;&nbsp; 
					<asp:dropdownlist id="DrpPageList" runat="server" AutoPostBack="True" 
                        Visible=False onselectedindexchanged="DrpPageList_SelectedIndexChanged" ></asp:dropdownlist>
					 
				</td>
			</tr>
		</TBODY>
	</table>
</div>
