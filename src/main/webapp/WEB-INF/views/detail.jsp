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

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!-- fav -->
<link rel="shortcut icon" href="assets/ico/favicon.html">
<script type="text/javascript">
function save_collect(id){
	$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/saveCollect",
		   data: "cookBook.id="+id,
		   success: function(msg){
		     if(msg.tip=='ok'){
		    	 alert("收藏成功！");
		    	 $("#bt_collect").html("已收藏");
		    	 $("#bt_collect").attr("disabled","disabled");
		     }
		   }
		});
}

</script>
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
         <!-- Blog start-->   
          <section id="latestblog">         
            <div class="blogdetail">
              <h2 class="heading2"><span>${cookBook.name }</span></h2>
              
              <hr>
              <ul class="margin-none">
                <li class="listblcok" style="border-bottom:none;">
                  <div class="mb20">
                    <a class="fancyboxpopup thumbnail" href="${pageContext.request.contextPath}/upload/${cookBook.imgPath}"><img src="${pageContext.request.contextPath}/upload/${cookBook.imgPath}" alt=""></a>
                  </div>
                </li>
                <li class="listblcok" style="border-bottom:none;">
                		请评分：<div style="display: inline;" ID='star'></div>${cookBook.score }分
                </li>
                <li class="listblcok" style="border-bottom:none;">
                 <button  id='bt_collect'  onclick="save_collect(${cookBook.id })" class="btn btn-orange pull-left" >收藏菜谱</button>
                </li>
                
                <li>
                <div class="bshare-custom">
				   <a title="分享到" href="http://www.bshare.cn/share" id="bshare-shareto" class="bshare-more"></a>
				
				   <a title="分享到腾讯朋友" class="bshare-qqxiaoyou"></a>
				   <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
				   <a title="分享到人人网" class="bshare-renren"></a>
				   <a title="分享到开心网" class="bshare-kaixin001"></a>
				   <a title="分享到豆瓣" class="bshare-douban"></a>
				   <!-- 在这里添加更多平台 -->
				
				   <a title="更多平台" id="bshare-more-icon" class="bshare-more"></a>
				</div>
				<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#uuid=&style=-1"></script>
				<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC2P.js"></script>
                </li>
              </ul>
			     
                	<h2 class='heading2' >简介</h2>
                	<hr>
                	<p>
                		${cookBook.remark }
                	</p>
                	<h2 class='heading2' >用料</h2>
                	<hr>
									<table class='table table-bordered '>

										<tbody>
										<c:forEach items="${cookBook.cookFoods }" var="bean">
											<tr>
												<td class="name has-border">${bean.name }</td>
												<td class="unit has-border">${bean.number }</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
									<h2 class='heading2' >做法</h2>
                					<hr>
                					<ul>
	                					<c:forEach items="${cookBook.cookSteps }" var="bean" varStatus="status">
		                					 <li >
								              <h3 >第${status.index +1}步：${bean.name }</h3>
								              <img src="${pageContext.request.contextPath}/upload/${bean.imgPath}" alt="葡式蛋挞的做法 步骤1" width="200">
								            </li>
	                					</c:forEach>
          							</ul>
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
<script type="text/javascript" src="js/jquery.raty.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#star').raty({
				start:${cookBook.score==null?0:cookBook.score},
			  	onClick: function(score) {
			  		$.ajax({
			 		   type: "POST",
			 		   url: "${pageContext.request.contextPath}/giveScore",
			 		   data: "cookBook.id=${cookBook.id}&score="+score,
			 		   success: function(msg){
			 			  window.location.reload();
			 		   }
			 		});
			  }
			});
	});
</script>
</body></html>