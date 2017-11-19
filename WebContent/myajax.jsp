<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function getData(){
		var ajax;
		if(window.XMLHttpRequest){
			ajax=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			ajax=new ActiveXObject("Msxm12.XMLHTTP");
		}
		
		ajax.onreadystatechange=function(){
			if(ajax.readyState==4){
				if(ajax.status==200){
					var result=ajax.responseText;
					var showdiv=document.getElementById("showdiv");
					showdiv.innerHTML=result;
				}else if(ajax.status==404){
					var showdiv=document.getElementById("showdiv");
					showdiv.innerHTML="请求资源不存在";
				}else if(ajax.status==500){
					var showdiv=dpcument.getElementById("showdiv");
					showdiv.innerHTML="服务器繁忙";
				}else{
					var showdiv=document.getElementById("showdiv");
					
				}
			}
		}
		
		ajax.open("get","ajax",true);
		ajax.send(null);
		alert("哈哈");
	}
</script>
<style type="text/css">
	#showdiv{
		border:solid 1px;
		width:200px;
		height:100px;
	}
</style>
</head>
<body>
<h3>欢迎登陆403峡谷</h3>
<hr>
<input type="button" value="测试" onclick="getData()"/>
<div id="showdiv"></div>
</body>
</html>