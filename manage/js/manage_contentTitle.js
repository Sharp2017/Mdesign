function writeTitle(strTitle,picurl)
{
	document.write( '<TABLE class="main" style="BORDER-RIGHT: #937ae7 1px solid; BORDER-TOP: #937ae7 1px solid; BORDER-LEFT: #937ae7 1px solid; BORDER-BOTTOM: #937ae7 1px solid"');
		document.write( 'cellSpacing="1" cellPadding="1" width="100%" align="center" border="0">');
		document.write( '<TBODY>');
		document.write( '<TR>');
		document.write( '<td bgColor="#d9d8dc"><img src="images/'+ picurl +'" border="0">&nbsp;'+ strTitle +'</td>');
		document.write( '</TR>');
		document.write( '</TBODY>');
		document.write( '</TABLE>');

}
 function br(strHeigt)
{
document.write( '<table>');
document.write( '<tR>');
document.write( '<td height='+ strHeigt +'>');
document.write( '</td>');
document.write( '</tR>');
document.write( '</table>');

}