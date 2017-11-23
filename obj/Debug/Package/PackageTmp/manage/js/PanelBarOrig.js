/*------------------------------------------------------------------------------
 * FILE    : PanelBarOrig.js
 * PURPOSE : Render Panelbar like cross-browser DHTML control.
 * REQUIRES: JavaScript 1.3, IE 6.0, FireFox 1.0
 * AUTHOR  : Khan Information Systems (KIS)
 *------------------------------------------------------------------------------
 * Copyright (c) 2005. Khan Information Systems. All Rights Reserved
 * The contents of this file are subject to the KIS Public License 1.0
 * (the "License"); you may not use this file except in compliance with the 
 * License. You should have received a copy of the KIS Public License along with 
 * this library; if not, please ask your software vendor to provide one.
 * 
 * YOU AGREE THAT THE PROGRAM IS PROVIDED AS-IS, WITHOUT WARRANTY OF ANY KIND
 * (EITHER EXPRESS OR IMPLIED) INCLUDING, WITHOUT LIMITATION, ANY IMPLIED 
 * WARRANTY OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, AND ANY 
 * WARRANTY OF NON INFRINGEMENT. IN NO EVENT SHALL THE CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON 
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THE 
 * PROGRAM, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * See the License for the specific language governing rights and limitations 
 * under the License.
 -----------------------------------------------------------------------------*/
// link target constants
TARGET_OTHER  = 0;
TARGET_BLANK  = 1;
TARGET_SELF   = 2;
TARGET_PARENT = 3;
TARGET_TOP    = 4;

// borwser constants
BROWSER_IE    = 1;
BROWSER_GECKO = 2;
BROWSER_OTHER = -1;

var _currMenu     = "";
var _contIndex    = 0;			//Total number of menus.
var _themeSet     = false;

var _themeFolder  = "css";
var _themeFile    = "XPBlue.css";
var _imageFolder  = "Images";
var _browser      = -1;
var _strCtxt      = "";

function MenuContainer()
{
    this.id = 0;
    this.mnuIndex = 0;
    this.menus = new Array;

    this.addMenu = addMenu;
    this.render  = initialize;
}

function MenuBand(pstrDesc, pstrTip, pstrBack)
{
	// Properties
	this.id        = "";		//generated at runtime.
	this.parentId  = 0;
	this.label     = pstrDesc;	//Text to be displayed in header
	this.microHelp = pstrTip;	//Tooltip text
	this.isHeader  = true;
	this.open      = false;		//future use
	this.submenu   = new Array;	//array containing link items.
	this.smcount   = 0;			//count of sub items.
    this.backImage = pstrBack;  // Background image

	//Methods
	this.addSubMenu = addSubMenu;	//function for item addition
	this.render     = drawMenu;		//function for rendering header
}

function SubMenu(pstrDesc, pstrLink, pstrLinkData, pstrTip, pstrImage, pstrTarget)
{
	// Properties
	this.parentId   = "";			//populated at runtime
	this.label      = pstrDesc;		//Item text to be displayed
	this.hlink      = pstrLink;		//Link url
	this.linkTarget = pstrTarget;	//Target window and or frame identifier
	this.linkData   = pstrLinkData;	//Exrta data to be passed through querystring.
	this.microHelp  = pstrTip;		//Tooltip text.
	this.isHeader   = false;
	this.isSelected = false;		//future use
	this.iconSrc    = pstrImage;	//Name of the image file.

	//Methods
	this.render     = drawSubMenu;	//function for rendering sub item.
}

function addMenu(pstrDesc, pstrTip, pstrBack)
{
	var mnuRet;

	mnuRet = new MenuBand(pstrDesc, pstrTip, pstrBack);
	mnuRet.id = this.mnuIndex;
	mnuRet.parentId = this.id;
	this.menus[this.mnuIndex] = mnuRet;
	this.mnuIndex++;
	return mnuRet;
}

function addSubMenu(pstrDesc, pstrLink, pstrLinkData, pstrTip, pstrImage, pstrTarget)
{
	var objTmp;

	objTmp = new SubMenu(pstrDesc, pstrLink, pstrLinkData, pstrTip, pstrImage, pstrTarget);
	objTmp.parentId = this.id;
	this.submenu[this.smcount] = objTmp;
	this.smcount++;
}

function drawMenu()
{
	var iCntr = 0;
	var objMenu;
	var strId, strLbl;

	document.write("<div class=\"menuHeaderCollapsed\" id=\"mnu_" + this.parentId + 
                    "_" + this.id + "\"" + 
					" onmouseover=\"mousehover(this)\"" + 
					" onmouseout=\"mouseout(this)\"" +
					"onclick=\"toggle(this)\">");
	document.write("<table border=\"0\" cellspacing=\"0\"" +
					" cellpadding=\"4\" width=\"100%\">");
	document.write("<tr><td style=\"vertical-align: center;\">" + this.label + 
					"</td></tr>");
	document.write("</table></div>");

	//start drawing sub menu
	document.write("<div style=\"display: none; visibility: hidden;\"" +
					" class=\"menuItems\" id=\"mnu_" + this.parentId + "_" +
                    this.id + "_child" + "\">");
   	if (this.backImage != null)
   	{
    	document.write("<table border=\"0\" cellspacing=\"2\"" +
					" cellpadding=\"4\" width=\"100%\" style=\"" + 
                    "background-image: url('" + _imageFolder + 
                    "/" + this.backImage + "');\">");
    }
    else
    	document.write("<table border=\"0\" cellspacing=\"2\"" +
					" cellpadding=\"4\" width=\"100%\">");

	for (iCntr = 0; iCntr < this.smcount; iCntr++)
	{
		this.submenu[iCntr].render();
	}
	document.write("</table></div>");
	document.write ("<span style=\"DISPLAY: block\">&nbsp;</span>");
}

function drawSubMenu()
{
	var strImg = "";

	document.write("<tr><td>");
	if (this.iconSrc)
		strImg = "<img src=\"" + _strCtxt + _imageFolder + "/" + 
					this.iconSrc + "\" border=\"0\"\">&nbsp;";
	document.write("<a href=" + 
					getLink(this.linkTarget, (_strCtxt + this.hlink), this.linkData) + 
					"\">");
	document.write(strImg);
	document.write(this.label);
	document.write("</a>");
	document.write("</td></tr>");
}

function getLink(pTarget, pstrLink, pstrLinkData) 
{
	var strRet = "";
	var strTmp;

	strTmp = pstrLink;
	if (pstrLinkData != null)
		strTmp = pstrLink + "?" + pstrLinkData;

	if (pTarget == TARGET_BLANK) 
		strRet = "\"" + strTmp + "\" TARGET=\"_blank\"";
	else if (pTarget == TARGET_SELF)
		strRet = "\"" + strTmp + "\" TARGET=\"_self\"";
	else if (pTarget == TARGET_PARENT)
		strRet = "\"" + strTmp + "\" TARGET=\"_parent\"";
	else if (pTarget == TARGET_TOP)
		strRet = "\"" + strTmp + "\" TARGET=\"_top\"";
	else if (pTarget != null)
		strRet = "\"" + strTmp + "\" TARGET=\"" + pTarget + "\"";
	else
		strRet = "\"" + strTmp + "\"";
	return strRet;
}

function mousehover(pobjSrc)
{
	var strCls = pobjSrc.className;
	if (strCls == "menuHeaderExpanded")
		pobjSrc.className = "menuHeaderExpandedOver";
	else
		pobjSrc.className = "menuHeaderCollapsedOver";
}

function mouseout(pobjSrc)
{
	var strCls = pobjSrc.className;
	if (strCls == "menuHeaderExpandedOver")
		pobjSrc.className = "menuHeaderExpanded";
	else
		pobjSrc.className = "menuHeaderCollapsed";
}

function toggle(pobjSrc)
{
	var strCls = pobjSrc.className;
	var strId = pobjSrc.id;
	var objTmp, child;

	if (pobjSrc.id != _currMenu)
		objTmp = document.getElementById(_currMenu);

	if (objTmp)
	{
		objTmp.className = "menuHeaderCollapsed";

		child = document.getElementById(_currMenu + "_child");
		child.style.visibility = "hidden";
		child.style.display = "none";
	}

	child = document.getElementById(strId + "_child");
	if (child.style.visibility == "hidden")
	{
		pobjSrc.className = "menuHeaderExpandedOver";
		child.style.visibility = "visible";
		child.style.display = "block";
	}
	else
	{
		pobjSrc.className = "menuHeaderCollapsedOver";
		child.style.visibility = "hidden";
		child.style.display = "none";
	}
	_currMenu = pobjSrc.id;
}

function detectBrowser()
{
	switch(navigator.family)
	{
		case 'ie4':
			_browser = BROWSER_IE;
			break;
		case 'gecko':
			_browser = BROWSER_GECKO;
			break;
		default:
			_browser = BROWSER_OTHER;
			break;
	}
}

function detectContext()
{
	var strProto, strHost, strPath;
	var strPort, strUrl, strBase;
	var strRemain;
	var intLen, intPos;

	// determine the context
	strProto  = window.location.protocol;
	if (strProto.indexOf("http") != -1)
	{
		strHost   = window.location.hostname;
		strPath   = window.location.pathname;
		strPort   = window.location.port;
		strUrl    = window.location.href;
		strBase   = strProto + "/" + "/" + strHost + ":" + strPort;
		intLen    = strBase.length;
		strRemain = strUrl.substr(intLen + 1);
		intPos    = strRemain.indexOf("/");
		_strCtxt  = strRemain.substr(0, intPos);
		if (_strCtxt.length > 0)
			_strCtxt = "/" + _strCtxt + "/";
	}
}

function initialize(pintWidth)
{
	var iCntr = 0;
	var clsId1 = "\x4B\x68\x61\x6E\x20\x49\x6E\x66\x6F\x72";
	var clsId2 = "\x6D\x61\x74\x69\x6F\x6E\x20\x53\x79\x73\x74\x65\x6D\x73";

	for (iCntr = 0; iCntr < this.mnuIndex; iCntr++)
	{
        document.write("<div id=\"panelBar\" style=\"width: " + pintWidth + "\">");
        this.menus[iCntr].render();
        document.write("</div></center>");
	}
}

/*------------------------------------------------------------------------------
 * Public functions
 *----------------------------------------------------------------------------*/
function createContainer()
{
    var contRet;

    contRet = new MenuContainer();
    contRet.id = _contIndex;
    _contIndex++;
    return contRet;
}

function setTheme(pstrTheme, pstrThemeFolder, pstrImgFolder)
{
	if (pstrTheme != null)
		_themeFile =  pstrTheme;
	if (pstrThemeFolder != null)
		_themeFolder = pstrThemeFolder;
	if (pstrImgFolder != null)
		_imageFolder = pstrImgFolder;

    if (!_themeSet)
    {
	   document.write("<link href=\"" + _themeFolder + "/" + _themeFile + "\"" + 
	       				" rel=\"stylesheet\" type=\"text/css\">");
	   _themSet = true;
	}
}
