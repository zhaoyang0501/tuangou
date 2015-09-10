<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">
<head>
<title></title>

<%@ include file="common/meta.jsp"%>

</head>
<body>
<div class="layout">
	<div class="container" style="margin-top:100px">
		<div class="span12 login-header">
		<h4 style="color:red; text-align: center;">${tip }</h4>
		<h1 style="text-align: center;">欢迎登录懒人坊管理系统后台</h1>
		</div>
		<form  style=" margin-top:100px; border: 1px solid #115928;" class="form-signin-ribbon" action="${pageContext.request.contextPath}/admin/gologin" method="post">
				<div class="content">
					<div class="controls input-icon">
						<i class=" icon-user-md"></i>
						<input type="text" id="username"  name="userName" class="input-block-level" data-placeholder="用户名">
					</div>
					<div class="controls input-icon">
						<i class=" icon-key"></i><input type="password" id="password" name="password" class="input-block-level" data-placeholder="密码">
					</div>
					<div class="input-prepend">
					<label class="remember" for="remember"><input type="checkbox" id="_spring_security_remember_me" name="_spring_security_remember_me" checked="true"/>记住我</label>
					</div>
					<button class="btn btn-block" type="submit">登 陆</button>
				</div>
		</form>
	</div>
</div>
</body>
</html>