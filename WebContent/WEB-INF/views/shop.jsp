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
	</style>
<title>分类商品</title>
</head>
<body>
<div class="container-fluid">
  <div class="row" id="row1">
 	 <div class="col-xs-8">		
 	 	<label>=￣ω￣=喵，欢迎来到我的天猫</label>
		<c:if test="${sessionScope.user !=null}">
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
			<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>购物车</a>
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
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" aria-describedby="sizing-addon1" placeholder="请输入你要找的关键字"/>
				</div>
				<button type="submit" class="btn btn-default" id="sizing-addon1">搜索</button>
			</form>
		</div>
</div>
<div>
	<div>
		<table id="commodit_tab">
			
		</table>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		view();
	})
	function view(){
		var shopnum = getQueryString("shopnum");
		$.ajax({
			url:"${APP_PATH}/shopview",
			data:"shopnum="+shopnum,
			type:"GET",
			success:function(result){
				build_commodt(result);
			}
		})
	}
	function build_commodt(result){
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
	
	
function getQueryString(name) {  
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");  
    var r = window.location.search.substr(1).match(reg);  
    if (r != null) return unescape(r[2]); return null;  
}  
</script>
</body>
</html>