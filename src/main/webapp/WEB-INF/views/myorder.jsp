<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html><html lang="en"><head>
<meta charset="utf-8">
<title>一起购吧！</title>
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
      <h2 class="heading2" style="text-align: center;">${tip }</h2>
      <input type="hidden" name='order.item.id' value="${item.id }">
      <h1 class="heading1"><span class="maintext"> 我的订单</span><span class="subtext">所有订单</span></h1>
      <!-- Cart-->
      <div class="cart-info">
        <table class="table table-striped table-bordered">
          <tbody><tr>
           <th class="image">流水号</th>
            <th class="image">图片</th>
            <th class="name">商品名称</th>
            <th class="quantity">数量</th>
             <th class="price">单价</th>
            <th class="total">总价</th>
             <th class="quantity">下单日期</th>
              <th class="quantity">付款方式</th>
              <th class="quantity">状态</th>
          </tr>
          <c:forEach items="${orders }" var="bean">
          <tr>
            <td class="model">${bean.id}</td>
            <td class="image"><a href="#"><img title="product" alt="product" src="${pageContext.request.contextPath}/upload/${bean.item.imgPath}" height="50" width="50"></a></td>
            <td class="name"><a href="#">${bean.item.name}</a></td>
            <td class="model">${bean.count}</td>
            <td class="model">¥${bean.item.price}</td>
            <td class="model">¥${bean.totalPrice}</td>
            <td class="model">${bean.createDate}</td>
            <td class="model"><span class='label label-info'> ${bean.payType}</span></td>
            <td class="model"><span class='label label-important'>  ${bean.state}</span></td>
          </tr>
          </c:forEach>
          
        </tbody></table>
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
<script type="text/javascript" src="js/jquery.raty.min.js"></script>
</body></html>