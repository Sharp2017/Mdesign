<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_bottom.aspx.cs" Inherits="Mdesign.manage.b_bottom" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 

 
 
  <HTML>
	<HEAD>
		<title>关于平台</title>
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
			<script>			    writeTitle('首页关于平台', 'role.gif');</script>
			 
			<br>
			<TABLE class="tmain" width=100%>
				<TBODY>
				<tr>
						<TD class="listTd" vAlign="top" colSpan="2">
							 <textarea id="content2" name="content" style="width:100%;height:450px;visibility:hidden;" runat=server ></textarea>
						</TD>
					</tr>
					<tr>
						<td bgcolor="ghostwhite" align="right" height="35">
							<asp:Button id="Button1" runat="server" Text="保存" Width="80" Height=30 
                                onclick="Button1_Click"></asp:Button>
						</td>
					</tr>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>

