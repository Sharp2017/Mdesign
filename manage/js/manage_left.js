function leftTitle(title,divName)
{
	document.write( '<TR>');
	document.write( '<TD style="CURSOR: hand" background="images/btbg.gif" height="22">');
	document.write( '<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">');
	document.write( '<TR>');
	document.write( '<TD width="21%">&nbsp;</TD>');
	document.write( '<TD width="79%"><SPAN class="fontt"><A class="fontt" onclick="javascript:hit('+ divName +');"><FONT color="#ffffff">'+title+'</FONT></A></SPAN></TD>');
	document.write( '</TR>');
	document.write( '</TABLE>');
	document.write( '</TD>');
	document.write( '</TR>');
	document.write( '<TR>');
	document.write( '<TD vAlign="top" align="center">');
	document.write( '<DIV id="'+ divName +'" style="DISPLAY: yes" >');
	document.write( '<TABLE cellSpacing="0" cellPadding="0" width="140" border="0">');

}
function leftTitleShow(title,divName)
{
	document.write( '<TR>');
	document.write( '<TD style="CURSOR: hand" background="images/btbg.gif" height="22">');
	document.write( '<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">');
	document.write( '<TR>');
	document.write( '<TD width="21%">&nbsp;</TD>');
	document.write( '<TD width="79%"><SPAN class="fontt"><A class="fontt" onclick="javascript:hit('+ divName +');"><FONT color="#ffffff">'+title+'</FONT></A></SPAN></TD>');
	document.write( '</TR>');
	document.write( '</TABLE>');
	document.write( '</TD>');
	document.write( '</TR>');
	document.write( '<TR>');
	document.write( '<TD vAlign="top" align="center">');
	document.write( '<DIV id="'+ divName +'" style="DISPLAY: yes" >');
	document.write( '<TABLE cellSpacing="0" cellPadding="0" width="140" border="0">');

}
function leftBottom()
{
	document.write( '</TABLE>');
	
	document.write( '</DIV>');
	
	document.write( '<BR>');
	
	document.write( '</TD>');
	
	document.write( '</TR>');
	

}
function leftItem(url,title,target)
{
	document.write( '<!----->');
	document.write( '<TR>');
	
	document.write( '<TD align=center width=24>');
	
	document.write( '<IMG height=9 src="images/dot.gif" width=9>');
	
	document.write( '</TD>');
	
	document.write( '<TD width=123 height=20>');
	
	document.write( '<SPAN class=fontt>');
	
	document.write( '<A class=fontt onclick=javascript:allbd();bd(this); href="'+ url +'" target='+ target +' name=l1_1>'+ title +'</A>');
	
	document.write( '</SPAN>');
	
	document.write( '</TD>');
	
	document.write( '</TR>');
	
	document.write( '<TR>');
	
	document.write( '<TD colSpan=2>');
	
	document.write( '<IMG height=1 src="images/line.gif" width=133>');
	
	document.write( '</TD>');
	
	document.write( '</TR>');
	
	document.write( '');
	
	document.write( '<!------>');
}


function allbd() {
	return;
    l1_1.style.color="#000000";
    l1_3.style.color="#000000";
	
    l1_2.style.color="#000000";
	
    l2_1.style.color="#000000";
    l2_2.style.color="#000000";
    l2_3.style.color="#000000";
    l2_4.style.color="#000000";
    l2_5.style.color="#000000";


    l3_1.style.color="#000000";
    l3_2.style.color="#000000";
    l3_3.style.color="#000000";
    l3_4.style.color="#000000";
    l3_5.style.color="#000000";
    l3_6.style.color="#000000";
  
    l4_2.style.color="#000000";
    l4_8.style.color="#000000";
  
    l4_3.style.color="#000000";
    l4_4.style.color="#000000";
    l4_5.style.color="#000000";
    l4_6.style.color="#000000";
    l4_7.style.color="#000000";

    l4_9.style.color="#000000";




    l5_1.style.color="#000000";
    l5_2.style.color="#000000";

}

function bd(id) {
return;
  id.style.color="#FF0000";
}


function window.onload()
{

}

function hit(name)
{
    if (name.style.display=="none") {
           name.style.display="";
    }
    else {
        name.style.display="none";
    }

}