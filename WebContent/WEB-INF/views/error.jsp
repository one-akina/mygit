<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	var time=5;
	var timer;
	setInterval(
		function(){
			var second=document.getElementById("second");
			if(time>=1){
				second.innerHTML=time;
				time--;
			}else{
				clearInterval(timer);
				location.href="./index.jsp";
			}	
		},
		1000
	);
</script>
</head>
<body>
<h1>你的输入不正确，我们将在<span id="second" style="color:red;">5</span>秒后跳转至登录页面</h1>
</body>
</html>