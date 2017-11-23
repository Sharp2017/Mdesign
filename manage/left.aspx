<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="left.aspx.cs" Inherits="Mdesign.manage.left" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>left</title>
		<style type="text/css">.bbb { FONT-WEIGHT: normal }
	</style>
		<link href="images/base.css" rel="stylesheet"/>
			<script  language="javascript" type="text/javascript"src="javascript/CLASS_MSN_MESSAGE.js"></script>
			<script src="javascript/common.js" type="text/javascript"></script>
			<script type="text/javascript" language="javascript" src="js/manage_left.js"></script>
	</head>
  <script type="text/javascript">
      function leftTitle(title, divName) {
          document.write('<TR>');
          document.write('<TD style="CURSOR: hand" background="images/btbg.gif" height="22">');
          document.write('<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">');
          document.write('<TR>');
          document.write('<TD width="21%">&nbsp;</TD>');
          document.write('<TD width="79%"><SPAN class="fontt"><A class="fontt" onclick="javascript:hit(' + divName + ');"><FONT color="#ffffff">' + title + '</FONT></A></SPAN></TD>');
          document.write('</TR>');
          document.write('</TABLE>');
          document.write('</TD>');
          document.write('</TR>');
          document.write('<TR>');
          document.write('<TD vAlign="top" align="center">');
          document.write('<DIV id="' + divName + '" style="DISPLAY: yes" >');
          document.write('<TABLE cellSpacing="0" cellPadding="0" width="140" border="0">');

      }

      function leftItem(url, title, target) {
          document.write('<!----->');
          document.write('<TR>');

          document.write('<TD align=center width=24>');

          document.write('<IMG height=9 src="images/dot.gif" width=9>');

          document.write('</TD>');

          document.write('<TD width=123 height=20>');

          document.write('<SPAN class=fontt>');

          document.write('<A class=fontt onclick=javascript:allbd();bd(this); href="' + url + '" target=' + target + ' name=l1_1>' + title + '</A>');

          document.write('</SPAN>');

          document.write('</TD>');

          document.write('</TR>');

          document.write('<TR>');

          document.write('<TD colSpan=2>');

          document.write('<IMG height=1 src="images/line.gif" width=133>');

          document.write('</TD>');

          document.write('</TR>');

          document.write('');

          document.write('<!------>');
      }

      function leftBottom() {
          document.write('</TABLE>');

          document.write('</DIV>');

          document.write('<BR>');

          document.write('</TD>');

          document.write('</TR>');


      }

      function allbd() {
          return;
          l1_1.style.color = "#000000";
          l1_3.style.color = "#000000";

          l1_2.style.color = "#000000";

          l2_1.style.color = "#000000";
          l2_2.style.color = "#000000";
          l2_3.style.color = "#000000";
          l2_4.style.color = "#000000";
          l2_5.style.color = "#000000";


          l3_1.style.color = "#000000";
          l3_2.style.color = "#000000";
          l3_3.style.color = "#000000";
          l3_4.style.color = "#000000";
          l3_5.style.color = "#000000";
          l3_6.style.color = "#000000";

          l4_2.style.color = "#000000";
          l4_8.style.color = "#000000";

          l4_3.style.color = "#000000";
          l4_4.style.color = "#000000";
          l4_5.style.color = "#000000";
          l4_6.style.color = "#000000";
          l4_7.style.color = "#000000";

          l4_9.style.color = "#000000";




          l5_1.style.color = "#000000";
          l5_2.style.color = "#000000";

      }

      function bd(id) {
          return;
          id.style.color = "#FF0000";
      }
  </script>
	<body text="#000000" style="background-color:#ffffff; margin-top:0px; margin-left:0px;"  background="images/background.gif" >
		
		     <form id="form1" runat="server">
    <div>
    
			<table height="100%" cellspacing="0" cellpadding="0" width="160" background="images/leftbg1.gif"
				border="0">
				<tbody>
					<tr>
						<td class="bg" vAlign="top" align="left" background="images/leftbg.jpg"><BR>
							<table cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tbody>
									 
									<!-------------2------------>
									  
									<!-------------2------------>
									<script>									    leftTitle("内容管理", "divS")</script>
									<%--<script>leftItem("b_news.aspx?id=news","新闻动态添加","mainFrame")</script>--%>
									<script>									    leftItem("b_newslist.aspx?id=news", "活动信息管理", "mainFrame")</script>
								<%--	 <script>									     leftItem("b_frameset.aspx", "电子地图管理", "mainFrame")</script>
								 --%>
									  
									<%--<script>									    leftItem("b_questionList.aspx?id=police", "常见问题管理", "mainFrame")</script>--%>
									<%--<script>leftItem("b_questionAdd.aspx", "常见问题添加", "mainFrame")</script>--%>
									
									<%--<script>leftItem("b_sampleAdd.aspx","共享成效添加","mainFrame")</script>--%>
								<%--	<script>									    leftItem("b_sampleList.aspx", "应用系统管理", "mainFrame")</script>--%>
									
									<%--<script>leftItem("b_sourceadd.aspx", "服务资源添加", "mainFrame")</script>--%>
								<%--	<script>									    leftItem("b_sourcelist.aspx", "服务资源管理", "mainFrame")</script>--%>
									<%--<script> leftItem("b_interface.aspx?id=police", "地图API管理", "mainFrame")</script>--%>
									<%--<script> leftItem("b_interface_add.aspx", "开发园地添加", "mainFrame")</script>--%>
								 	 <%--<script>leftItem("b_plat.aspx", "平台指南添加", "mainFrame")</script>--%>
									<%--<script>									    leftItem("b_platlist.aspx", "标准规范管理", "mainFrame")</script>--%>
									
									
									<script>									    leftBottom()</script>
									 
									 
									 <!------------ 
									<script>leftTitle("常量管理","divExit")</script>
									<script>leftItem("b_about2.aspx","首页平台简介","mainFrame")</script>
									<script>leftItem("b_aboutplat.aspx","平台简介","mainFrame")</script>
								    <script>leftItem("b_bottom.aspx","底部内容","mainFrame")</script>
								    <script>leftItem("b_zhitong.aspx","省市直通车","mainFrame")</script>
								    <script>leftItem("b_mainNewsPic.aspx","首页新闻图片","mainFrame")</script>
								    
								    <script>leftItem("b_topnews.aspx","首页顶部轮换广告","mainFrame")</script>
									
									<script>leftBottom()</script>

							        ------4------------>
									<script>									    leftTitle("系统管理", "divExit2")</script>
                                   
                                  <%--  <script>                                        leftItem("b_items.aspx", "栏目维护", "mainFrame")</script>--%>
									  <!----<script>leftItem("b_frind.aspx","友情链接","mainFrame")</script>
                                     -->
								 <%-- <script>								      leftItem("b_topnewsList.aspx?id=news", "首页顶部轮换广告", "mainFrame")</script>
								  <script>								      leftItem("b_IndexProgramaInfo.aspx", "首页栏目介绍", "mainFrame")</script>--%>
									 
									<script>									    leftItem("t_user.aspx", "用户管理", "mainFrame")</script> 
									 
									 
									<script>									    leftItem("a_exit.aspx", "退出系统", "_top")</script>
									<script>									    leftBottom()</script>
								</tbody>
							</table>
							<br>
						</tr>
					</tr>
				</tbody>
			</table>
		   </div>
    </form>
 
	</body>
	
</html>