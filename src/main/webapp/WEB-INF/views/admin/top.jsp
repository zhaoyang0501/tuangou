<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%
if(request.getSession().getAttribute("adminuser")==null)
response.sendRedirect("../../admin/login");
%>  


<div class="navbar navbar-inverse top-nav">
		<div class="navbar-inner">
			<div class="container">
				<span class="home-link"></span>
				<div class="btn-toolbar pull-right notification-nav">
				</div>
			</div>
		</div>
	</div>