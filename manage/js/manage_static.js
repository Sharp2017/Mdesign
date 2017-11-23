var s;
function killErrors(){
return true;
}
window.onerror = killErrors;
window.onload = function ()
{
	 s = location.protocol+"//"+location.hostname+""+location.port+location.pathname
	 s = s.substr(0,s.lastIndexOf("/"))+"/ashx/getStatic.ashx";
}
function fncPost(){
		try{
			var tarReq = document.all.item("DropDownList1");

			if (tarReq.value!=""){

				var xmlReq;//= new ActiveXObject("Msxml2.DOMDocument");
				//xmlReq.loadXML(tarReq.value);
				xmlReq=tarReq.value;
				var strRes = fncPostDo(xmlReq);
				body_editor.document.body.innerHTML = strRes;
				document.all.item("Button1").disabled=false;
				if (xmlReq=="0")
				document.all.item("Button1").disabled=true;
			}
		}catch(e){

			alert("fncPost error = " + e.description)
		}
	}
	
	function fncPostDo(xmlReq)
	{
		try{
			var strURL = s;

			var xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
			xmlhttp.Open("POST", strURL, false);
			xmlhttp.Send(xmlReq);

			return xmlhttp.responseText;
		}catch(e){

			alert("fncPostDo error = " + e.description)
		}
	}
 