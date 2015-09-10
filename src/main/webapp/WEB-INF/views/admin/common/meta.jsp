<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<base
	href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/admin/">
	<meta charset="utf-8">
	<title></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Admin Panel Template">
	<meta name="author" content="caowei panzhaoyang">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<!--fav and touch icons -->
	<link rel="shortcut icon" href="ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/admin/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/admin/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/admin/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/admin/ico/apple-touch-icon-57-precomposed.png">
	
	<link href="${pageContext.request.contextPath}/admin/css/bootstrap.css" rel="stylesheet">
	<!-- 图标字体http://fontawesome.io/  -->
	<link href="${pageContext.request.contextPath}/admin/css/font-awesome.css" rel="stylesheet">
	<!--  falgun框架样式 -->
	<link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/admin/css/theme-default.css" rel="stylesheet">
	<!--[if IE 7]>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/font-awesome-ie7.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/ie/ie7.css" />
	<![endif]-->
	<!--[if IE 8]>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/ie/ie8.css" />
	<![endif]-->
	<!--[if IE 9]>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/ie/ie9.css" />
	<![endif]-->
	
	<script src="${pageContext.request.contextPath}/admin/js/falgun/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap.min.js"></script>
	<!-- DataTables http://www.datatables.net/  -->
	<script src="${pageContext.request.contextPath}/admin/js/falgun/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/falgun/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/falgun/TableTools.min.js"></script>
	<!-- 浏览器兼容性 -->
	<script src="${pageContext.request.contextPath}/admin/js/falgun/excanvas.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/falgun/modernizr-transitions.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/falgun/respond.min.js"></script>
	<!-- falgun -->
	<script src="${pageContext.request.contextPath}/admin/js/falgun/custom.js"></script>
	<!-- 消息提示 -->
	<script src="${pageContext.request.contextPath}/admin/js/noty/packaged/jquery.noty.packaged.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/falgun/bootstrap-tooltip.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/ace.js"></script>
	<script type="text/javascript">
	$(function(){
		$.ace.setContextPath('${pageContext.request.contextPath}');
		//菜单选中与否
		$('.accordion-nav a').each(function() {
	        var thisHref = $(this).attr('href')
	        if ((window.location.pathname.indexOf(thisHref) == 0) || (window.location.pathname.indexOf('/' + thisHref) == 0)) {
	        	$(".left-nav .active").removeClass("active");
	        	$("a[href=#"+$(this).parents('div').attr("id")+"]").parent("li").addClass("active");
	            $(this).parent('li').addClass("active").parent('ul').addClass("active").parent("div").addClass("active");
	       
	    }
	    });
	});
	</script>
	
	