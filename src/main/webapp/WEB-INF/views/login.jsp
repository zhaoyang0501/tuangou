<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
      <div class="row">        
      <div class="span12">
       <h2 class="heading2" style="text-align: center;">${tip }</h2>
          <h1 class="heading1"><span class="maintext red">登陆</span></h1>
          <section class="newcustomer">
            <h2 class="heading2">新用户 </h2>
            <div class="loginbox">
              <p>用户应自行诚信向本站提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且京东保留终止用户使用京东各项服务的权利。</p>
              <br>
              <br>
              <br>
               <br>
              <a href="./register" class="btn btn-orange">去注册吧</a>
            </div>
          </section>
          <section class="returncustomer">
            <h2 class="heading2">已有账户 </h2>
            <div class="loginbox">
              <form class="form-vertical" action="./dologin" method="post">
                <fieldset>
                  <div class="control-group">
                    <label class="control-label">用户名:</label>
                    <div class="controls">
                      <input type="text" class="span3" name='user.name'>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label">密码:</label>
                    <div class="controls">
                      <input type="password"  class="span3" name='user.password'>
                    </div>
                  </div>
                  <button type="submit" class="btn btn-orange">登陆</button>
                </fieldset>
              </form>
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