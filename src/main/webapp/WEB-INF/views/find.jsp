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

          <h2 class="heading2"><span>商品分类</span></h2>
          <ul class="nav nav-list categories">
	          <c:forEach items="${categorys }" var="bean">
	           <li> <a href="gocategory?category.id=${bean.id }">${bean.name }</a> </li>
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
          <h1 class="heading1"><span class="maintext">${category.name }</span></h1>
          <ul class="thumbnails">
           <c:forEach items="${items}" var="bean">
				        <li class="span3">
				          <a class="prdocutname" href="product.html">${bean.name } </a>
				          <div class="thumbnail">
				            <span class="sale tooltip-test" data-original-title="">Sale</span>
				            <a href="${pageContext.request.contextPath}/detail?item.id=${bean.id}"><img alt="" src="${pageContext.request.contextPath}/upload/${bean.imgPath}"></a>
				           
				            <div class="pricetag">
				              <span class="spiral"></span><a href="${pageContext.request.contextPath}/goorder?item.id=${bean.id}" class="productcart">  立 即 购 买！</a>
				              <div class="price">
				                <div class="pricenew">¥${bean.price}</div>
				              </div>
				            </div>
				          </div>
				        </li>
			   </c:forEach>
			   </ul>
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