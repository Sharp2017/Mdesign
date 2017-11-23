<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_IndexProgramaInfo.aspx.cs" Inherits="Mdesign.manage.b_IndexProgramaInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>网站栏目维护 </title>
    <link href="images/base.css" rel="stylesheet">
    <style type="text/css">
        .pic1
        {
            padding: 10px;
            display: block;
            height: 165px;
        }
        .pic
        {
            margin-bottom: 5px;
        }
        .save
        {
            padding-top: 20px;
            padding-bottom: 15px;
            padding-left: 30px;
        }
        .left
        {
            border: 1px solid cyan;
            float:left;
            padding-left: 30px;
            padding-top: 10px;
            padding: 10px;
            height: 145px;
            width: 100px;

            font-family: Arial;
            font-size: 20px;
            font-weight: bold;
            color: lime;

            text-align:center;
        }
        .right
        {
            border: 1px solid cyan;
            float: left;
            height: 145px;
            width: 600px;
            padding: 10px;
        }
        .style1
        {
            width: 60px;
            text-align:center;
            height: 34px;
        }
        .style2
        {
            width: 60px;
            text-align: center;
            height: 69px;
        }
        .style3
        {
            height: 69px;
        }
        .style4
        {
            height: 34px;
        }
    </style>
    <script language="JavaScript" type="text/javascript" src="js/manage_contentTitle.js"></script>
    <script>
        function conf() {
            if (document.all.txt_title.value == "") {
                alert("标题不能为空！");
                document.all.txt_title.focus();
                return false;
            }
            if (document.all.txt_url.value == "") {
                alert("URL不能为空！");
                document.all.txt_url.focus();
                return false;
            }
            if (document.all.txt_sort.value == "") {
                alert("排序不能为空！");
                document.all.txt_sort.focus();
                return false;
            }
            return true;
        }

        function fz(sp) {

            var nowvar = document.all.txt_deal.value;
            if (nowvar != '') {
                document.all.txt_deal.value = document.all.txt_deal.value + ',' + sp;
            }
            else {
                document.all.txt_deal.value = sp;
            }
        }
    </script>
</head>
<body class="main">
    <form id="form2" runat="server">
    <script>        writeTitle('首页栏目介绍设置', 'role.gif');</script>
    <br>
    <div id="mainDiv" style="background-color: #fffff0">
        <div class="pic1">
            <div class="left">
                服务资源
            </div>
            <div class="right">
                <div class="wenzi">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
                        style="height: 145px">
                    	<tr>
                    		<td class="style1">链接地址：</td>
                    		<td class="style4">
                                <asp:TextBox ID="txtSourceURL" runat="server" Height="20px" Width="530px"></asp:TextBox>
                                
                            </td>
                            
                    	</tr>
                    	
                    	<tr>
                    		<td class="style2">简介内容：</td>
                    		<td class="style3">
                                <textarea id="txtAreaSource" name="Source" runat="server"></textarea></td>
                    	</tr>
                    	<tr>
                    		<td  colspan="2" style="text-align:right;">
                                <asp:Button ID="btnSourceSave" runat="server" Height="25px" Text="保存" 
                                    Width="70px" onclick="btnSourceSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    	</tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="pic1">
            <div class="left">
                数据成果</div>
            <div class="right">
                <div class="wenzi">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
                        style="height: 145px">
                    	<tr>
                    		<td class="style1">链接地址：</td>
                    		<td class="style4">
                                <asp:TextBox ID="txtDataURL" runat="server" Height="20px" Width="530px"></asp:TextBox>
                                
                            </td>
                            
                    	</tr>
                    	
                    	<tr>
                    		<td class="style2">简介内容：</td>
                    		<td class="style3">
                                <textarea id="txtAreaData" name="Data" runat="server"></textarea></td>
                    	</tr>
                    	<tr>
                    		<td  colspan="2" style="text-align:right;">
                                <asp:Button ID="btnDataSave" runat="server" Height="25px" Text="保存" 
                                    Width="70px" onclick="btnDataSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    	</tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="pic1">
            <div class="left">
                应用系统</div>
            <div class="right">
                <div class="wenzi">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
                        style="height: 145px">
                    	<tr>
                    		<td class="style1">链接地址：</td>
                    		<td class="style4">
                                <asp:TextBox ID="txtCommonURL" runat="server" Height="20px" Width="530px"></asp:TextBox>
                            </td>
                            
                    	</tr>
                    	
                    	<tr>
                    		<td class="style2">简介内容：</td>
                    		<td class="style3">
                                <textarea id="txtAreaCommon" name="Common" runat="server"></textarea></td>
                    	</tr>
                    	<tr>
                    		<td  colspan="2" style="text-align:right;">
                                <asp:Button ID="btnCommonSave" runat="server" Height="25px" Text="保存" 
                                    Width="70px" onclick="btnCommonSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    	</tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="pic1">
            <div class="left">
                平台指南</div>
            <div class="right">
                <div class="wenzi">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
                        style="height: 145px">
                    	<tr>
                    		<td class="style1">链接地址：</td>
                    		<td class="style4">
                                <asp:TextBox ID="txtPlantURL" runat="server" Height="20px" Width="530px"></asp:TextBox>
                                
                            </td>
                            
                    	</tr>
                    	
                    	<tr>
                    		<td class="style2">简介内容：</td>
                    		<td class="style3">
                                <textarea id="txtAreaPlant" name="Plant" runat="server"></textarea></td>
                    	</tr>
                    	<tr>
                    		<td  colspan="2" style="text-align:right;">
                                <asp:Button ID="btnPlantSave" runat="server" Height="25px" Text="保存" 
                                    Width="70px" onclick="btnPlantSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    	</tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="pic1">
            <div class="left">
                开发园地</div>
            <div class="right">
                <div class="wenzi">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
                        style="height: 145px">
                    	<tr>
                    		<td class="style1">链接地址：</td>
                    		<td class="style4">
                                <asp:TextBox ID="txtDesignURL" runat="server" Height="20px" Width="530px"></asp:TextBox>
                            </td>
                            
                    	</tr>
                    	
                    	<tr>
                    		<td class="style2">简介内容：</td>
                    		<td class="style3">
                                <textarea id="txtAreaDesign" name="Design" runat="server"></textarea></td>
                    	</tr>
                    	<tr>
                    		<td  colspan="2" style="text-align:right;">
                                <asp:Button ID="btnDesignSave" runat="server" Height="25px" Text="保存" 
                                    Width="70px" onclick="btnDesignSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    	</tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="pic1">
            <div class="left">
                常见问题</div>
            <div class="right">
                <div class="wenzi">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" 
                        style="height: 145px">
                    	<tr>
                    		<td class="style1">链接地址：</td>
                    		<td class="style4">
                                <asp:TextBox ID="txtQuestionURL" runat="server" Height="20px" Width="530px"></asp:TextBox>
                            </td>
                    	</tr>
                    	
                    	<tr>
                    		<td class="style2">简介内容：</td>
                    		<td class="style3">
                                <textarea id="txtAreaQuestion" name="Question" runat="server"></textarea></td>
                    	</tr>
                    	<tr>
                    		<td  colspan="2" style="text-align:right;">
                                <asp:Button ID="btnQuestionSave" runat="server" Height="25px" Text="保存" 
                                    Width="70px" onclick="btnQuestionSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    	</tr>
                    </table>
                </div>
            </div>
        </div>

        
    </div>
    </form>
</body>
</html>