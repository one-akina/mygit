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
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
  <div class="row" id="row1">
 	 <div class="col-xs-8">		
 	 	<label>=￣ω￣=喵，欢迎来到我的天猫</label>
 	 	<c:if test="${sessionScope.user !=null}" >
 	 		<a href="#">${sessionScope.user.username }</a>
 	 		<a href="#">注销</a>
 	 	</c:if>
 	 	<c:if test="${sessionScope.user ==null}">
 	 		<a href="${APP_PATH }/login">请登录</a>
 	 		<a href="#">免费注册</a>
 	 	</c:if>
		
	</div>
		
  	<div class="col-xs-4">
  	<div class="btn-toolbar">
  		<div class="btn-group">
				<button type="button" class="btn btn-default btn-xs dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					我的淘宝 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">已买到的宝贝</a></li>					
					<li><a href="#">已卖出的宝贝</a></li>
				</ul>
			</div>
		<div class="btn-group">
			<button type="button" class="btn btn-default btn-xs dropdown-toggle"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>收藏夹 <span class="caret"></span>
			</button>
				<ul class="dropdown-menu">
					<li><a href="#">收藏的宝贝</a></li>
					<li><a href="#">收藏的店铺</a></li>				
				</ul>
			</div>		
			<div class="btn-group">
				<button type="button" class="btn btn-default btn-xs dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span class="glyphicon glyphicon-list" aria-hidden="true">服务指南</span> <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">帮助中心</a></li>
					<li><a href="#">品质保障 </a></li>
					<li><a href="#">特色服务</a></li>
					<li><a href="#">7天退换货</a></li>
				</ul>
			</div>
			<a href="${APP_PATH }/shopbus"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>购物车</a>
		</div>
		</div>
  </div>
</div>

<div class="row" id="row1">
	<div class="col-md-4">	
		 <a title="我的淘宝" href="#"></a>
	<div class="col-md-4"></div>					
	<div class="col-md-4">
			<form class="navbar-form navbar-left" action="${APP_PATH }/search" role="search">
				<div class="form-group">
					<input type="text" name="searchtext" class="form-control" aria-describedby="sizing-addon1" placeholder="请输入你要找的关键字"/>
				</div>
				<button type="submit" class="btn btn-default" id="sizing-addon1">搜索</button>
			</form>
		</div>
</div>
<div class="row">
<div class="col-md-2">
	<ul class="mytab" id="myTab">
		<li><label>全部功能</label></li>
 		<li><a href="#">购物车</a></li>
 		<li><a href="#">分类</a></li>
  		<li><a href="#">已购买的宝贝</a></li>
  		<li><a href="#">我的评价</a></li>
  		<li><a href="#">我要维权</a></li>
  		<li><a href="#">关于我们</a></li>
  		<li><a href="#">我的钱包</a></li>
	</ul>
</div>
<div class="col-md-1"></div>
<div class="col-md-7">
	<div>
		<img src="..." alt="..." class="img-circle">
		<a href="#">管理收货地址</a>
		<a href="#">我的钱包</a>
	</div>
	<div>

	</div>
</div>
<div class="col-md-2">

</div>
</div>
</body>
</html>