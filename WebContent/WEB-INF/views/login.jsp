<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/static/jq/jquery-3.3.1.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#back{
	background:url(images/LoginBackGround.jpg);
	background-size:100% 100%;
}
form {
	margin: 100px 350px;
	font:10px;
}
</style>
<title>登录/注册</title>
</head>
<body>
	
	<div>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#buyer"
			aria-controls="buyer" role="tab" data-toggle="tab">我是买家</a></li>
		<li role="presentation"><a href="#seller" aria-controls="seller"
			role="tab" data-toggle="tab">我是卖家</a></li>
		<li role="presentation"><a href="#register"
			aria-controls="register" role="tab" data-toggle="tab">我要注册</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="buyer">	
		<div id="back">
			<hr>
			<a href="${APP_PATH }/Ntamll"><font size="5" color="red">我希望跳过此步骤</font>&gt;</a>
			<form action="${APP_PATH }/Ytamll" method="post" id="buyer_form">
				<table>
					<tr height="60">
						<td width="150"><label>账 号</label>
						<td><input class="form-control" type="text" name="username" size="15"><br>
					<tr height="60">
						<td><label>密 码</label>
						<td><input class="form-control" type="text" name="password" size="15"><br>
					<tr height="60">
						<td><label>验证码</label>
						<td><input class="form-control" type="text" name="random" maxlength="4">
						<td><img src="RandomCodeServlet"><br>
					<tr height="40">
						<td><input type="submit" id="buyer_login" value="登录">
						<td><input type="reset" value="重新输入"><br>
				</table>
			</form>
			<hr>
			</div>
		</div>
	

	<div role="tabpanel" class="tab-pane" id="seller">
	<div id="back">
	<hr>
		<form action="${APP_PATH }/admin" method="post" id="seller_form">
			<table>
				<tr height="60">
					<td width="150"><label>账 号</label>
					<td><input class="form-control" type="text" name="ID" size="15"><br>
				<tr height="60">
					<td><label>密 码</label>
					<td><input class="form-control" type="text" name="password" size="15"><br>
				<tr height="60">
					<td><label>验证码</label>
					<td><input class="form-control" type="text" name="random" maxlength="4">
					<td><img src="RandomCodeServlet"><br>
				<tr height="60">
					<td><input id="seller_login" type="submit" value="登录">
					<td><input type="reset" value="重新输入">
			</table>
		</form>
		<hr>
		</div>
	</div>

	<div role="tabpanel" class="tab-pane" id="register">
	<div id="back">
	<hr>
		<form action="${APP_PATH }/register" method="post" id="register_form">
			<table>
				<tr height="60">
					<td width="150"><label>账 号</label>
					<td><input class="form-control" type="text" name="ID" size="15"><br>
				<tr height="60">
					<td><label>密 码</label>
					<td><input class="form-control" type="text" name="password" size="15"><br>
				<tr height="60">
					<td><label>验证码</label>
					<td><input class="form-control" type="text" name="random" maxlength="4">
					<td><img src="RandomCodeServlet"><br>
				<tr height="60">
					<td><input id="seller_login" type="submit" value="登录">
					<td><input type="reset" value="重新输入">
			</table>
		</form>
		<hr>
		</div>
	</div>
	</div>
</div>
	<script type="text/javascript">
		$(function() {
			reset_form("form");
		})
		//清空表单样式及内容
		function reset_form(ele) {
			//$(ele)[0].reset();
			//清空样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
	</script>
</body>
</html>