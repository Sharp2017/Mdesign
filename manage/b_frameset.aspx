<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_frameset.aspx.cs" Inherits="Mdesign.manage.b_frameset" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>网站栏目维护 </title>
    <link href="images/base.css" rel="stylesheet">
    <style>
        .pic1
        {
            padding: 10px;
            display: block;
            height: 150px;
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
            float: left;
            height: 100px;
            width: 100px;
            padding: 10px;
            font-family: Arial;
            font-size: 20px;
            font-weight: bold;
            color: lime;
            padding-left: 30px;
            padding-top: 10px;
        }
        .right
        {
            border: 1px solid cyan;
            float: left;
            height: 100px;
            width: 600px;
            padding: 10px;
        }
    </style>
    <script language="JavaScript" src="js/manage_contentTitle.js"></script>
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
    <script>        writeTitle('设置', 'role.gif');</script>
    <br>
    <div id="mainDiv" style="background-color: #fffff0">
        <div class="pic1">
            <div class="left">
                电子地图
            </div>
            <div class="right">
                <div class="wenzi">
                    高：
                    <asp:TextBox ID="txt_height" runat="server" Style="width: 80px;"></asp:TextBox>
                    宽：
                    <asp:TextBox ID="txt_width" runat="server" Style="width: 80px;"></asp:TextBox>
                    <br/><br/>
                    源：
                    <asp:TextBox ID="txt_src" runat="server" Style="width: 500px;"></asp:TextBox>
                </div>
                <div class="save">
                    <asp:Button ID="but_default" runat="server" Text="保存" CssClass="button" Style="width: 72px;
                        height: 20px" onclick="but_default_Click"   />
                </div>
            </div>
        </div>

        
    </div>
    </form>
</body>
</html>
