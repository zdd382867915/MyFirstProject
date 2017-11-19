function myAjax(method,url,data,deal200,deal404,deal500,async){
	//创建ajax引擎对象
	var ajax=getAjax();
	//复写onreadystatement函数
	ajax.onreadystatechange=function(){
		//判断Ajax状态码
		if(ajax.readyState==4){
			//判断响应状态码
			if(ajax.status==200){
				if(deal200){
					deal200(ajax);
				}
			}else if(ajax.status==404){
				if(deal404){
					deal404();
				}
			}else if(ajax.status==500){
				if(deal500){
					deal500();
				}
			}
		}
	}
	//发送请求
	if("get"==method){
		ajax.open("get",url+(data==null?"":"?"+data),async);
		ajax.send(null);
	}else if("post"==method){
		ajax.open("post",url,async);
		ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		ajax.send(data);
	}
}
function getAjax(){
	var ajax;
	if(window.XMLHttpRequest){
		ajax=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		ajax=new ActiveXObject("Msxm12.XMLHTTP");
	}
	return ajax;
}