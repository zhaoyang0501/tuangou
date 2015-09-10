<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<ul class="breadcrumb">
		<li><a href="#" class="icon-home"></a></li>
		<c:forEach var="crumb" items="${breadcrumb }">
			<li><span class="divider "><i class="icon-angle-right"></i></span><a
				href="${pageContext.request.contextPath}/${crumb.url}">${crumb.name}</a>
			</li>
		</c:forEach>
	</ul>
</div>