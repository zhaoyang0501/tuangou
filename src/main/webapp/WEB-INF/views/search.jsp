<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<style type="text/css">
.flex-control-nav{
left: 0px;
}
</style>
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
      <div class="row">        
        <!-- Sidebar Start-->
        <aside class="span3">
          <!-- Category-->

          <h2 class="heading2"><span>菜谱分类</span></h2>
          <ul class="nav nav-list categories">
	          <c:forEach items="${categorys }" var="bean">
	           <li> <a href="find?category.id=${bean.id }">${bean.name }</a> </li>
	          </c:forEach>
          </ul>
              <!--  Best Seller -->  
          
            <!-- Latest Product -->  
          
            <!--  Must have -->  
          
        </aside>
        <!-- Sidebar End-->
        <!-- Category-->

        <div class="span9"> 
		    
          <!-- Category Products-->
          <section id="category">
            <div class="row">
              <div class="span9">

                <div class="row">
        <section id="featured" class="row mt40">
          <h1 class="heading1"><span class="maintext">"${key}"相关的菜谱</span></h1>
          <ul class="thumbnails">
           <c:forEach items="${cookBooks}" var="bean">
		          	<li class="span3">
		              <div class="">
			              <a href="${pageContext.request.contextPath}/detail?cookBook.id=${bean.id}" ><img alt="" style="min-width: 270px;" src="${pageContext.request.contextPath}/upload/${bean.imgPath}">
			              <span class="viewfancypopup">&nbsp;</span><span class="viewfancypopup">&nbsp;</span><span class="viewfancypopup">&nbsp;</span></a>
			              <div class="caption">
				                <a href="${pageContext.request.contextPath}/detail?cookBook.id=${bean.id}" class="bloggridtitle">${bean.name } </a>               
				                <div class="author">上传 : <a href="#"> ${bean.user.nickname }</a>
				                </div>
				                <div>
				                      <span class="mr10"><i class="icon-calendar"></i> ${bean.createDate } </span>
				                      <span class="mr10"><a href="#"><i class="icon-comment"></i> 评分：${bean.score }</a> </span><br>
				                </div>
			              </div>
		              </div>
		            </li>
		    </c:forEach>
        </section>
      </div>
                  <!-- Category-->

                
              </div>
            </div>
          </section>
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