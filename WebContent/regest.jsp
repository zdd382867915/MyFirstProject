<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function getData(){
		//获取用户名注册信息
		var name=document.getElementById("uname").value;
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
					//alert(result);
					if(result==null){
						
					}else{
						
						var span=document.getElementById("namespan");
						span.innerHTML="该昵称已经被占用";
					}
				}
			}
		}
		
		ajax.open("get","UserServle?name="+name);
		ajax.send(null);
	}
</script>
</head>
<body>
<h3>用户注册</h3>
<hr>
<table>
	<tr>
		<td>编号</td>
		<td>
			<input type="text" name="uid" id="uid"/>
		</td>
	</tr>
	<tr>
		<td>用户名</td>
		<td>
			<input type="text" name="uname" id="uname" onmouseout="getData()"/><span id="namespan" style="color:red"></span>
		</td>
	</tr>
	<tr>
		<td>价格</td>
		<td>
			<input type="text" name="price" id="price"/>
		</td>
	</tr>
	<tr>
		<td>位置</td>
		<td>
			<input type="text" name="loc" id="loc"/>
		</td>
	</tr>
	<tr>
		<td>描述</td>
		<td>
			<input type="text" name="desc" id="desc"/>
		</td>
	</tr>
	<tr>
		<td clospan="2">
			<input type="button" value="注册" onclick="getData()"/> 
		</td>
	</tr>
</table>
</body>
</html>