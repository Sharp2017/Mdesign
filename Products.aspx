<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Mdesign.Products" %>

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
               <!--###DOCUMENT_PRODUCTS### begin-->
        <div id="text_left" class="text_left">
           
	<!--  CONTENT ELEMENT, uid:21/text [begin] -->
		<div id="c21" class="csc-default" >
		<!--  Header: [begin] -->
			<div class="csc-header csc-header-n1"><h1 class="csc-firstHeader">MDESIGN Basic</h1></div>
		<!--  Header: [end] -->
			
		<!--  Text: [begin] -->
			<p class="bodytext"><b>M</b>DESIGN <b>formula</b><br />
            The MDESIGN formulary that is well known to the users of MDESIGN explorer contains a set of rules and formulas from various disciplines...
             <a href="Formula.aspx" [more]</a><br /><br />
            <b>M</b>DESIGN <b>concept</b><br />MDESIGN concept has been developed for the conceptual stage of design and quickly provides results for basic outlines,... 
            <a href="Concept.aspx"  title="MDESIGN concept">[more]</a><br />
            <br /><b>M</b>DESIGN <b>for MathCAD<br />
            </b>MDESIGN for Mathcad merges unique Mathcad functions with proven MDESIGN algorithms,... 
            <a href="Mathcad.aspx"  title="MDESIGN for MathCAD">[more]</a>
</p>
<p class="bodytext"><b>M</b>DESIGN <b>student<br /></b>
The MDESIGN student version enables all students to get started with MDESIGN.... 
<a href="Student.aspx"  title="MDESIGN student">[more]</a><br /><br /><br /><br /><br /><br /></p>
		<!--  Text: [end] -->
			</div>
	<!--  CONTENT ELEMENT, uid:21/text [end] -->
		
        </div>
        <div id="text_right" class="text_right">
           
	<!--  CONTENT ELEMENT, uid:48/text [begin] -->
		<div id="c48" class="csc-default" >
		<!--  Header: [begin] -->
			<div class="csc-header csc-header-n1"><h1 class="csc-firstHeader">MDESIGN Professional</h1></div>
		<!--  Header: [end] -->
			
		<!--  Text: [begin] -->
			<p class="bodytext"><b>M</b>DESIGN <b>mechanical</b><br />
            MDESIGN mechanical is the calculation library for mechanical engineering. Based on international rules and... 
            <a href="Mechanical.aspx"   title="MDESIGN mechanical">[more]</a><br /><br />
            <b>M</b>DESIGN <b>explorer</b><br />
            MDESIGN explorer is the platform for technical information and calculations. It efficiently supports engineers with their designing... 
            <a href="Explorer.aspx"  title="MDESIGN explorer">[more]</a><br /><br /><b>M</b>DESIGN <b>shaft</b><br />
            MDESIGN shaft is a professional shaft calculation program that bases on the German standard DIN 743. In order to ... 
            <a href="Shaft_bolt.aspx" title="MDESIGN shaft">[more]</a><br /><br />
            <b>M</b>DESIGN <b>bolt</b><br />
            MDESIGN has transferred the internationally recognized guideline VDI 2230 to an operational software package,... 
            <a href="Shaft_bolt.aspx"  title="MDESIGN bolt">[more]</a><br /><br /></p>
		<!--  Text: [end] -->
			</div>
	<!--  CONTENT ELEMENT, uid:48/text [end] -->
		
        </div>
      <!--###DOCUMENT_PRODUCTS### end-->
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