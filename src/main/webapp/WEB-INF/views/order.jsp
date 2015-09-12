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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
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
      <form id="form" class="form-vertical form-inline" action="${pageContext.request.contextPath}/order" method="post">
      <input type="hidden" name='order.item.id' value="${item.id }">
      <h1 class="heading1"><span class="maintext"> 购物车</span><span class="subtext">购物车中的商品</span></h1>
      <!-- Cart-->
      <div class="cart-info">
        <table class="table table-striped table-bordered">
          <tbody><tr>
            <th class="image">图片</th>
            <th class="name">商品名称</th>
            <th class="model">供应商</th>
            <th class="quantity">数量</th>
              <th class="total">操作</th>
            <th class="price">单价</th>
            <th class="total">总价</th>
           
          </tr>
          <tr>
            <td class="image"><a href="#"><img title="product" alt="product" src="${pageContext.request.contextPath}/upload/${item.imgPath}" height="50" width="50"></a></td>
            <td class="name"><a href="#">${item.name}</a></td>
            <td class="model">${item.seller.name}</td>
            <td class="quantity"><div> <input id="count" name='order.count' type="text" size="1" value="1"  class="span1"></div>
             </td>
             <td class="total"> <a href="#" onclick="fun_reflesh_count()"><img class="tooltip-test" data-original-title="Update" src="img/update.png" alt=""></a>
             </td>
           
             
            <td class="price">¥<span id='price'>${item.price }</span></td>
            <td class="total">  ¥<span id='total_price'>${item.price }</span></td>
             
          </tr>
          
          
        </tbody></table>
      </div>
      <div class="cartoptionbox">
        <h4 class="heading4"> 请选择您的付款方式 </h4>
        <input name='order.payType' type="radio" class="radio" value="信用卡">  信用卡 <br>
        <input name='order.payType' type="radio" class="radio" value="在线支付">  在线支付 <br>
        <input  name='order.payType' type="radio" class="radio" value="货到付款" checked="checked">  货到付款 <br><br>
          <h4 class="heading4"> 填写您的送货地址</h4>
          <input type="text" style="width: 300px" name='order.addr'/>
      </div>
      <div class="container">
      <div class="pull-right">
          <div class="span4 pull-right">
            <input type="submit" value="提交订单" class="btn btn-orange pull-right mr10">
          </div>
        </div>
        </div>
        </form>
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
<script type="text/javascript">
function fun_reflesh_count(){
	$("#total_price").html($("#price").html()*$("#count").val());
}


$(document).ready(function(){
	var formvalidate= $("#form").validate({
		errorPlacement: function(error, element) {
			$( element ).closest("div").append( error );
		},
		ignore:"",
		rules: {
			"order.count": {"required":true,range:[1,10]},
			"order.addr":  "required",
			},
		messages: {
			"order.count": {"required":"请填写数量",range:"数量必须介于1,10"},
			"order.addr":"请填写地址"
		}
	});
	
});
</script>
</body></html>