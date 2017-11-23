<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Mdesign.Contact" %>

<%@ Register Src="UserControl/Top.ascx" TagName="Top" TagPrefix="uc1" %>
<%@ Register Src="UserControl/Bottom.ascx" TagName="Bottom" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-ico; charset=binary" />
    <link rel="icon" href="Images/favicon.ico" type="image/x-ico; charset=binary" />
    <meta name="language" content="english, en" />
    <meta name="keywords" content="mdesign.info, MDESIGN" />
    <meta name="description" content="MDESIGN assists you with the design, calculation and optimization process in mechanical engineering." />
    <meta name="robots" content="all" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet_8c139cc955.css-1347961868.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css-1367228012.css" />
    <link rel="stylesheet" type="text/css" href="css/header_menu.css-1351245122.css" />
    <link rel="stylesheet" type="text/css" href="css/footer_menu.css-1346680187.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css-1343803991.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css-1348034958.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css-1366809302.css" />
    <link rel="stylesheet" type="text/css" href="css/table.css-1366961770.css" />
    <link rel="stylesheet" type="text/css" href="css/inhalt_allgemein.css-1348562722.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css-1366815135.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css-1373376323.css" />
    <link rel="stylesheet" type="text/css" href="css/content_intern.css-1367822522.css" />
    <script src="Js/javascript.js-1347883302.js" type="text/javascript"></script>
    <script src="Js/javascript_a708894199.js-1341990729.js" type="text/javascript"></script>
    <title>联系我们</title>
  
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
                <td>  <div id="content" class="content">
                        <div id="text" class="text">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                	<tr>
                		<td colspan="2">
                           <div>
                                    <h1 style="font-size: xx-large; vertical-align: middle; text-align: center">
                                        联系我们</h1>
                                         
                                </div>
                        </td>
                        
                	</tr>
                    	<tr>
                		<td  width="100px" valign="top">
                        <table border="0" cellspacing="0" cellpadding="0">
                        	<tr>
                        		<td><img src="Images/homepage.gif" width="91" height="100" border="0" alt="" /></td>
                               
                        	</tr>
                            <tr>
                        		 
                                <td><img src="Images/email.gif" width="91" height="100" border="0" alt="eMail" title="eMail"
                                            longdesc="eMail" /></td>
                              
                        	</tr>
                            <tr>
                        	 
                                <td><img src="Images/hotline.gif" width="91" height="100" border="0" alt="" /></td>
                        	</tr>
                        </table>
                        </td>
                        <td width="850px"  >
                       <div  style="text-align:center;">
                        <img style="text-align:center;" alt="" width="600px"  src="ProductsImg/ChinaMap.jpg" />
                       </div>
                        <h1 style="font-size:x-large; vertical-align:middle; text-align:left">
                                        北中国</h1>
                          <p>电话：010-6886-7956</p>
                          <p>邮箱：yzren@bylead.net</p>
                          <h1 style="font-size:x-large; vertical-align: middle; text-align: left">
                                        南中国</h1>
                          <p>电话：021-5065-2291</p>
                          <p>邮箱：x@infomass.cn</p>
                          <br />
                          <br />
                          <br />
                          <br />
                          <br />
                          <br />
                          <br />
                          <br />
                          <br />
                        </td>
                	</tr>
                </table>
                   </div>
                    </div>
                </td>
            </tr>

             <tr>
                <td>
                     <uc2:Bottom ID="Bottom2" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
