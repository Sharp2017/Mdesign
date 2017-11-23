<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_platLIst.aspx.cs" Inherits="Mdesign.manage.b_platLIst" %>

<%@ Register Src="classPage/MyPage.ascx" TagName="MyPage" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>标准规范</title>
    <link href="images/base.css" rel="stylesheet">

    <script language="JavaScript" src="js/manage_contentTitle.js"></script>

     
</head>
<body class="main">
    <form id="form2" runat="server">

    <script>        writeTitle('标准规范', 'role.gif');</script>

    <br>
    <div id="mainDiv" style="background-color: #fffff0">
        <table class="tmain" style="width: 98%;">
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
                                <asp:BoundColumn HeaderText="序号">
                                    <ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="ptitle" HeaderText="名称"></asp:BoundColumn>
								 
									 	
                                <asp:HyperLinkColumn Target="_self" DataNavigateUrlField="id" DataNavigateUrlFormatString="b_plat.aspx?id={0}"
                                    HeaderText="修改" Text='修改'>
                                    <ItemStyle HorizontalAlign="Left" Width="50px" Font-Underline="true"></ItemStyle>
                                </asp:HyperLinkColumn>
                                <asp:ButtonColumn Text="&lt;font color=red face=&quot;Wingdings&quot;&gt;x&lt;/font&gt;"
                                    HeaderText="删除" CommandName="Delete">
                                    <ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
                                </asp:ButtonColumn>
                                <asp:HyperLinkColumn Target="_blank" DataNavigateUrlField="id" DataNavigateUrlFormatString="../sampleDetail.aspx?id={0}"
                                    DataTextField="ptitle" HeaderText="名称" Visible="False"></asp:HyperLinkColumn>
								 
									 	
                                <asp:BoundColumn DataField="purl" HeaderText="文件地址" Visible="False">
                                </asp:BoundColumn>
								 
									 	
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
                <tr>
						<td > 
						  
 
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
						
						</td>
					</tr>
                 <tr>
                    <td class="listTd">
                        <div style="text-align: right; padding-left: 30px;">
                        <br />
       
            <input type="button" style="width: 80px; height: 30px" value="添加" onclick="window.location.href='b_plat.aspx'" /></div>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <br />
       
            
        <br />
        <br />
    </div>
    </form>
</body>
</html>
