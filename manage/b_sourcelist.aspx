﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_sourcelist.aspx.cs" Inherits="Mdesign.manage.b_sourcelist" %>


<%@ Register Src="classPage/MyPage.ascx" TagName="MyPage" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>服务资源</title>
    <link href="images/base.css" rel="stylesheet">

    <script language="JavaScript" src="js/manage_contentTitle.js"></script>

     
</head>
<body class="main">
    <form id="form2" runat="server">

    <script>        writeTitle('服务资源', 'role.gif');</script>

    <br>
    <div id="mainDiv" style="background-color: #fffff0">
        <table class="tmain" style="width: 98%">
            <tbody>
                <tr>
                    <td class="listTd">
                        <asp:DataGrid ID="DGList" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="3" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" AllowSorting="True"
                            BackColor="White" DataKeyField="id" OnItemDataBound="DGList_ItemDataBound" OnDeleteCommand="DGList_DeleteCommand"
                            PageSize="15">
                            <SelectedItemStyle Font-Bold="True" BackColor="#FFFF99"></SelectedItemStyle>
                            <AlternatingItemStyle HorizontalAlign="Left" BackColor="AntiqueWhite"></AlternatingItemStyle>
                            <ItemStyle HorizontalAlign="Left" ForeColor="#9966FF"></ItemStyle>
                            <HeaderStyle HorizontalAlign="Left" ForeColor="white" Font-Bold="true" BackColor="gray"
                                Height="25"></HeaderStyle>
                            <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
                            <Columns>
                                <asp:BoundColumn Visible="False" DataField="id"></asp:BoundColumn>
                                <asp:BoundColumn HeaderText="序号">                       <ItemStyle HorizontalAlign="Left" Width="50px"></ItemStyle>               </asp:BoundColumn>
                                 <asp:BoundColumn  DataField="ptitle" HeaderText="title"><ItemStyle HorizontalAlign="Left" Width="200px"></ItemStyle>		</asp:BoundColumn>
								 <asp:BoundColumn  DataField="unit" HeaderText="单位"><ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>		</asp:BoundColumn>
                                 <asp:BoundColumn  DataField="servicetype" HeaderText="服务类型"><ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>		</asp:BoundColumn>
                                 <asp:BoundColumn  DataField="remark" HeaderText="服务简介"><ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>		</asp:BoundColumn>
                                 <asp:BoundColumn  DataField="redu" HeaderText="热度"><ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>		</asp:BoundColumn>

								<asp:BoundColumn  DataField="setdate" HeaderText="日期"><ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>		</asp:BoundColumn>
									 	
                                <asp:HyperLinkColumn Target="_self" DataNavigateUrlField="id" DataNavigateUrlFormatString="b_sourceadd.aspx?id={0}"
                                    HeaderText="修改" Text='修改'>
                                    <ItemStyle HorizontalAlign="Left" Width="50px" Font-Underline="true"></ItemStyle>
                                </asp:HyperLinkColumn>
                                <asp:ButtonColumn Text="&lt;font color=red face=&quot;Wingdings&quot;&gt;x&lt;/font&gt;"
                                    HeaderText="删除" CommandName="Delete">
                                    <ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
                                </asp:ButtonColumn>
                            </Columns>
                            <PagerStyle Visible="False" NextPageText="&amp;gt;&amp;gt;&amp;gt;" PrevPageText="&amp;lt;&amp;lt;&amp;lt;"
                                HorizontalAlign="Right" ForeColor="#9966FF" BackColor="White" Mode="NumericPages">
                            </PagerStyle>
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td class="listTd">
                        <font face="宋体"></font>
                        <uc2:MyPage ID="MyPage1" runat="server" />
                    </td>
                </tr>
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
                <tr>
                    <td class="listTd">
                       <div style="text-align: right; padding-left: 30px;">
                        <br />
       
            <input type="button" style="width: 80px; height: 30px" value="添加" onclick="window.location.href='b_sourceadd.aspx'" /></div>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
       
        <br />
        <br />
    </div>
    </form>
</body>
</html>
