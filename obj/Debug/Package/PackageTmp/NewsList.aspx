<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsList.aspx.cs" Inherits="Mdesign.NewsList" %>


<%@ Register src="UserControl/Top.ascx" tagname="Top" tagprefix="uc1" %>

<%@ Register src="UserControl/Bottom.ascx" tagname="Bottom" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 
 
<link rel="shortcut icon" href="Images/favicon.ico" type="image/x-ico; charset=binary"/>
<link rel="icon" href="Images/favicon.ico" type="image/x-ico; charset=binary"/>


<meta name="language" content="english, en"/>
<meta name="keywords" content="mdesign.info, MDESIGN"/>
<meta name="description" content="MDESIGN assists you with the design, calculation and optimization process in mechanical engineering."/>

<meta name="robots" content="all"/>

<link rel="stylesheet" type="text/css" href="css/stylesheet_8c139cc955.css-1347961868.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css-1367228012.css"  />
<link rel="stylesheet" type="text/css" href="css/header_menu.css-1351245122.css"  />
<link rel="stylesheet" type="text/css" href="css/footer_menu.css-1346680187.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css-1343803991.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css-1348034958.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css-1366809302.css"/>
<link rel="stylesheet" type="text/css" href="css/table.css-1366961770.css"  />
<link rel="stylesheet" type="text/css" href="css/inhalt_allgemein.css-1348562722.css"/>
<link rel="stylesheet" type="text/css" href="css/stylesheet.css-1366815135.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css-1373376323.css" />
<link rel="stylesheet" type="text/css" href="css/content_intern.css-1367822522.css" />



<script src="Js/javascript.js-1347883302.js" type="text/javascript"></script>
<script src="Js/javascript_a708894199.js-1341990729.js" type="text/javascript"></script>


<title>活动</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <!-- TopStart -->
    	<tr>
    		<td>
                <uc1:Top ID="Top1" runat="server" />
            </td>
    	</tr>
    <!-- TopEnd -->
    <!-- CenterStart -->
        <tr>
    		<td>
             <div id="content" class="content">
       <div class="newslist">
               
                <div class="newslist_box">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td style="font-size:15pt;font-weight:normal;color:#00325b; padding:5px 0px 10px 0px">活动</td></tr>
                <tr>
                		<td>
                		 <ul>
  <asp:Repeater ID="rpleft2" runat="server">
                    <ItemTemplate>
                    <div class="newslist_box_list"><li><a href="newsdetail.aspx?id=<%# DataBinder.Eval(Container, "DataItem.id") %>&SelfPageName=<%=SelfPageName %>" target="_blank"><%#Eval("ptitle")%>
                   <%--<span style="float:right"> [<%# DataBinder.Eval(Container, "DataItem.pdate")%>]</span>--%></a></li>
                    </div>
                    
               </ItemTemplate>
                </asp:Repeater></ul>
                		</td>
               </tr>
                	<tr>
                		<td style="text-align: right; padding-top:10px; padding-bottom:10px; padding-right:15px;">
                		<div style="float:right;">
            <div style="float:left">
            当前显示第 <asp:label id="lblCurrentPage" runat="server"></asp:label> 页</div>
            <div style=" height:25px; margin-top:2px; margin-left:10px;margin-right:10px;float:left">
                		<asp:hyperlink id="lnkFirst" runat="server"><img src="Images/shouye.png" alt="首页" title="首页" /></asp:hyperlink>
                		
                		<asp:hyperlink id="lnkPrev" runat="server"><img src="Images/prev.png" alt="上一页" title="上一页" /></asp:hyperlink>
   
     <asp:hyperlink id="lnkNext" runat="server"><img src="Images/next.png" alt="下一页" title="下一页" /></asp:hyperlink>
     
      
       <asp:hyperlink id="lnkLast" runat="server"><img src="Images/moye.png" alt="尾页" title="尾页" /></asp:hyperlink></div>
       <div style="float:left">
        共
       <asp:label id="lblTotalPage" runat="server"></asp:label>&nbsp;页</div>
       </div>
                		</td>
                	</tr>
                </table>
                </div>
                
        </div>
         <uc2:Bottom ID="Bottom2" runat="server" />
      <!-- FOOTER -- ende -->
    </div>
            </td>
    	</tr>
     <!-- CenterEnd -->
    </table>
    </div>
    </form>
</body>
</html>