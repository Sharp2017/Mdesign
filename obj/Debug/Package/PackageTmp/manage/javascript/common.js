function Init()
{
	window.resizeTo(250,600);
	document.oncontextmenu = function() { return false;}
}

function el(id)
{
	return document.getElementById(id);
}

function DealBrackets(srcStr)
{
	var destStr = srcStr;
	destStr = destStr.replace(new RegExp("<", "g"), "&lt;")
	destStr = destStr.replace(new RegExp(">", "g"), "&gt;")
	return destStr;
}
 
				function stripTags(s)
				{
					return s.replace(/<\/?[^>]+>/gi,'');
				}
 