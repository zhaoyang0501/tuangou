<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.adminuser.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".date").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
	        format:'yyyy-mm-dd',
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	    });
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- top -->
		<%@ include file="../top.jsp"%>
		<!-- 导航 -->
		<%@ include file="../menu.jsp"%>
		
		<input type="hidden" id="hf_id" />

		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>权限管理</h3>
							</div>
							<div class="box well form-inline">
								<span>用户名：</span>
								<input type="text" id="adminuser_name" >
								<a onclick="$.adminAdminuser.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminAdminuser.showaddModal()"><i class="icon-plus"></i> 新增</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_adminuser_view">
									<thead>
										<tr>
											<th >id</th>
											<th >用户名</th>
											<th >密码</th>
											<th >备注</th>
											<th >用户管理权限</th>
											<th >分类管理权限</th>
											<th >供应商管理权限</th>
											<th >商品管理权限</th>
											<th >订单管理权限</th>
											<th >权限管理权限</th>
											<th >操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</div>

	<!-- 编辑新增弹出框 -->
	<div class="modal hide fade" id="adminuser_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="adminuser_modal_header_label">权限设置</label>
		</div>
		<div class="modal-body" style="min-height: 200px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
						
							<input type="hidden" id="adminuserId" value="">
							<div class="control-group">
								<label for="name" class="control-label">用户名：</label>
								<div class="controls">
									<input type="text" id="name" placeholder="">
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">密码：</label>
								<div class="controls">
									<input type="text" id="password" placeholder="">
								</div>
							</div>
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">备注：</label>
								<div class="controls">
									<textarea id="remark" placeholder="" rows="3">
									</textarea>
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">用户管理权限：</label>
								<div class="controls">
									<label><input id="role1" type="checkbox"  value="yes" />用户管理权限： </label> 
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">分类管理权限：</label>
								<div class="controls">
									<label><input id="role2" type="checkbox" value="yes" />分类管理权限： </label> 
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">供应商管理权限：</label>
								<div class="controls">
									<label><input id="role3" type="checkbox" value="yes" />供应商管理权限： </label> 
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">商品管理权限：</label>
								<div class="controls">
									<label><input id="role4" type="checkbox" value="yes" />商品管理权限： </label> 
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">订单管理权限：</label>
								<div class="controls">
									<label><input id="role5" type="checkbox" value="yes" />订单管理权限： </label> 
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">权限管理权限：</label>
								<div class="controls">
									<label><input id="role5" type="checkbox" value="yes" />权限管理权限： </label> 
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminAdminuser.save()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>