<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="b_topnews.aspx.cs" Inherits="Mdesign.manage.b_topnews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>网站栏目维护
    </title>
    <LINK href="images/base.css" rel="stylesheet">
    <style>
        .pic1
    {
	    padding:10px;display:block;height:220px;
    }
    .pic
    {
	    margin-bottom:5px;
    }
    .save
    {
    	padding-top:20px;padding-bottom:15px;padding-left:30px;
    	 
    }
    .left
    {
    	border:1px solid cyan;float:left;height:100px;width:100px;padding:10px;font-family:Arial ;font-size:50px;font-weight:bold;color:lime;padding-left:30px;padding-top:10px;
    	
    }
    .right
    {
    	border:1px solid cyan;float:left;height:200px;width:600px;padding:10px;
    }
    </style>
			
    <SCRIPT LANGUAGE="JavaScript" src="js/manage_contentTitle.js"></SCRIPT>
    <SCRIPT LANGUAGE="JavaScript" src="js/manage_left.js"></SCRIPT>
    <script>
        function conf() {
            //		if (document.all.txt_title.value=="")
            //		{
            //			alert("标题不能为空！");
            //			document.all.txt_title.focus();
            //			return false;
            //		}
            //		if (document.all.txt_url.value=="")
            //		{
            //			alert("URL不能为空！");
            //			document.all.txt_url.focus();
            //			return false;
            //		}
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
    <script>        writeTitle('首页顶部轮换广告', 'role.gif'); function File1_onclick() {

        }

    </script>
			<br>
    <div id="mainDiv" style="background-color:#fffff0   ">
   
    <div class=pic1>
      
        <div class="right">
        
        <div class=pic>图片：
         <input id="File1" type="file" name="filePic1" runat="server" style="width:400px;" onclick="return File1_onclick()">
            <asp:HyperLink ID="link1" runat="server">查看</asp:HyperLink>
        </div>
        <div class=wenzi>文字：
        <asp:TextBox ID="txt_title" runat="server" style="width:500px;"></asp:TextBox>    
        </div>
        <div class=wenzi>链接：
        <asp:TextBox ID="txt_url" runat="server" style="width:500px;"></asp:TextBox>    
        </div>
        <div class=wenzi>序号：
        <asp:TextBox ID="txt_sort" runat="server" style="width:500px;"></asp:TextBox>    
        </div>
        <div class=wenzi>显示：
                <asp:DropDownList ID="drp_isUse" runat="server">
                
                 <asp:ListItem Text="是" Value="是"></asp:ListItem>
                <asp:ListItem Text="否" Value="否"></asp:ListItem>
               
                </asp:DropDownList>
        </div>
        <div class="save">
        <asp:Button ID="but_save" runat="server" Text="保存" CssClass="button" 
             style="width:72px;height:20px" onclick="but_save_Click" />   
            
        &nbsp;&nbsp;
       
             <input type="button" value="返回" class="button" style="width:72px;height:20px"onclick="window.location.href='b_topnewsList.aspx'">   
        </div>
          
        </div>
    </div>
     
   
    </div>
    </form>
</body>
</html>
