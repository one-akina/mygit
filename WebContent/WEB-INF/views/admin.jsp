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
<title>商品管理</title>
</head>
<body>

<!-- 信息修改的模态框 -->
	<div class="modal fade" id="modUpdataModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">信息更新</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control"
									id="name_update_input" placeholder="name">
									<span class="help-block"></span>								
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">生产日期</label>
							<div class="col-sm-3">
								<select class="form-control" name="year" id="year_update_select">								
								</select>
							</div>
							<div class="col-sm-3">
								<select class="form-control" name="month" id="month_update_select">								
								</select>
							</div>
							<div class="col-sm-3">
								<select class="form-control" name="day" id="day_update_select">								
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">价格</label>
							<div class="col-sm-10" id="price_update_input">
								
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">图片</label>
							<div class="col-sm-10" id="photo_update_input">
								<input type="file" name="photo">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">商品简介</label>
							<div class="col-sm-10">
								<input name="intro" type="text">
							</div>
						</div>
						</form>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="mod_updata_btn">保存更新</button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 新品添加的模态框 -->
	<div class="modal fade" id="modAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新品上架</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="Add_form" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control"
									id="name_add_input" placeholder="name">
									<span class="help-block"></span>								
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">生产日期</label>
							<div class="col-sm-3">
								<select class="form-control" name="year" id="year_add_select">								
								</select>
							</div>
							<div class="col-sm-3">
								<select class="form-control" name="month" id="month_add_select">								
								</select>
							</div>
							<div class="col-sm-3">
								<select class="form-control" name="day" id="day_add_select">								
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">价格</label>
							<div class="col-sm-10">
								<input type="text" name="price" id="price_add_input">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">图片</label>
							<div class="col-sm-10">
								<input name="photo" type="file">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">商品简介</label>
							<div class="col-sm-10">
								<input name="intro" type="text">
							</div>
						</div>
						</form>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="mod_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
  		<div class="row">
			<div class="col-md-12">
				<h1>店铺商品管理</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-4 col-md-offset-9">
				<button class="btn btn-primary" id="mod_add_modal_input">上新</button>
				<button class="btn btn-danger" id="mod_delete_modal_input">下架</button>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<table class=" table table-hover" id="commodit_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>商品编号</th>
							<th>品名</th>
							<th>生产日期</th>
							<th>价格</th>
							<th>商品图片</th>
							<th>商品简介</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<script type="text/javascript">
	$(function() {
		to_page(1);
	});
		function to_page(pageNum){
			$.ajax({
				url:"${APP_PATH}/mods",
				data:"pageNum="+pageNum,
				type:"GET",
				success:function(result){
					build_mods_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			})
		}
		function build_mods_table(result) {
		//清空表格
		$("#commodit_table tbody").empty();
		var mod = result.extend.pageInfo.list;
		$.each(mod, function(index, item) {
			
			var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
			var modIdTd = $("<td></td>").append(item.number);
			var modNameTd = $("<td></td>").append(item.name);
			var dateTd = $("<td></td>").append(item.date);
			var priceTd = $("<td></td>").append("￥"+item.price);
			var photoTd = $("<td></td>").append(item.photo);
			var introTd	= $("<td></td>").append(item.intro);
			var editBtn = $("<button></button>").addClass(
					"btn btn-primary btn-sm edit_btn").append(
					$("<span></span>").addClass(
							"glyphicon glyphicon-pencil")).append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前员工id
			editBtn.attr("edit-id",item.number);
			var delBtn = $("<button></button>").addClass(
					"btn btn-danger btn-sm delete_btn").append(
					$("<span></span>")
							.addClass("glyphicon glyphicon-trash")).append(
					"下架");
			delBtn.attr("del-id",item.number)
			var btnTd = $("<td></td>").append(editBtn).append("&nbsp;")
					.append(delBtn);

			$("<tr></tr>").append(checkBoxTd).append(modIdTd).append(modNameTd).append(
					dateTd).append(priceTd).append(photoTd).append(
							introTd).append(editBtn).append(delBtn).appendTo("#commodit_table tbody");
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
		
		//清空表单样式及内容
		function reset_form(ele){
			//$(ele)[0].reset();
			//清空样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//点击上架按钮弹出模态框
			$("#mod_add_modal_input").click(function() {
				//清除表单数据
				reset_form("#modAddModal form");
				var yearM=[];
				var monthM=[];
				var dayM=[];
				var i=2000;
					for(var j=1;j<=20;j++){	
						yearM[j]=i;
						i++;
					}
				for(var i=1;i<=12;i++){
					monthM[i]=i;
				}
				for(var i=1;i<=31;i++){
					dayM[i]=i;
				}
				$.each(yearM,function(){
					if(this==2000){
						$("<option selected='selected'></option>").append(this).appendTo("#year_add_select");
					}else{
					$("<option></option>").append(this).appendTo("#year_add_select");
					}
				});
				$.each(monthM,function(){
					if(this==1){
						$("<option selected='selected'></option>").append(this).appendTo("#month_add_select");
					}else{
					$("<option></option>").append(this).appendTo("#month_add_select");
					}
				});
				$.each(dayM,function(){
					if(this==1){
						$("<option selected='selected'></option>").append(this).appendTo("#day_add_select");
					}else{
					$("<option></option>").append(this).appendTo("#day_add_select");
					}
				});
				//弹出模态框
				$("#modAddModal").modal({
					backdrop : "static"
				});
			});
		
			$(document).on("click",".edit_btn",function(){
				//getDepts("#modUpdataModal select");
				getMod($(this).attr("edit-id"));
				$("#mod_updata_btn").attr("edit-id",$(this).attr("edit-id"));
				$("#modUpdataModal").modal({
					backdrop : "static"
				});
			});
			//更新模态框日期构造
			function date_select_bulid(result){
				var yearM=[];
				var monthM=[];
				var dayM=[];
				var i=2000;
				for(var j=1;j<=20;j++){	
					yearM[j]=i;
					i++;
				}
				for(var i=1;i<=12;i++){
					monthM[i]=i;
				}
				for(var i=1;i<=31;i++){
					dayM[i]=i;
				}
				var dates=[];
				dates=result.extend.mod.date.split("-") ;
				var year=parseInt(dates[0]);
				var month=parseInt(dates[1]);
				var day=parseInt(dates[2]);
				$("<option selected='selected'></option>").append(year).appendTo("#year_update_select");
				$.each(yearM,function(){
					$("<option></option>").append(this).appendTo("#year_update_select");
				});
				$("<option selected='selected'></option>").append(month).appendTo("#month_update_select");
				$.each(monthM,function(){
					$("<option></option>").append(this).appendTo("#month_update_select");
				});
				$("<option selected='selected'></option>").append(day).appendTo("#day_update_select");
				$.each(dayM,function(){
					$("<option></option>").append(this).appendTo("#day_update_select");
				});
			}
			//点击更新，更新员工信息
			$("#mod_updata_btn").click(function(){
		
				//发送ajax更新数据
				$.ajax({
					url:"${APP_PATH}/update/"+$(this).attr("edit-id"),
					type:"POST",
					data:$("#modUpdataModal form").serialize()+"&_method=PUT",
					success:function(result){
						alert(result.msg);
						$("#modUpdataModal").modal("hide");
						to_page(1);
					}
				})
					
			})
			//上新
			$("#mod_save_btn").click(function(){
			var formdata=new FormData($("#Add_form")[0]);
				//发送ajax更新数据
				$.ajax({
					url:"${APP_PATH}/addCom",
					type:"POST",
					data:formdata,
					cache:false,
					processData:false,
					contentType:false,
					success:function(result){
						alert(result.msg);
						$("#modAddModal").modal("hide");
						to_page(1);
					}
				})
					
			})
			
			function getMod(id){
				$.ajax({
					url:"${APP_PATH}/mod/"+id,
					type:"GET",
					success:function(result){
						var modData=result.extend.mod;
						
						$("#name_update_input").text(modData.name);
						date_select_bulid(result);
						$("#price_update_input").attr("name","price").text("￥"+modData.price);
						$("#photo_update_input").text(modData.photo);
						$("#intro_update_input").text(modData.intro);
					}
				});
			}
			//全选/全不选
			$("#check_all").click(function(){
				$(this).prop("checked");
				$(".check_item").prop("checked",$(this).prop("checked"));
			});
			
			$(document).on("click",".check_item",function(){
				var flag=$(".check_item:checked").length==$(".check_item").length;
				$("#check_all").prop("checked",flag);
			})
			
			$(document).on("click",".delete_btn",function(){
			var name=$(this).parents("tr").find("td:eq(2)").text();
			var number=$(this).attr("del-id");
			if(confirm("确认删除【"+name+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/del/"+number,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(1);
					}
				})
			}
		})
	</script>
</body>
</html>