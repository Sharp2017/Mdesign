<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_news.aspx.cs" Inherits="Mdesign.manage.b_news" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <HTML>
	<HEAD>
		<title>平台动态管理</title>
		<link rel="stylesheet" type="text/css" href="../jquery/css/easyui.css">
	<script type="text/javascript" src="../jquery/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="../jquery/jquery.easyui.min.js"></script>
		<LINK href="images/base.css" rel="stylesheet">
			<SCRIPT LANGUAGE="JavaScript" src="js/manage_contentTitle.js"></SCRIPT>
	</HEAD>
	<body class="main">
	
<script charset="utf-8" src="../kindEditor/kindeditor.js"></script>
<script>
    KE.show({
        id: 'content2',
        resizeMode: 1,
        allowPreviewEmoticons: false,
        allowUpload: true,
        imageUploadJson: '../../upload_json.ashx',
        fileManagerJson: '../../file_manager_json.ashx',
        allowFileManager: true,
        items: [
		'source', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
		'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
		'insertunorderedlist', '|', 'emoticons', 'image', 'link']
    });
</script>

		<form id="Form1" method="post" runat="server">
			<script>			    writeTitle(' <asp:Label runat=server ID=lb_title></asp:Label> 添加', 'role.gif');</script>
			<br>  
			<TABLE cellpadding="5" cellspacing="0" width=95% align=center >
				<TBODY>
					<TR>
						<TD vAlign="top" class="listTd" colSpan="2" height="23">
							标题：
							<asp:TextBox id="txt_title" runat="server" Width="552px"></asp:TextBox>
							<br>
							
						</TD>
					</TR>
					<TR>
						<TD vAlign="top" class="listTd" colSpan="2" height="23">
							 作者：
							  <asp:TextBox id="txt_author" runat="server" Width="552px"></asp:TextBox>
						</TD>
					</TR>
                     <tr>
                <td valign="top" class="listTd" colspan="2" height="23">
                    上传文件：
                 <input id="File1" type="file" name="filePic1" runat="server" style="width:553px;"><br>
                </td>
            </tr>
					 <TR>
						<TD vAlign="top" class="listTd" colSpan="2" height="23">
							 时间：
							<input id="txt_DateTime" runat="server" class="easyui-datetimebox" name="birthday" required="true" value="3/4/2010 2:3:56" style="width:150px; height:23px">
						</TD>
					</TR>
					<tr>
						<TD class="listTd" vAlign="top" colSpan="2">
							<textarea id="content2" name="content" style="width:800px;height:300px;visibility:hidden;" runat="server" ></textarea>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
			<br>
			<TABLE class="tmain" width=100%>
				<TBODY>
					<tr>
						<td bgcolor="ghostwhite" align="right" height="35">
							<input type=button   style="width:82px; height:30px"  value="返回" 
                                onclick="window.location.href='b_newslist.aspx?id=news'"/>
							<asp:Button id="Button1" runat="server" Text="保存" Width="80" Height="30"
                                onclick="Button1_Click"></asp:Button>
						</td>
					</tr>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
