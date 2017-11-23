<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulting.aspx.cs" Inherits="Mdesign.Consulting" %>

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
    <title>培训</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td>
                    <uc1:Top ID="Top1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="content" class="content">
                        <div id="text" class="text">
                            <div>
                                <div>
                                    <h1 style="font-size: x-large">
                                        咨询业务</h1>
                                </div>
                                <p>
                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 我们的咨询顾问来自国内外行业的精英，我们按照客户的需求量身制定方案满足不同客户的需求。我们的咨询涵盖传动系统，零件的尺寸和齿轮，轴承，轴和螺栓的详细分析的计算，新材料新工艺的应用。行业包括汽车，航空航天，风力发电，农业，建筑，家电，电动工具，核能，医疗器械，石油勘探，印刷，纺织等。我们的咨询服务包括：</p>
                                  <h1 style=" font-weight:bolder">
                                        紧固分析与验证</h1>
                                <ul>
                                    <li style="list-style-type: decimal;">产品服务和现场问题，有紧固件相关问题的解决。 </li>
                                    <li style="list-style-type: decimal;">紧固件故障分析（疲劳，拉伸断裂，剥丝，磨损，预紧力不足，抗蠕变，应力松弛，松动）。 </li>
                                    <li style="list-style-type: decimal;">紧固件的设计问题，包含疲劳是引起的原因等。 </li>
                                    <li style="list-style-type: decimal;">由于结构问题引起的紧固问题的结构优化 </li>
                                </ul>

                                  <h1 style=" font-weight:bolder">
                                        传动分析与验证</h1>
                                <ul>
                                    <li style="list-style-type: decimal;">齿轮设计如平行轴、行星齿轮、锥齿轮、端面齿轮、蜗轮和交叉轴螺旋，已有设计，应用全新的理念和材料。</li>
                                    <li style="list-style-type: decimal;">传动装置故障分析。</li>
                                    <li style="list-style-type: decimal;">优化现有的齿轮传动装置：降噪，提高效率，减小体积。</li>
                                    <li style="list-style-type: decimal;">由轴的计算及优化 。</li>
                                    <li style="list-style-type: decimal;">传动装置结构的优化分析 。</li>
                                </ul>
                                  <h1 style=" font-weight:bolder">
                                        案例：</h1>
                                <p>
                                  倾斜地球的风力发电机齿轮箱载荷</p>
                                  <img alt="" width="480px" height="360px" src="ProductsImg/Consulting1.png" />
                                   <p>
                                  接触线偏差在风力涡轮机的紧急停车
                                  </p>
                                  <img alt="" width="480px" height="360px" src="ProductsImg/Consulting2.png" />
                            </div>
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
