<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="t_user.aspx.cs" Inherits="Mdesign.manage.t_user" %>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>user</title>
		<LINK href="images/base.css" rel="stylesheet">
			<SCRIPT LANGUAGE="JavaScript" src="js/manage_contentTitle.js"></SCRIPT>
			<script>
			    function conf() {
			        if (document.all.txt_user.value == "") {
			            alert("用户名不能为空！");
			            document.all.txt_user.focus();
			            return false;
			        }
			        if (document.all.txt_pass.value == "") {
			            alert("密码不能为空！");
			            document.all.txt_pass.focus();
			            return false;
			        }
			    }
			</script>
	</HEAD>
	<body class="main">
		<form id="Form1" method="post" runat="server">
			<script>			    writeTitle('系统管理员管理', 'role.gif');</script>
			<br>
			<TABLE class="tmain">
				<TBODY>
					<TR>
						<TD vAlign="top" class="listTd" colSpan="2"><FONT face="宋体">&nbsp;用户：
								<asp:textbox id="txt_user" runat="server"></asp:textbox>&nbsp;密码：
								<asp:textbox id="txt_pass" runat="server" TextMode="Password"></asp:textbox><asp:button id="but_save" runat="server" Width="64px" Text="保存"></asp:button></FONT></TD>
					</TR>
				</TBODY>
			</TABLE>
			<br>
			<TABLE class="tmain">
				<TBODY>
					<TR>
						<TD class="listTd"><asp:datagrid id="DGList" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
								CellPadding="3" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" AllowSorting="True" BackColor="White">
								<SelectedItemStyle Font-Bold="True" BackColor="#FFFF99"></SelectedItemStyle>
								<AlternatingItemStyle HorizontalAlign="Left" BackColor="AntiqueWhite"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Left" ForeColor="#9966FF"></ItemStyle>
								<HeaderStyle HorizontalAlign="Left" ForeColor="DarkBlue" BackColor="Gold"></HeaderStyle>
								<FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
								<Columns>
									<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
									<asp:BoundColumn HeaderText="序号">
										<ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="uname" HeaderText="姓名">
										<ItemStyle HorizontalAlign="Left"></ItemStyle>
									</asp:BoundColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="修改" CancelText="取消" EditText="&lt;font color=red face=&quot;Wingdings&quot;&gt;1&lt;/font&gt;">
										<ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
									</asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;font color=red face=&quot;Wingdings&quot;&gt;x&lt;/font&gt;" HeaderText="删除"
										CommandName="Delete">
										<ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
									</asp:ButtonColumn>
								</Columns>
								<PagerStyle Visible="False" NextPageText="&amp;gt;&amp;gt;&amp;gt;" PrevPageText="&amp;lt;&amp;lt;&amp;lt;"
									HorizontalAlign="Right" ForeColor="#9966FF" BackColor="White" Mode="NumericPages"></PagerStyle>
							</asp:datagrid> </TD>
					</TR>
					<TR>
						<TD class="listTd"><FONT face="宋体"></FONT></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>