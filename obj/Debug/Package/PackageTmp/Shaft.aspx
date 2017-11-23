<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shaft.aspx.cs" Inherits="Mdesign.Shaft" %>

<%@ Register Src="UserControl/Top.ascx" TagName="Top" TagPrefix="uc1" %>
<%@ Register Src="UserControl/Bottom.ascx" TagName="Bottom" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-ico; charset=binary" />
    <link rel="icon" href="Images/favicon.ico" type="image/x-ico; charset=binary" />
    <meta name="language" content="english, en" />
    <meta name="keywords" content="mdesign, MDESIGN" />
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
    <title>Shaft</title>
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
                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                <tr>
                                    <td style="vertical-align: top;">
                                         <div id="Div2" class="text_left">
                                            <!--  CONTENT ELEMENT, uid:41/text [begin] -->
                                            <div id="c41" class="csc-default">
                                                <!--  Header: [begin] -->
                                                <div class="csc-header csc-header-n1">
                                                    <h1 class="csc-firstHeader" style="font-size: x-large">
                                                         Mdesign Shaft</h1>
                                                </div>
                                                
                                           
                                            </div>
                                              <p class="bodytext">
                                                   &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;对于一个设计人员来说，轴的尺寸确定和强度校核计算是最具挑战性的任务之一。因此，为满足实际需求，提供一个可靠计算程序和结构算法，科研工作者和国际标准委员会都作了很大努力。MDESIGN mechanical在其标准版本中就提供了一个工程模块，专门解决了轴的尺寸确定和校核计算。MDESIGN shaft作为一个后发模块已发展并积累了大量专业用户，并提供了大量的重要的运算功能。
                                                   </p>
                                            <p class="bodytext">
                                             &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;MDESIGN shaft 使用的现行的有效的DIN743标准。通过参数输入选项和图形助手，用户可自定义轴的几何形状和载荷。通过简单的鼠标点击，可以很方便的进行轴段设计和定义符合DIN743标准的槽口，并进行槽口形状设计。MDSIGN还允许用户自定义槽口，因此可以进行额外的静态系统的计算。任何因输入参数变化而导致的计算结果改变都可以直观的显示在结果文件中，不同的槽口形状可通过交互菜单显示出来。
                                               </p>
                                               
                                                <p class="bodytext">
                                               &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;轴载荷强度的校核是通过计算安全系数判定。分疲劳断裂的安全系数和塑性变形失效的安全系数。
                                                </p> 
                                                  <p class="bodytext">
                                               &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;DIN 743 标准下，当材料的抗拉强度大于1300N/mm^2时，需要校核硬处理表面的初始断裂安全的载荷强度。
                                                </p>
                                                  <p class="bodytext">
                                               &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;由于愈加载荷的作用，为防止疲劳断裂，一般假设压力常数范围等价于零件损毁荷载。当能确定最大载荷发生的事件，考虑到预加最大载荷的作用，塑性变形和应力裂纹的校核是保证材料的屈服极限。硬处理表面防止初始裂纹的强度计算像计算疲劳断裂一样，需要对每一个应力集中点进行计算，但这里只对应力最大值计算。
                                                </p>
                                                 <p class="bodytext">
                                               &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;当涉及到单个具体位置的槽口产生的影响时，要进行特别的安全性计算。这里，可以根据不同的几何形状，主要提供了九种不同的槽口计算。
                                                </p>
                                                  <h1 class="csc-firstHeader" >
                                                         MDESIGN shaft的计算功能扩展：</h1>
                                            <ul >
                                                <li style="float: left;width: 50%; ">考虑到空心轴和锥形轴段</li>
                                                <li  style="float: left;width: 50%;">计算无数量限制的轴承和轴段</li>
                                                <li  style="float: left;width: 50%;">非标准和公司自有数据的使用</li>
                                                <li  style="float: left;width: 50%;">自定义转速</li>
                                                <li  style="float: left;width: 50%;">自定义转速</li>
                                                <li  style="float: left;width: 50%;">全面的图形演示结果</li>
                                            </ul>
                                             <p>&nbsp;</p>
                                            <img alt="" width="480px" height="353px" src="ProductsImg/Shaft1.png" />
                                             <p>&nbsp;</p>
                                             <img alt="" width="480px" height="358px" src="ProductsImg/Shaft2.png" />
                                              <p>&nbsp;</p>
                                             <img alt="" width="480px" height="355px" src="ProductsImg/Shaft3.png" />
                                              <p>&nbsp;</p>
                                             <img alt="" width="480px" height="354px" src="ProductsImg/Shaft4.png" />
                                              <p>&nbsp;</p>
                                             <img alt="" width="480px" height="296px" src="ProductsImg/Shaft5.png" />
                                            <!--  Bullet list: [end] -->
                                            <!--  CONTENT ELEMENT, uid:42/bullets [end] -->
                                        </div>
                                    </td>
                                    <td style="vertical-align: top;">
                                        <div id="text_right">
                                            <!--  CONTENT ELEMENT, uid:37/html [begin] -->
                                            <div id="c37" class="csc-default">
                                                <!--  Raw HTML content: [begin] -->
                                                <div id="table_professional" class="table_professional table_professional_products">
                                                    MDESIGN 专业知识平台<br />
                                                    <br class="table_umbruch" />
                                                    <table cellspacing="5" cellpadding="0" bgcolor="#FFFFFF" align="center">
                                                        <tr>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a href="Mechanical.aspx" title="MDESIGN Mechanical"><font style="font-size: 10pt;">
                                                                    <b>MDESIGN
                                                                        <br />
                                                                        Mechanical</b></font>
                                                                    <br />
                                                                    机械设计库 </a>
                                                            </td>
                                                            <td class="cell_mechanical_aktiv" style="background-color: #365f93; color: White;">
                                                                <font style="font-size: 10pt;"><b>M</b>DESIGN <b>
                                                                    <br />
                                                                    Shaft</b></font>
                                                                <br>
                                                                基于DIN743标准
                                                                <br />
                                                                的计算
                                                            </td>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a href="Bolt.aspx" title="MDESIGN Bolt"><font style="font-size: 10pt;"><b>M</b>DESIGN
                                                                    <b>
                                                                        <br />
                                                                        Bolt</b></font>
                                                                    <br>
                                                                    基于VDI2230标准
                                                                    <br />
                                                                    的计算 </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a href="MultiBolt.aspx" title="MDESIGN MultiBolt"><font style="font-size: 10pt;"><b>
                                                                    M</b>DESIGN <b>
                                                                        <br />
                                                                        MultiBolt</b></font>
                                                                    <br>
                                                                    基于VDI2230 Blatt2
                                                                    <br />
                                                                    多螺栓的计算 </a>
                                                            </td>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a href="Explorer.aspx" title="MDESIGN Explorer"><font style="font-size: 10pt;"><b>M</b>DESIGN
                                                                    <b>
                                                                        <br />
                                                                        Explorer</b></font>
                                                                    <br>
                                                                    专业知识用户界面
                                                                    <br />
                                                                    公式和数据库接口 </a>
                                                            </td>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a href="Author.aspx" title="MDESIGN Author"><font style="font-size: 10pt;"><b>M</b>DESIGN
                                                                    <b>
                                                                        <br />
                                                                        Author</b></font>
                                                                    <br>
                                                                    知识的标准化
                                                                    <br />
                                                                    管理 </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a title="MDESIGN Espresso"><font style="font-size: 10pt;"><b>M</b>DESIGN <b>
                                                                    <br />
                                                                    Espresso</b></font>
                                                                    <br>
                                                                    基于AD/EN标准的
                                                                    <br />
                                                                    压力容器计算 </a>
                                                            </td>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a href="LVR.aspx" title="MDESIGN LVR/LVR planet"><font style="font-size: 10pt;"><b>
                                                                    M</b>DESIGN <b>
                                                                        <br />
                                                                        LVR/LVR planet</b></font>
                                                                    <br>
                                                                    齿轮修形和载荷
                                                                    <br />
                                                                    分布计算 </a>
                                                            </td>
                                                            <td class="cell_explorer_inaktiv">
                                                                <a href="GearBox.aspx" title="MDESIGN GearBox"><font style="font-size: 10pt;"><b>M</b>DESIGN
                                                                    <b>
                                                                        <br />
                                                                        GearBox</b></font>
                                                                    <br>
                                                                    齿轮修形和载荷
                                                                    <br />
                                                                    分布计算 </a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <!--  Raw HTML content: [end] -->
                                            </div>
                                            <!--  CONTENT ELEMENT, uid:37/html [end] -->
                                            <!--  CONTENT ELEMENT, uid:31/html [begin] -->
                                            <div id="c31" class="csc-default">
                                                <!--  Raw HTML content: [begin] -->
                                                <br />
                                                <br />
                                                <table class="product_links">
                                                    <tr>
                                                        <td class="cell_flyer_img">
                                                            <img src="Images/arrow-1.gif" title="arrow" alt="arrow" />
                                                            <img src="Images/pdf.gif" title="pdf" alt="pdf" />
                                                        </td>
                                                        <td class="cell_flyer_text">
                                                            <a href="Files/MDESIGN_shaft.pdf" title="Product flyer MDESIGN shaft">Product flyer
                                                                MDESIGN shaft </a>
                                                        </td>
                                                    </tr>
 
                                                    <tr>
                                                        <td class="cell_trial_img">
                                                            <img src="Images/arrow-1.gif" title="arrow" alt="arrow" />
                                                            <img src="Images/download.gif" title="pdf" alt="pdf" />
                                                        </td>
                                                        <td class="cell_trial_text">
                                                            Apply for trial
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="cell_contact_img">
                                                            <img src="Images/arrow-1.gif" title="arrow" alt="arrow" />
                                                            <img src="Images/at.gif" title="pdf" alt="pdf" />
                                                        </td>
                                                        <td class="cell_contact_text">
                                                            <a href="mailto:yzren@bylead.net" title="Contact us for purchase or trial version">Contact
                                                                us for purchase or trial version </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                                <!--  Raw HTML content: [end] -->
                                            </div>
                                            <!--  CONTENT ELEMENT, uid:31/html [end] -->
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <!--###DOCUMENT_PRODUCTS### end-->
                        </div>
                    </div>
                </td>
            </tr>
            <!-- CenterEnd -->
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
