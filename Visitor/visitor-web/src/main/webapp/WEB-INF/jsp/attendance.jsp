<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
   <script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	 <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
   <script type="text/javascript" src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	
<style type="text/css">
.thistop {
	padding-left: 15px;
	padding-top: 9px;
}

</style>
	
	
	
	
	
</head>
<body>

<body style="text-align: center">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li><a href="#">我的考勤</a></li>
			<li class="active">我要请假</li>
		</ul>
	</div>
	<div class="content_wrap">
	<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">员工修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">empName</label>
		    <div class="col-sm-10">
		      	<p class="form-control-static" id="empName_update_static"></p>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">gender</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
				</label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-4">
		    	<!-- 部门提交部门id即可 -->
		      <select class="form-control" name="dId">
		      </select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>
	
	
	
	
	
	
	
		
		

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="用户名">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">用户编号</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="用户编号">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
                <label for="dtp_input2" class="col-sm-2 control-label">开始时间</label>
                <div class="input-group date form_date col-md-10" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input id="start_time" name="start_time" class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					          <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>

                <label for="dtp_input1" class="col-sm-2 control-label">结束时间</label>
                <div class="input-group date form_date col-md-10" data-date="" data-date-format="" data-link-field="dtp_input1" data-link-format="yyyy-mm-dd">
                    <input id="start_time" name="start_time" class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" />
                 <input type="hidden" id="dtp_input1" value="" />
            </div>
		  
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
		
		
		
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
			<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>员工编号</th>
							<th>员工姓名</th>
							<th>日期</th>
							<th>上班打卡时间</th>
							<th>下班打卡时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>

		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
		
	</div>
	
	</div>
	</div>
	<script type="text/javascript">
	
	var totalRecord,currentPage;
	//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
	$(function(){
		//去首页
		to_page(1);
	});
	
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH}/emps",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示员工数据
				build_emps_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});
	}
	
	function build_emps_table(result){
		//清空table表格
		$("#emps_table tbody").empty();
		var emps = result.extend.pageInfo.list;
		$.each(emps,function(index,item){
			var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
			var attId = $("<td></td>").append(item.attId );
			var attUid = $("<td></td>").append(item.attUid);
			var attUsername = $("<td></td>").append(item.attUsername);
			var attDate= $("<td></td>").append(getHoursTime(item.attDate));
			var attWorkdate= $("<td></td>").append(getHoursTime(item.attWorkdate));
			var attLeavedate= $("<td></td>").append(getHoursTime(item.attLeavedate));
			
			
			/**
			<button class="">
								<span class="" aria-hidden="true"></span>
								编辑
							</button>
			*/
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前员工id
			editBtn.attr("edit-id",item.attId );
			var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			//为删除按钮添加一个自定义的属性来表示当前删除的员工id
			delBtn.attr("del-id",item.attId);
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			//var delBtn = 
			//append方法执行完成以后还是返回原来的元素
			$("<tr></tr>").append(checkBoxTd)
				.append(attId)
				.append(attUid)
				.append(attUsername)
				.append(attDate)
				.append(attWorkdate)
				.append(attLeavedate)
				.append(btnTd)
				.appendTo("#emps_table tbody");
		});
	}
	//解析显示分页信息
	function build_page_info(result){
		$("#page_info_area").empty();
		$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
				result.extend.pageInfo.pages+"页,总"+
				result.extend.pageInfo.total+"条记录");
		totalRecord = result.extend.pageInfo.total;
		currentPage = result.extend.pageInfo.pageNum;
	}
	//解析显示分页条，点击分页要能去下一页....
	function build_page_nav(result){
		//page_nav_area
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");
		
		//构建元素
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.extend.pageInfo.hasPreviousPage == false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//为元素添加点击翻页的事件
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum -1);
			});
		}
		
		
		
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(result.extend.pageInfo.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum +1);
			});
			lastPageLi.click(function(){
				to_page(result.extend.pageInfo.pages);
			});
		}
		
		
		
		//添加首页和前一页 的提示
		ul.append(firstPageLi).append(prePageLi);
		//1,2，3遍历给ul中添加页码提示
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(result.extend.pageInfo.pageNum == item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		//添加下一页和末页 的提示
		ul.append(nextPageLi).append(lastPageLi);
		
		//把ul加入到nav
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	
	

	//清空表单样式及内容
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}
	
	
	
	
	
	
	//点击新增按钮弹出模态框。
	$("#emp_add_modal_btn").click(function(){
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#empAddModal form");
		//s$("")[0].reset();
		//发送ajax请求，查出部门信息，显示在下拉列表中
		getDepts("#empAddModal select");
		//弹出模态框
		$("#empAddModal").modal({
			backdrop:"static"
		});
	});
	

	//查出所有的部门信息并显示在下拉列表中
	function getDepts(ele){
		//清空之前下拉列表的值
		$(ele).empty();
		$.ajax({
			url:"${APP_PATH}/depts",
			type:"GET",
			success:function(result){
				//{"code":100,"msg":"处理成功！",
					//"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
				//console.log(result);
				//显示部门信息在下拉列表中
				//$("#empAddModal select").append("")
				$.each(result.extend.depts,function(){
					var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
					optionEle.appendTo(ele);
				});
			}
		});
		
	}
	
	$(document).on("click",".edit_btn",function(){
		//alert("edit");
		
		
			//1、查出部门信息，并显示部门列表
		getDepts("#empUpdateModal select");
		//2、查出员工信息，显示员工信息
		getEmp($(this).attr("edit-id"));
		
		//3、把员工的id传递给模态框的更新按钮
		$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
		$("#empUpdateModal").modal({
			backdrop:"static"
		});
	});
	
	function getEmp(id){
		$.ajax({
			url:"${APP_PATH}/emp/"+id,
			type:"GET",
			success:function(result){
				//console.log(result);
				var empData = result.extend.emp;
				$("#empName_update_static").text(empData.empName);
				$("#email_update_input").val(empData.email);
				$("#empUpdateModal input[name=gender]").val([empData.gender]);
				$("#empUpdateModal select").val([empData.dId]);
			}
		});
	}
	
	//点击更新，更新员工信息
	$("#emp_update_btn").click(function(){
	
	
		//2、发送ajax请求保存更新的员工数据
		$.ajax({
			url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#empUpdateModal form").serialize(),
			success:function(result){
				//alert(result.msg);
				//1、关闭对话框
				$("#empUpdateModal").modal("hide");
				//2、回到本页面
				to_page(currentPage);
			}
		});
	});
	
	//单个删除
	$(document).on("click",".delete_btn",function(){
		//1、弹出是否确认删除对话框
		var empName = $(this).parents("tr").find("td:eq(2)").text();
		var empId = $(this).attr("del-id");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		if(confirm("确认删除【"+empName+"】吗？")){
			//确认，发送ajax请求删除即可
			$.ajax({
				url:"${APP_PATH}/emp/"+empId,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					//回到本页
					to_page(currentPage);
				}
			});
		}
	});
	//完成全选/全不选功能
	$("#check_all").click(function(){
		//attr获取checked是undefined;
		//我们这些dom原生的属性；attr获取自定义属性的值；
		//prop修改和读取dom原生属性的值
		$(".check_item").prop("checked",$(this).prop("checked"));
	});
	
	//check_item
	$(document).on("click",".check_item",function(){
		//判断当前选择中的元素是否5个
		var flag = $(".check_item:checked").length==$(".check_item").length;
		$("#check_all").prop("checked",flag);
	});
	
	//点击全部删除，就批量删除
	$("#emp_delete_all_btn").click(function(){
		//
		var empNames = "";
		var del_idstr = "";
		$.each($(".check_item:checked"),function(){
			//this
			empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
			//组装员工id字符串
			del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		//去除empNames多余的,
		empNames = empNames.substring(0, empNames.length-1);
		//去除删除的id多余的-
		del_idstr = del_idstr.substring(0, del_idstr.length-1);
		if(confirm("确认删除【"+empNames+"】吗？")){
			//发送ajax请求删除
			$.ajax({
				url:"${APP_PATH}/emp/"+del_idstr,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					//回到当前页面
					to_page(currentPage);
				}
			});
		}
	});
	 $('.form_date').datetimepicker({
	        language: 'zh-CN',
	        weekStart: 1,
	        todayBtn: 1,
	        autoclose: 1,
	        todayHighlight: 1,
	        startView: 2,
	        minView: 2,
	        forceParse: 0
	    });

	 function getHoursTime(date) {
		    if(date==""){return null}
		    var newDate = new Date(date);
		    var year = newDate.getFullYear();
		    var month = newDate.getMonth() + 1;
		    var day = newDate.getDate();
		    var  hours=newDate.getHours();
		    var  minute=newDate.getMinutes();
		    var  seconds=newDate.getSeconds();
		    return year + "-" + month + "-" + day+":"+hours+":"+minute+":"+seconds;
		  }

	
		</script>
</body>
</html>