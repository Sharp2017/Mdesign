<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LegalNotice.aspx.cs" Inherits="Mdesign.LegalNotice" %>

<%@ Register src="UserControl/Top.ascx" tagname="Top" tagprefix="uc1" %>

<%@ Register src="UserControl/Bottom.ascx" tagname="Bottom" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

 
<link rel="shortcut icon" href="Images/favicon.ico" type="image/x-ico; charset=binary"/>
<link rel="icon" href="Images/favicon.ico" type="image/x-ico; charset=binary"/>

 
<meta name="language" content="english, en"/>
<meta name="keywords" content="mdesign, MDESIGN"/>
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


<title>公式</title>
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
      <div id="text" class="text">
         
	<!--  CONTENT ELEMENT, uid:8/text [begin] -->
		<div id="c8" class="csc-default" >
		<!--  Header: [begin] -->
			<div class="csc-header csc-header-n1"><h1 class="csc-firstHeader">Legal notice</h1></div>
		<!--  Header: [end] -->
			
		<!--  Text: [begin] -->
		<!--  Text: [end] -->
			</div>
	<!--  CONTENT ELEMENT, uid:8/text [end] -->
		
      </div>
      <!-- CONTENT -- ende -->
      <!-- FOOTER -- anfang -->
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
