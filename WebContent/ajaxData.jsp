<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function getData(){
		//获取用户请求信息
		var name=document.getElementById("uname").value;
		//创建ajax引擎对象
		var ajax;
		if(window.XMLHttpRequest){
			ajax=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			ajax=new ActiveXObject("Msxm12.XMLHTTP");
		}
		//复写onreadystatechange
		ajax.onreadystatechange=function(){
			//判断ajax状态码
			if(ajax.readyState==4){
				//判断响应状态码
				if(ajax.status==200){
					var result=ajax.responseText;
					alert(result);
					eval("var u="+result);
					var ta=document.getElementById("ta");
					ta.innerHTML="";
					var tr=ta.insertRow(0);
					var cell0=tr.insertCell(0);
					cell0.innerHTML="编号";
					var cell1=tr.insertCell(1);
					cell1.innerHTML="名称";
					var cell2=tr.insertCell(2);
					cell2.innerHTML="价格";
					var cell3=tr.insertCell(3);
					cell3.innerHTML="位置";
					var cell4=tr.insertCell(4);
					cell4.innerHTML="描述";
					//插入新的行
					var tr=ta.insertRow(1);
					var cell0=tr.insertCell(0);
					cell0.innerHTML=u.uid;
					var cell1=tr.insertCell(1);
					cell1.innerHTML=u.uname;
					var cell2=tr.insertCell(2);
					cell2.innerHTML=u.price;
					var cell3=tr.insertCell(3);
					cell3.innerHTML=u.loc;
					var cell4=tr.insertCell(4);
					cell4.innerHTML=u.desc;
				
				}
			}
		}
		
		ajax.open("get","UserServle?name="+name);
		ajax.send(null);
	}
</script>
</head>
<body>
<h3>欢迎光临英雄商店</h3>
<hr>
英雄名称：<input type="text" name="uname" id="uname"/>
<input type="button" value="搜索" onclick="getData()"/>
<hr>
<table border="1px" id="ta"></table>
</body>
</html>