<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
if(request.getSession().getAttribute("user")==null)
response.sendRedirect("login");
%>  
