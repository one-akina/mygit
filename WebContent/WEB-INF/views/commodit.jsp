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
body {
	margin: 150px 150px;
}

img {
	width: 200px;
	height: 250px;
	float: left;
}

p {
	font: "宋体" bold 20px;
}
</style>
<title>商品详情</title>
</head>
<body>
<div class="container-fluid">
		<div class="row" id="row1">
			<div class="col-xs-8">
				<label></label>
			</div>

			<div class="col-xs-4">
				<div class="btn-toolbar">
					<div class="btn-group">
						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							我的淘宝 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">已买到的宝贝</a></li>
							<li><a href="#">已卖出的宝贝</a></li>
						</ul>
					</div>
					<div class="btn-group">
						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>收藏夹
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">收藏的宝贝</a></li>
							<li><a href="#">收藏的店铺</a></li>
						</ul>
					</div>
					<div class="btn-group">
						<button type="button"
							class="btn btn-default btn-xs dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="glyphicon glyphicon-list" aria-hidden="true">服务指南</span>
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">帮助中心</a></li>
							<li><a href="#">品质保障 </a></li>
							<li><a href="#">特色服务</a></li>
							<li><a href="#">7天退换货</a></li>
						</ul>
					</div>
					<a href="${APP_PATH }/Ntamll">淘宝首页</a>
				</div>
			</div>
		</div>
	</div>
	<div id="b">
	
	</div>
		
	<div id="s">
		<button class="btn btn-primary" id="AddShopBus">加入购物车</button>
		<button class="btn btn-danger">直接购买</button>
	</div>
	<script type="text/javascript">
	var number = getQueryString("number");
		$(function() {
			view();
		})
		function view() {
			
			$.ajax({
				url : "${APP_PATH}/commoditview",
				data : "number=" + number,
				type : "GET",
				success : function(result) {
					build_commodt(result);
				}
			})
		}
		function build_commodt(result) {
			$("#b").empty();
			var com = result.extend.mod;
			var Cimg = $("<img>").attr("alt", com.name).attr("src",
					"${APP_PATH}/images/" + com.photo);
			var Cintro = $("<p></p>").text(com.intro);
			var Cdate = $("<p></p>").text(com.date);
			var Cname = $("<p></p>").text(com.name);
			var Cprice = $("<p></p>").text("￥" + com.price);
			var C = $("<div></div>").addClass("C").append(Cimg).append(Cintro)
					.append(Cdate).append(Cname).append(Cprice);
			C.appendTo("#b");
		}

		function getQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return unescape(r[2]);
			return null;
		}
		
		$("#AddShopBus").click(function(){
			var number = getQueryString("number");
			$.ajax({
				url:"${APP_PATH}/addshopbus/"+ number,
				type:"POST",
				success:function(result){
					alert(result.msg);
				}
			})
		})
	</script>
</body>
</html>