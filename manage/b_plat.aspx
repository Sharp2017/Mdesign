<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_plat.aspx.cs" Inherits="Mdesign.manage.b_plat" %>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>标准规范</title>
    <link href="images/base.css" rel="stylesheet">

    <script language="JavaScript" src="js/manage_contentTitle.js"></script>

</head>
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

    <script>        writeTitle(' 标准规范', 'role.gif');</script>

    <br>
    <table cellpadding="5" cellspacing="0" width="95%" align="center">
        <tbody>
            <tr>
                <td valign="top" class="listTd" colspan="2" height="23">
                    题目：
                    <asp:TextBox ID="txt_title" runat="server" Width="552px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" class="listTd" colspan="2" height="23">
                    上传文件：
                 <input id="File1" type="file" name="filePic1" runat="server" style="width:553px;"><br>
                </td>
            </tr>
            <tr>
                <td class="listTd" valign="top" colspan="2">
                    <textarea id="content2" name="content" style="width: 800px; height:330px; visibility: hidden;"
                        runat="server"></textarea>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tmain" width="100%">
        <tbody>
            <tr>
                <td bgcolor="ghostwhite" align="right" height="35">
                  <input type="button" style="width: 80px; height: 30px" value="返回" onclick="window.location.href='b_platlist.aspx'" />
                    <asp:Button ID="Button1" runat="server" Text="保存" Width="80" Height="30" OnClick="Button1_Click">
                    </asp:Button>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
 
</body>
</html>
