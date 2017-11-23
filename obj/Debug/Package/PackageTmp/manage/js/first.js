
	function conf()
	{
		if (document.all.txt_user.value=="")
		{
			alert("用户名不能为空！");
			document.all.txt_user.focus();
			return false;
		}
		if (document.all.txt_pass.value=="")
		{
			alert("密码不能为空！");
			document.all.txt_pass.focus();
			return false;
		}
	 }
	 
			 
				function lo()
				{
					var hrefsearch=window.location.search;
					var mon;
					
					if(hrefsearch=="")
					{
						var da=new Date();
						mon=da.getMonth()+1;
						mon=mon+"";//为了数字类型转换为字符串类型
					}
					else
					{
						mon=hrefsearch.replace("?id=","");
					}
					setMonth(mon);
					var mstr=mon+"月";
					
					getContent(mon);
					sets();
				}
				function sets()
				{
					var hrefsearch=window.location.search;
					var mon=hrefsearch.replace("?id=","");
					mon=mon+"月";
					var dd=document.getElementById("header").childNodes[0].childNodes;
					/*
					for(var i=0;i<dd.length;i++)
					{
						var node=dd[i];
						node.setAttribute("id","none");
					}
					*/
					
					for(var i=0;i<dd.length;i++)
					{
						var	node=dd[i].childNodes[0].childNodes[0];
						if(node.nodeValue==mon)
						{
							dd[i].setAttribute("id","current");							
						}
						else
						{
							dd[i].setAttribute("id","none");
						}
						
					}
					 
				}
				function getContent(mon)
				{
					process();
					//ctbri.manage.T_selfLogAll.getOther(mon,_callBack);
				}
				function process()
				{
					if(arguments.length!=4)
					{
						document.getElementById("recentMsg4").innerHTML="<font color=red>正在加载...</font>"
						document.getElementById("recentMsg3").innerHTML="<font color=red>正在加载...</font>"
						document.getElementById("recentMsg2").innerHTML="<font color=red>正在加载...</font>"
						document.getElementById("recentMsg1").innerHTML="<font color=red>正在加载...</font>"
						document.getElementById("edit4").disabled=true;
						document.getElementById("edit3").disabled=true;
						document.getElementById("edit2").disabled=true;
						document.getElementById("edit1").disabled=true	;					
					}
					else
					{
						document.getElementById("recentMsg1").innerHTML=arguments[0];
						document.getElementById("recentMsg2").innerHTML=arguments[1];
						document.getElementById("recentMsg3").innerHTML=arguments[2];
						document.getElementById("recentMsg4").innerHTML=arguments[3];
						document.getElementById("edit4").disabled=false;
						document.getElementById("edit3").disabled=false;
						document.getElementById("edit2").disabled=false;
						document.getElementById("edit1").disabled=false;								
					}
					
				}
				function _callBack(_call)
				{
					var va=_call.value.Tables[0];
					for (var i = 0;i < va.Rows.length;i++)
					{
						var s1 = va.Rows[i].ProjectContent;
						var s2 = va.Rows[i].timerContent;
						var s3 = va.Rows[i].ChuChai;
						var s4 = va.Rows[i].otherContent;
						process(s1,s2,s3,s4);						
					}
					if(va.Rows.length==0)
					{
						var stemp= "〖<MARQUEE style='WIDTH: 126px' behavior='alternate'><strong>请填写工作任务！ </strong></MARQUEE>〗";
						process(stemp,stemp,stemp,stemp);
					}
				}
				function eachli()
				{
					var a=document.getElementsByTagName("LI");
					for(var i=0;i,a.length;i++)
					{						
					}
				}
				function setMonth(str)
				{
					var edit4=document.getElementById("edit4");
					var edit3=document.getElementById("edit3");
					var edit2=document.getElementById("edit2");
					var edit1=document.getElementById("edit1");
					
					edit4.onclick=_hre('t_selflog4.aspx?month=' +str);
					edit3.onclick=_hre('t_selflog3.aspx?month=' +str);
					edit2.onclick=_hre('t_selflog2.aspx?month=' +str);
					edit1.onclick=_hre('t_selflog.aspx?month=' +str);
					
				}
				function months()
				{
					var lnow= event.srcElement;
					var lp=lnow.parentNode.parentNode;

					for(var i=0;i<lp.childNodes.length;i++)
					{
						var node=lp.childNodes[i];
						node.setAttribute("id","none");
					}
					lnow.parentNode.setAttribute("id","current");
					var str=lnow.childNodes[0].nodeValue.replace("月","");
					//setMonth(str);
					//getContent(str);					
					//onclick="javascript:"
				}
				function _hre(str)
				{
					return function()
					{
						hre(str);
					}
				}
				function hre(str)		
				{

					window.location.href=str;
				}
