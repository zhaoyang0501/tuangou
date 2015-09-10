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
          <h1 class="heading1"><span class="maintext">注册一个新的账号</span></h1>
          <form id='form' class="form-horizontal" action="registerUser" method="post">
            <div class="registerbox">
              <fieldset>
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 用户名:</label>
                  <div class="controls">
                    <input type="text"  name='user.name' class="input-xlarge">
                  </div>
                </div>
                 <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 密码:</label>
                  <div class="controls">
                    <input type="password" name="user.password" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 昵称:</label>
                  <div class="controls">
                    <input type="text" name="user.nickname" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 电子邮件:</label>
                  <div class="controls">
                    <input type="text" name='user.email' class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 地址:</label>
                  <div class="controls">
                    <input type="text"  name="user.address" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"> 职业:</label>
                  <div class="controls">
                    <input type="text" name="user.job" class="input-xlarge">
                  </div>
                </div>
                
                <div class="control-group">
                  <label class="control-label"> 性别:</label>
                  <div class="controls">
                   	<select name='user.sex'>
                   		<option value=""></option>
                   		<option value="女">女</option>
                   		<option value="男">男</option>
                   	</select>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"></label>
                  <div class="controls">
                    <input type="Submit" class="btn btn-orange" value="提交">
                  </div>
                </div>
              </fieldset>
            </div>
          </form>
          <div class="clearfix"></div>
          <br>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formvalidate= $("#form").validate({
			errorPlacement: function(error, element) {
				$( element ).closest(".controls").append( error );
			},
			ignore:"",
			rules: {
				"user.name":  "required",
				"user.password":  "required",
				"user.nickname":  "required",
				"user.email":  "email",
				"user.address":  "required"
				},
			messages: {
				"user.name":"请填写用户名",
				"user.password":"请填写密码",
				"user.nickname":"请填写昵称",
				"user.email":"请填写电子邮件",
				"user.address":"请填写地址"
			}
		});
		
	});
</script>
</body></html>