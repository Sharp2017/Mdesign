<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_3th.aspx.cs" Inherits="Mdesign.manage.t_3th" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <HTML>
	<HEAD>
		<title>接口管理</title>
		<LINK href="images/base.css" rel="stylesheet">
			<SCRIPT LANGUAGE="JavaScript" src="js/manage_contentTitle.js"></SCRIPT>
			<script>
			    function conf() {
			        if (document.all.txt_url.value == "") {
			            alert("链接地址不能为空！");
			            document.all.txt_url.focus();
			            return false;
			        }
			        return true;
			    }
			</script>
			
			
	</HEAD>
	<body class="main">
		<form id="Form1" method="post" runat="server">
			<script>			    writeTitle('链接地址维护', 'role.gif');</script>
			<br>  
			<TABLE cellpadding="5" cellspacing="0" width=95% align=center >
				<TBODY>
					 
					 	<TR>
						<TD vAlign="top" class="listTd" colSpan="2" height="23">
							 连接类别：
							 
						 
                             <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
							 
						</TD>
					</TR>
					<TR>
						<TD vAlign="top" class="listTd" colSpan="2" height="23">
							 链接地址：
							<asp:TextBox id="txt_url" runat="server" Width="552px"></asp:TextBox>
						</TD>
					</TR>
					 
					 
				</TBODY>
			</TABLE>
			<br>
			<TABLE class="tmain" width=100%>
				<TBODY>
					<tr>
						<td bgcolor="ghostwhite" align="right" height="35">
							<asp:Button id="Button1" runat="server" Text="保存" Width="80" Height=30 
                                onclick="Button1_Click"></asp:Button>
						</td>
					</tr>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
