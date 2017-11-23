<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_frind.aspx.cs" Inherits="Mdesign.manage.b_frind" %>

<%@ Register src="classPage/MyPage.ascx" tagname="MyPage" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>友情链接
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
</head>
<body class="main">
    <form id="form2" runat="server">
    <script>        writeTitle('友情链接', 'role.gif');</script>
			<br>
		 
					
    <div id="mainDiv" style="background-color:#fffff0   ">
     
     
     <div  style="padding-left:10px;padding-top:10px;">
     <table>
      <tR>
            <td>链接类型：
            </td>
            <td> 
                <asp:DropDownList ID="DropDownList1" runat="server" style="width:500px;height:28px;">
                    <asp:ListItem>相关部门</asp:ListItem>
                    <asp:ListItem>相关企业</asp:ListItem>
                    <asp:ListItem>相关行业</asp:ListItem>
                    <asp:ListItem>其他连接</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tR>
        <tR>
            <td>链接名称：
            </td>
            <td><asp:TextBox ID="txt_title" runat="server" style="width:500px;"></asp:TextBox>    
            </td>
        </tR>
         <tR>
            <td>链接地址：
            </td>
            <td><asp:TextBox ID="txt_url" runat="server" style="width:500px;"></asp:TextBox>    
            </td>
        </tR>
       
        
         
        
        
     </table>
       
    </div>
     
     <div  style="padding-top:20px;padding-bottom:15px;padding-left:30px">
       
        <asp:Button ID="but_save" runat="server" Text="保存" CssClass="button" 
             style="width:72px;height:20px" onclick="but_save_Click" />
 
    </div>
    
    <br>
			<TABLE class="tmain" style="width:800px;">
				<TBODY>
					<TR>
						<TD class="listTd"  >
                         <asp:datagrid id="DGList" runat="server" Width="100%"  PageSize=12
                                AllowPaging="True" AutoGenerateColumns="False"
								CellPadding="3" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" AllowSorting="True" BackColor="White"
								DataKeyField="id" onitemdatabound="DGList_ItemDataBound" ondeletecommand="DGList_DeleteCommand">
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
									<asp:HyperLinkColumn Target="_self" DataNavigateUrlField="id" DataNavigateUrlFormatString="####"
										DataTextField="ptitle" HeaderText="友情链接名称" >
									 <ItemStyle HorizontalAlign="Left" Width="130px"></ItemStyle>		
									</asp:HyperLinkColumn>
									<asp:BoundColumn HeaderText="类型" DataField="ptype">
										<ItemStyle HorizontalAlign="Left" Width="100px"></ItemStyle>
									</asp:BoundColumn>
									<asp:TemplateColumn  HeaderText ="友情链接地址">
									    <ItemTemplate>
									    <a href='<%# DataBinder.Eval(Container, "DataItem.purl")%>' target=_blank > <%# DataBinder.Eval(Container, "DataItem.purl")%></a>
									    </ItemTemplate>
									</asp:TemplateColumn> 
									  <asp:ButtonColumn Text="&lt;font color=red face=&quot;Wingdings&quot;&gt;x&lt;/font&gt;" HeaderText="删除"
										CommandName="Delete">
										<ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
									</asp:ButtonColumn>
									 
								</Columns>
								<PagerStyle Visible="False" NextPageText="&amp;gt;&amp;gt;&amp;gt;" PrevPageText="&amp;lt;&amp;lt;&amp;lt;"
									HorizontalAlign="Right" ForeColor="#9966FF" BackColor="White" Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
                          <uc1:MyPage ID="MyPage1" runat="server" />
                        </TD>
					 
				</TBODY>
			</TABLE>
      
    <br />
     <br />
      
    </form>
</body>
</html>
