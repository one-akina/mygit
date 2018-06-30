<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		body{
			margin:0 20px;
		}
		#row1{
			border-bottom:1px solid #ff0000;
		}
		.mytab li{
			border-bottom:2px dotted #ff1100;
			padding:5px 0px;
		}
		.mytab li a{
			font:"宋体" 14px bold;
		}
	</style>
<title>主页</title>
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
		 <img alt="Brand" width="370" height="70"
			src="${APP_PATH }/images/tianmao.jpg">
	</div>
	<div class="col-md-4"></div>					
	<div class="col-md-4">
			<form class="navbar-form navbar-left" action="${APP_PATH }/search" role="search">
				<div class="form-group">
					<input type="text" name="serchtext" class="form-control" aria-describedby="sizing-addon1" placeholder="请输入你要找的关键字"/>
				</div>
				<button type="submit" class="btn btn-default" id="sizing-addon1">搜索</button>
			</form>
		</div>
</div>

<div class="row">
<div class="col-md-2">
	<ul class="mytab" id="myTab">
		<li><label>热门分类</label></li>
 		<li><a href="shop?shopnum=1">图书</a></li>
 		<li><a href="shop?shopnum=2">生活家居</a></li>
  		<li><a href="shop?shopnum=3">电子产品</a></li>
  		<li><a href="shop?shopnum=4">休闲零食</a></li>
  		<li><a href="shop?shopnum=5">粮油厨房</a></li>
  		<li><a href="shop?shopnum=6">方便速食</a></li>
  		<li><a href="shop?shopnum=7">文具体育</a></li>
  		<li><a href="shop?shopnum=8">美容护肤</a></li>
  		<li><a href="shop?shopnum=9">家纺衣装</a></li>
	</ul>
</div>
<div class="col-md-1"></div>
<div class="col-md-9">
	<div class="view">
		<table id="commodit_tab" >
			
		</table>
	</div>
</div>
<div class="row">
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
</div>

<script type="text/javascript">
	$(function(){
		view();
	});
	function view(){
		$.ajax({
			url:"${APP_PATH}/home",
			type:"GET",
			success:function(result){
				build_tab(result);
			}
		})
	}
	function build_tab(result){
		$("#commodit_tab").empty();
		var mod = result.extend.pageInfo.list;
		$.each(mod, function(index, item) {
			
			var imageTd=$("<td></td>").append($("<a></a>").attr("href","${APP_PATH}/commodit?number="+item.number)
					.append($("<img>").attr("alt",item.name).attr("src","${APP_PATH}/images/"+item.photo)
					.attr("width","200px").attr("height","200px")));
			

			var nameTd=$("<td></td>").append($("<a></a>").attr("href","${APP_PATH}/commodit?number="+item.number)
					.text(item.name));
				
				
			var priceTd=$("<td></td>").append($("<a></a>").attr("href","${APP_PATH}/commodit?number="+item.number)
					.text("￥"+item.price));
	
			var imageTr=$("<tr></tr>").append(imageTd);
			var nameTr=$("<tr></tr>").append(nameTd);
			var priceTr=$("<tr></tr>").append(priceTd);
			var divTr=$("<div></div>").addClass("col-md-3").append(imageTr).append(nameTr).append(priceTr);
			divTr.appendTo("#commodit_tab");
		});
	}
	//解析分页信息
	function build_page_info(result) {
		$("#page_info_area").empty();
		var page = result.extend.pageInfo.pageNum;
		var pageNums = result.extend.pageInfo.pages;
		var total = result.extend.pageInfo.total;
		$("#page_info_area").append(
				"当前" + page + "页，共" + pageNums + "页，共" + total + "条记录");
		totalRecord=result.extend.pageInfo.total;
		currentPage=result.extend.pageInfo.pageNum;
	}
	//解析分页条
	function build_page_nav(result) {
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");

		//构建元素
		var firstpageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("首页"));
		var prepageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("&laquo;"));
		if (result.extend.pageInfo.hasPreviousPage == false) {
			firstpageLi.addClass("disabled");
			prepageLi.addClass("disabled");
		} else {
			//为元素添加点击翻页的事件
			firstpageLi.click(function() {
				to_page(1);
			});
			prepageLi.click(function() {
				to_page(result.extend.pageInfo.pageNum - 1);
			});
		}

		var nextpageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("&raquo;"));
		var lastpageLi = $("<li></li>").append(
				$("<a></a>").attr("href", "#").append("末页"));
		if (result.extend.pageInfo.hasNextPage == false) {
			nextpageLi.addClass("disabled");
			lastpageLi.addClass("disabled");
		} else {
			nextpageLi.click(function() {
				to_page(result.extend.pageInfo.pageNum + 1);
			});
			lastpageLi.click(function() {
				to_page(result.extend.pageInfo.pages);
			});
		}

		ul.append(firstpageLi).append(prepageLi);
		$.each(result.extend.pageInfo.navigatepageNums, function(index,
				item) {
			var numLi = $("<li></li>").append(
					$("<a></a>").attr("href", "#").append(item));
			if (result.extend.pageInfo.pageNum == item) {
				numLi.addClass("active");
			}
			numLi.click(function() {
				to_page(item);
			});
			ul.append(numLi);
		});
		ul.append(nextpageLi).append(lastpageLi);

		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	
</script>
</body>
</html>