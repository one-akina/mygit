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
	margin: 0 100px;
}
</style>
<title>购物车管理</title>
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
	<div class="row" id="row1">
		<div class="col-md-4">
			<label>你可以在这整理你的购物车了</label>
		</div>
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control"
						aria-describedby="sizing-addon1" placeholder="请输入你要找的关键字" />
				</div>
				<button type="submit" class="btn btn-default" id="sizing-addon1">搜索</button>
			</form>
		</div>
	</div>

	<div class="row">
			<div class="col-md-12">
				<table class=" table table-hover" id="shopbus_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>全选
							</th>
							<th>商品信息</th>
							<th>分类</th>
							<th>数量</th>
							<th>价格</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<script type="text/javascript">
		$(function() {
			view_shopbus_table();
		})
			function view_shopbus_table(){
				$.ajax({
					url:"${APP_PATH}/shopbusview",
					type:"GET",
					success:function(result){
						build_shopbus_table(result);
					}
				})
			}
			function build_shopbus_table(result){
				$("#shopbus_table tbody").empty();
				var mod = result.extend.ShopBusInfo;
				$.each(mod, function(index, item) {
					
					var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
					var modNameTd = $("<td></td>").append(item.commodit.photo).append(item.commodit.name);
					var shopTd=$("<td></td>").append(item.commodit.shopnum);
					var totalTd=$("<td></td>").append(item.total);
					var priceTd = $("<td></td>").append("￥"+item.commodit.price);
					var editBtn = $("<button></button>").addClass(
							"btn btn-primary btn-sm edit_btn").append(
							$("<span></span>").addClass(
									"glyphicon glyphicon-folder-open")).append("移入收藏夹");
					//为编辑按钮添加一个自定义的属性，来表示当前员工id
					editBtn.attr("edit-id",item.number);
					var delBtn = $("<button></button>").addClass(
							"btn btn-danger btn-sm delete_btn").append(
							$("<span></span>")
									.addClass("glyphicon glyphicon-trash")).append(
							"删除");
					delBtn.attr("del-id",item.number)
					var btnTd = $("<td></td>").append(editBtn).append("&nbsp;")
							.append(delBtn);

					$("<tr></tr>").append(checkBoxTd).append(modNameTd).append(shopTd).append(totalTd).append(priceTd)
					.append(editBtn).append(delBtn).appendTo("#shopbus_table tbody");
				});
			}
			//删除操作
			$(document).on("click",".delete_btn",function(){
				var name=$(this).parents("tr").find("td:eq(2)").text();
				var number=$(this).attr("del-id");
				if(confirm("确认删除【"+name+"】吗？")){
					$.ajax({
						url:"${APP_PATH}/delshopbuscom/"+number,
						type:"DELETE",
						success:function(result){
							alert(result.msg);
						}
					})
				}
			})
		</script>
</body>
</html>