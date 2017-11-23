<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_items.aspx.cs" Inherits="Mdesign.manage.b_items" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>网站栏目维护
    </title>
    <LINK href="images/base.css" rel="stylesheet">
    <SCRIPT LANGUAGE="JavaScript" src="js/manage_contentTitle.js"></SCRIPT>
    <script>
        function conf() {
            if (document.all.txt_title.value == "") {
                alert("标题不能为空！");
                document.all.txt_title.focus();
                return false;
            }
            if (document.all.txt_url.value == "") {
                alert("URL不能为空！");
                document.all.txt_url.focus();
                return false;
            }
            if (document.all.txt_sort.value == "") {
                alert("排序不能为空！");
                document.all.txt_sort.focus();
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
    <script>        writeTitle('栏目维护', 'role.gif');</script>
			<br>
    <div id="mainDiv" style="background-color:#fffff0   ">
     <div  style="padding-left:10px;padding-top:10px;">
     <table>
        <tR>
            <td>栏目名称：
            </td>
            <td><asp:TextBox ID="txt_title" runat="server" style="width:500px;"></asp:TextBox>    
            </td>
        </tR>
         <tR>
            <td>栏目URL：
            </td>
            <td><asp:TextBox ID="txt_url" runat="server" style="width:500px;"></asp:TextBox>    
            </td>
        </tR>
        <tR>
            <td>栏目排序：
            </td>
            <td><asp:TextBox ID="txt_sort" runat="server" style="width:100px;"></asp:TextBox>    
            </td>
        </tR>
         <%--<tR>
            <td>栏目PIC：
            </td>
            <td>
            <asp:FileUpload runat="server"  ID="fileUp"/>
            </td>
        </tR>--%>
         <tR>
            <td>是否显示：
            </td>
            <td>
                <asp:DropDownList ID="drp_isUse" runat="server"  >
                
                 <asp:ListItem Text="是" Value="是"></asp:ListItem>
                <asp:ListItem Text="否" Value="否"></asp:ListItem>
               
                </asp:DropDownList>
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
                         <asp:datagrid id="DGList" runat="server" Width="100%" 
                                AllowPaging="True" AutoGenerateColumns="False"
								CellPadding="3" BorderWidth="1px" BorderStyle="Solid" BorderColor="Black" AllowSorting="True" BackColor="White"
								DataKeyField="id" onitemdatabound="DGList_ItemDataBound" ondeletecommand="DGList_DeleteCommand" 
                                oneditcommand="DGList_EditCommand" onupdatecommand="DGList_UpdateCommand">
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
										DataTextField="ptitle" HeaderText="项目名称" >
									 <ItemStyle HorizontalAlign="Left" Width="150px"></ItemStyle>	
									</asp:HyperLinkColumn>
									<asp:HyperLinkColumn Target="_self" DataNavigateUrlField="id" DataNavigateUrlFormatString="####"
										DataTextField="purl" HeaderText="URL">
										
									</asp:HyperLinkColumn>
									<asp:HyperLinkColumn   Target="_self" DataNavigateUrlField="id" DataNavigateUrlFormatString="####"
										DataTextField="picurl" HeaderText="PIC" Visible="False">
										
									</asp:HyperLinkColumn>
									<asp:BoundColumn DataField="pstate"  HeaderText="是否显示">
									<ItemStyle HorizontalAlign="Left" Width="70px"></ItemStyle>	
									</asp:BoundColumn>
									 <asp:BoundColumn HeaderText="排序" DataField="psort">
										<ItemStyle HorizontalAlign="Left" Width="30px"></ItemStyle>
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
							</asp:datagrid>
                        
                        </TD>
					</TR>
					<TR>
						<TD class="listTd"><FONT face="宋体"></FONT>
						 
						
						</TD>
					</TR>
				</TBODY>
			</TABLE>
    <br />
     <br />
     <div style="text-align:left ;padding-left:30px;">
    <%--<input type=button   style="width:120px;height:30px"  value="返回" onclick="window.location.href='userlist.aspx'"/>--%></div>
    <br /> <br />
    </div>
    </form>
</body>
</html>
