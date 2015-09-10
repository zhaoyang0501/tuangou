<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="validateLogin.jsp"%>
<!DOCTYPE html><html lang="en"><head>
<meta charset="utf-8">
<title>懒人坊</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="css/font.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/flexslider.css" type="text/css" media="screen" rel="stylesheet">
<link href="css/jquery.fancybox.css" rel="stylesheet">
<link href="css/cloud-zoom.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!-- fav -->
<link rel="shortcut icon" href="assets/ico/favicon.html">
</head>
<body>
<!-- Header Start -->
<%@include file="./head.jsp" %>
<!-- Header End -->

<div id="maincontainer">
  <section id="product">
    <div class="container">
      <div class="row" style="margin-top: 40px"> 
      <div class="span12">
       <h2 class="heading2" style="text-align: center;">${tip }</h2>
  <!-- left avatar -->
  <div class='row'>
  <div class="span12">
    <h1 class="page-title mb10">
   		   ${user.nickname }的厨房
    </h1>
    <!-- basic info -->
    </div>
  </div>
  <!-- middle info -->
</div>
      
             
      <div class="span12">
           <div id="categorymenu">
      <nav class="subnav">
        <ul class="nav-pills categorymenu">
		    <li><a href="${pageContext.request.contextPath}/centerCookBook">菜谱</a> </li> 
			 <li><a href="${pageContext.request.contextPath}/centerCollect">个人收藏</a></li> 
			  <li><a href="${pageContext.request.contextPath}/centerMsgBoard">留言板</a></li> 
			   <li><a href="${pageContext.request.contextPath}/centerInfo">个人信息设置</a>  </li> 
        </ul>
       </nav>
    </div>
        </div>
      
       </div>
    </div>
  </section>
</div>
<%@include file="./foot.jsp" %>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/respond.min.js"></script>
<script src="js/application.js"></script>
<script src="js/bootstrap-tooltip.js"></script>
<script defer="" src="js/jquery.fancybox.js"></script>
<script defer="" src="js/jquery.flexslider.js"></script>
<script type="text/javascript" src="js/jquery.tweet.js"></script>
<script src="js/cloud-zoom.1.0.2.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.carouFredSel-6.1.0-packed.js"></script>
<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="js/jquery.ba-throttle-debounce.min.js"></script>
<script defer="" src="js/custom.js"></script>

</body></html>