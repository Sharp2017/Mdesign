<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Mdesign.manage.login" %>


 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD id=head1><TITLE 
id=Title_CPLogin>管理后台</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8"><LINK 
href="loginCss/layoutzhgb2312.css" type=text/css rel=stylesheet><LINK 
href="loginCss/login.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.6001.18639" name=GENERATOR></HEAD>
<BODY>
<SCRIPT language=JavaScript type=text/JavaScript>
    window.onload = function () {
        var inputN = document.getElementById("txt_user");
        inputN.focus();
    }

    function checkThis() {
        window.location.href = 'main.htm';
    }
    </SCRIPT>

<CENTER>
    <form id="form2" runat="server">
  
 
<DIV id=position>
<DIV id=inposition>
<DIV class=login-left>
<DIV class=login-left-logo></DIV><!---
            <div class="login-left-content" style="padding-left:20px;">
                <ul>
                    <li>安全稳定的WIN2003操作系统<li>最高效的数据库管理功能<li>功能强大的网站后台管理系统</li>
                </ul>
            </div>  -->
<DIV class=login-left-sever style="PADDING-LEFT: 20px"> 


</DIV></DIV>

<DIV class=login-right>
<DIV id=UpdatePanel1 style="padding-top:50px;">
<DIV class=login-right-title>  </DIV>
<DIV class=login-right-input>
<TABLE cellSpacing=0 cellPadding=0 width=200 border=0>
  <TBODY>
  <TR>
    <TD id=tdLeft noWrap align=right>用户名： </TD>
    <TD>&nbsp;<asp:TextBox ID="txt_user" runat="server" style="width:180px;"></asp:TextBox>
      </TD></TR>
  <TR>
    <TD style="HEIGHT: 30px" align=right>密&nbsp;&nbsp;&nbsp;码： </TD>
    <TD style="HEIGHT: 30px">&nbsp;<asp:TextBox  ID="txt_pass" runat="server" style="width:180px;" 
            TextMode="Password"></asp:TextBox>
                                        </TD></TR>
  <TR>
    <TD style="HEIGHT: 30px" align=right>
        
      </TD>
    <TD style="HEIGHT: 30px" noWrap>
    <asp:Button ID="but_login" class=button runat="server" Text="登 录" 
            onclick="but_login_Click" />
     
<INPUT class=button id=btnTest runat="server"  type=button value="取 消" onserverclick="btnTest_onclick"> 
  </TD></TR></TBODY></TABLE></DIV></DIV></DIV></DIV></DIV>
 
    </form>
    </CENTER>
<DIV id=header>
    </DIV>
<DIV id=content></DIV>
<DIV id=buttom>
<DIV class=copy2>Copyright
 
 </DIV>
<DIV class=copy></DIV></DIV></BODY></HTML>