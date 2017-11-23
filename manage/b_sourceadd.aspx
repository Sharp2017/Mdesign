<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_sourceadd.aspx.cs" Inherits="Mdesign.manage.b_sourceadd" %>

 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>服务资源</title>
    <link href="images/base.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../jquery/css/easyui.css">
	    <script type="text/javascript" src="../jquery/jquery-1.7.2.min.js"></script>
	    <script type="text/javascript" src="../jquery/jquery.easyui.min.js"></script>
    <script language="JavaScript" src="js/manage_contentTitle.js"></script>

</head>
<body class="main">

    

    <form id="Form1" method="post" runat="server">

    <script>        writeTitle(' 服务资源', 'role.gif');</script>

    <br>
    <table cellpadding="5" cellspacing="0" width="95%" align="center" style="padding-left:10px;">
        <tbody>
            <tr>
                <td valign="top" class="listTd" colspan="2" height="23">
                    资源标题：
                    <asp:TextBox ID="txt_title" runat="server" Width="552px"></asp:TextBox>
                    <br>
                </td>
            </tr>
                        <tr>
                <td valign="top" class="listTd" colspan="2" height="23">
                 资源地址：
                    <asp:TextBox ID="txt_url" runat="server" Width="552px"></asp:TextBox>
                </td>
                </tr>
            <tr>
                <td valign="top" class="listTd" colspan="2" height="23">
                 发布单位：
                    <asp:TextBox ID="txt_unit" runat="server" Width="552px"></asp:TextBox>
                </td>
                </tr>
                <tr>
                  <td valign="top" class="listTd" colspan="2" height="23">
                 服务类型：
                    <asp:TextBox ID="txt_servicetype" runat="server" Width="552px"></asp:TextBox>
                </td></tr>
                <tr>
                  <td valign="top" class="listTd" colspan="2" height="23">
                 服务简介：
                    <asp:TextBox ID="txt_remark" runat="server" Width="552px"></asp:TextBox>
                </td></tr>
                  <tr>
						<td valign="top" class="listTd" colspan="2" height="23">
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 时间：
							<input id="txt_DateTime" runat="server" class="easyui-datetimebox" name="birthday" required="true" value="3/4/2010 2:3:56" style="width:150px; height:23px">

						</td>
					</tr>
                <tr>
                  <td valign="top" class="listTd" colspan="2" height="23">
                 服务热度：
                    <asp:TextBox ID="txt_redu" runat="server" Width="552px"></asp:TextBox>
                </td>
            </tr>
          
            <tr>
                <td class="listTd" valign="top" colspan="2">
                    
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <table class="tmain" width="100%">
        <tbody>
            <tr>
                <td bgcolor="ghostwhite" align="right" height="35">
            <input type="button" style="width: 80px; height: 30px" value="返回" onclick="window.location.href='b_sourcelist.aspx'" />
                    <asp:Button ID="btn_Save" runat="server" Text="保存" Width="80" Height="30" 
                        onclick="btn_Save_Click"  >
                    </asp:Button>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
