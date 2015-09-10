<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ch">
<%@ include file="../common/meta.jsp"%>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace/admin.seller.js"></script>
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
		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<div class="content-widgets light-gray">
							<div class="widget-head  bondi-blue" >
								<h3>供应商管理</h3>
							</div>
							<div class="box well form-inline">
								<span>供应商名称：</span>
								<input type="text" id="seller_name" >
								<a onclick="$.adminSeller.initSearchDataTable()"
									class="btn btn-info" data-loading-text="正在加载..."><i class="icon-search"></i>查询</a>
							</div>
							<div class="widget-container">
								
									<a class="btn btn-success" style="float: right; margin: 5px;" onclick="$.adminSeller.showaddModal()"><i class="icon-plus"></i> 新增</a>
								<table class="responsive table table-striped table-bordered"
									id="dt_seller_view">
									<thead>
										<tr>
											<th >id</th>
											<th >名称</th>
											<th >地址</th>
											<th >电话</th>
											<th >联系人</th>
											<th >备注</th>
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
	<div class="modal hide fade" id="seller_modal">
		<div class="modal-header blue">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<label id="seller_modal_header_label"></label>
		</div>
		<div class="modal-body" style="min-height: 200px;">
			<div class="row-fluid">
				<div class="span12">
					<div class="form-container grid-form form-background left-align form-horizontal">
						<form action="" method="get" id=''>
							<input type="hidden" id="sellerId" value="">
							<div class="control-group">
								<label for="name" class="control-label">供应商名称：</label>
								<div class="controls">
									<input type="text" id="name" placeholder="">
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">供应商地址：</label>
								<div class="controls">
									<input type="text" id="addr" placeholder="">
								</div>
							</div>
							
							<div class="control-group">
								<label for="name" class="control-label">供应商电话：</label>
								<div class="controls">
									<input type="text" id="tel" placeholder="">
								</div>
							</div>
							<div class="control-group">
								<label for="name" class="control-label">供应商联系人：</label>
								<div class="controls">
									<input type="text" id="userName" placeholder="">
								</div>
							</div>
							
							<div class="control-group" id='control_project'>
								<label for="remark" class="control-label">备注：</label>
								<div class="controls">
									<textarea id="detail" placeholder="" rows="3">
									</textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal-footer center" id="div_footer">
			<a class="btn btn-primary" onclick="$.adminSeller.save()">保存</a>
			<a href="#" class="btn" data-dismiss="modal" id="closeViewModal">关闭</a>
		</div>
	</div>
</body>
</html>