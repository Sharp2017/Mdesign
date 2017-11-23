<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_newsList.aspx.cs" Inherits="Mdesign.manage.b_newsList" %>


<%@ Register src="classPage/MyPage.ascx" tagname="MyPage" tagprefix="uc2" %>

  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>网站栏目维护
    </title>
    <LINK href="images/base.css" rel="stylesheet">
    <SCRIPT LANGUAGE="JavaScript" src="js/manage_contentTitle.js"></SCRIPT>
    <script>
        function conf() {
            if (document.all.txt_time.value == "") {
                alert("发生时间不能为空！");
                document.all.txt_time.focus();
                return false;
            }
            return true;
        }

        function fz(sp) {

            var nowvar = document.all.txt_deal.value;
            if (nowvar != '') {
                document.all.txt_deal.value = document.all.txt_deal.value + ',' + sp;
            }
            else {
                document.all.txt_deal.value = sp;
            }
        }
			</script>
    <style type="text/css">
        .style1
        {
            width: 489px;
        }
    </style>
</head>
<body class="main">
    <form id="form2" runat="server">
    <script>        writeTitle(' <asp:Label runat=server ID=lb_title></asp:Label> 列表', 'role.gif');</script>
   
			<br>
		 
					
    <div id="mainDiv" style="background-color:#fffff0   ">
     
    
			<TABLE class="tmain" style="width:880px;">
				<TBODY>
					<TR>
						<TD class="listTd"  >
                         <asp:datagrid id="DGList" runat="server" Width="100%" 
                                AllowPaging="True" AutoGenerateColumns="False"
								CellPadding="3" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" AllowSorting="True" BackColor="White"
								DataKeyField="id" onitemdatabound="DGList_ItemDataBound" ondeletecommand="DGList_DeleteCommand" PageSize=15>
								<SelectedItemStyle Font-Bold="True" BackColor="#FFFF99"></SelectedItemStyle>
								<AlternatingItemStyle HorizontalAlign="Left" BackColor="AntiqueWhite"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Left" ForeColor="#9966FF"></ItemStyle>
								<HeaderStyle HorizontalAlign="Left" ForeColor="white" Font-Bold =true    BackColor="#1A4684" Height="25"></HeaderStyle>
								<FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
								<Columns>
									<asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
									<asp:BoundColumn HeaderText="序号">
										<ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
									</asp:BoundColumn>
									<asp:BoundColumn DataField="ptitle" HeaderText="标题"></asp:BoundColumn>
									<asp:BoundColumn  DataField="puser" HeaderText="作者"><ItemStyle HorizontalAlign="Left" Width="130"></ItemStyle>		</asp:BoundColumn>
                                    
									 
									<asp:BoundColumn  DataField="pdate" HeaderText="日期"><ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>		</asp:BoundColumn>
								 
								 
									 <asp:BoundColumn  DataField="pclick" HeaderText="点击"><ItemStyle HorizontalAlign="Left" Width="30"></ItemStyle>		</asp:BoundColumn>

									<asp:BoundColumn  DataField="purl" HeaderText="附件"><ItemStyle HorizontalAlign="Left" Width="130"></ItemStyle>		</asp:BoundColumn>
									<asp:HyperLinkColumn Target=_self  DataNavigateUrlField="id" DataNavigateUrlFormatString="b_newsEdit.aspx?id={0}"
									  HeaderText="修改" Text='修改'>
									 <ItemStyle HorizontalAlign="Left" Width="50px" Font-Underline =true  ></ItemStyle>
									</asp:HyperLinkColumn>
									 
									  <asp:ButtonColumn Text="&lt;font color=red face=&quot;Wingdings&quot;&gt;x&lt;/font&gt;" HeaderText="删除"
										CommandName="Delete">
										<ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
									</asp:ButtonColumn>
									 
								</Columns>
								<PagerStyle Visible="False" NextPageText="&amp;gt;&amp;gt;&amp;gt;" PrevPageText="&amp;lt;&amp;lt;&amp;lt;"
									HorizontalAlign="Right" ForeColor="#9966FF" BackColor="White" Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
                        
                        </TD>
					</TR>
					<TR>
						<TD class="listTd"><FONT face="宋体"></FONT>
						
						
						    <uc2:MyPage ID="MyPage1" runat="server" />
						
						
						</TD>
					</TR>
					
					<TR>
						<TD > 
						  
 
						 <table border="0" cellspacing="0" cellpadding="0" width="100%">
						 	<tr>
						 		<td class="listTd" >概览页面每页显示条数：</td>
						 		<td class="style1">
                                    <asp:TextBox ID="txtSaveCountList" runat="server" Width="343px"></asp:TextBox>
                                </td>
						 		<td  style="text-align:right" Height="30px"  Width="120px" >
                                    <asp:Button ID="btnSaveCountList" runat="server" Height="30px" Text="保存" 
                                        Width="80px" onclick="btnSaveCountList_Click" />
                                </td>
						 	</tr>
						 </table>
						
						</TD>
					</TR>
					<TR>
						<TD  > 
						  
    <br />  
						 <table border="0" cellspacing="0" cellpadding="0" width="100%">
						 	<tr>
						 		<td class="listTd" >首页新闻模块显示条数：</td>
						 		<td class="style1">
                                    <asp:TextBox ID="txtSaveNewDCount" runat="server" Width="343px"></asp:TextBox>
                                </td>
						 		<td  style="text-align:right" Height="30px"  Width="120px" >
                                    <asp:Button ID="btnSaveNewDCount" runat="server" Height="30px" Text="保存" 
                                        Width="80px" onclick="btnSaveNewDCount_Click" />
                                </td>
						 	</tr>
						 </table>
						
						</TD>
					</TR>
					<TR>
						<TD > 
						  
    <br />  
						<div style="text-align:right ;padding-left:30px;">
    <input type=button   style="width:80px;height:30px"  value="添加" onclick="window.location.href='b_news.aspx?id=news'"/></div>
						
						</TD>
					</TR>
				</TBODY>
			</TABLE>
    <br />
     <br />
     
    <br /> <br />
    </div>
    </form>
</body>
</html>

