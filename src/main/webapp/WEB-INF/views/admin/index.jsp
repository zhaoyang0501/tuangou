<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">
<head>
<%@ include file="common/meta.jsp"%>
<link href="${pageContext.request.contextPath}/admin/css/fullcalendar.css" rel= "stylesheet">
<script src="${pageContext.request.contextPath}/admin/js/falgun/fullcalendar.min.js"></script>

<link>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : $.ims.getContextPath() + "/getDailyReportToApproveCount",
			dataType : "json",
			success : function(json) {
				if (json.state)
					$("#count_dailyReport").html(json.count);
			}
		});

		$.ajax({
			type : "GET",
			url : $.ims.getContextPath() + "/getRemoteNews/1",
			dataType : "json",
			success : function(result) {
				$("#book_manage_ui").empty();
				$.each(result.news, function(i, n) {
					$("#book_manage_ui").append(
							"<li ><i  class='icon-hand-right'></i><a href='"+n.url+"' >"
									+ n.title + "</a></li>");
				});
			}
		});
		$.ajax({
			type : "GET",
			url : $.ims.getContextPath() + "/getRemoteNews/2",
			dataType : "json",
			success : function(result) {
				$("#discuzz_ui").empty();
				$.each(result.news, function(i, n) {
					$("#discuzz_ui").append(
							"<li ><a href='"+n.url+"'><h5>"+ n.title + "</h5></a></li>");
				});
			}
		});
	});
</script>
</head>
<body>
	<div class="layout">
		<!-- Navbar
    ================================================== -->
		<!-- top -->
		<%@ include file="top.jsp"%>

		<!-- 导航 -->
		<%@ include file="menu.jsp"%>
		<div class="main-wrapper">
			<div class="container-fluid">
				<div class="row-fluid ">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="#" class="icon-home"></a></li>
						</ul>
						<h1 style="text-align: center;"> 欢迎使用本系统</h1>
					</div>
				</div>
				
			</div>
		</div>
		<!-- foot -->
		<%@ include file="foot.jsp"%>
	</div>

</body>
</html>