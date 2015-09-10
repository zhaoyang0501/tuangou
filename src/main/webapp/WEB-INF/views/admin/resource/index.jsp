<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.resource.js"></script>
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
								<h3>资源管理</h3>
							</div>
							<div class="box well form-inline">
								<span>名称：</span>
								<input type="text" id="name" >
								
								<span>类别：</span>
								<select id="categoryId">
										<option value=""></option>
									<c:forEach items="${categorys }" var="bean">
										<option value="${bean.id }">${bean.name }</option>
									</c:forEach>
								</select>
								
								<a onclick="$.adminResource.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							
							<div class="widget-container">
								<table class="responsive table table-striped table-bordered"
									id="dt_resource_view">
									<thead>
										<tr>
											<th >id</th>
											<th >名称</th>
											<th >文件名</th>
											<th >描述</th>
											<th >分类</th>
											<th >上传者</th>
											<th >上传时间</th>
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
	<div class="modal hide fade" id="resource_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="resource_modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 200px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden" id="resourceId" value="">
							<div class="control-group">
								<label for="name" class="control-label">资源名称：</label>
								<div class="controls">
									<input type="text" id="resourceName" value="" placeholder="">
								</div>
							</div>
							
							<div class="control-group" id='control_project'>
								<label for="resourceCategoryId" class="control-label">分类：</label>
								<div class="controls">
									<select id='resourceCategoryId'>
											<option value=""></option>
									<c:forEach items="${categorys }" var="bean">
										<option value="${bean.id }">${bean.name }</option>
									</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="control-group" id='control_project'>
								<label for="resourceRemark" class="control-label">描述：</label>
								<div class="controls">
									<textarea id="resourceRemark" placeholder="" rows="3">
									</textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminResource.update()">保存</a>
			<a href="#"   class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>