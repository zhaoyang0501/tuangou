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
          <h1 class="heading1"><span class="maintext">创建一个菜谱</span></h1>
          <form class="form-horizontal" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/douploadCookBook" >
            <div class="registerbox">
              <fieldset>
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 菜谱名称:</label>
                  <div class="controls">
                    <input type="text"  name='cookBook.name' class="input-xlarge">
                  </div>
                </div>
                 <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 菜谱封面:</label>
                  <div class="controls">
                    <input type="file" name="cookImg" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 简介:</label>
                  <div class="controls">
                    <textarea rows="4" name='cookBook.remark' class='input-xlarge'></textarea>
                  </div>
                </div>
                
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 大类:</label>
                  <div class="controls">
                  				
                    <select id='category' name='cookBook.category.id' onchange="changeCategory()">
											<option value=""></option>
											<c:forEach items="${categorys }" var="bean">
												<option value="${bean.id }">${bean.name }</option>
											</c:forEach>
					</select>
                  </div>
                </div>
                
                <div class="control-group" id='control_project'>
								<label for="categorySub" class="control-label">小类：</label>
								<div class="controls">
									<select id='categorySub' name='cookBook.categorySub.id' onchange="">
											<option value=""></option>
											<c:forEach items="${categorySubs }" var="bean">
												<option value="${bean.id }">${bean.name }</option>
											</c:forEach>
									</select>
								</div>
							</div>
                
                <div class="control-group">
                  <label class="control-label"><span class="red">*</span> 用料:</label>
                  <div class="controls">
                   	<table class="table table-bordered" style="width: 60%">
                   	<tr><td> <input type="text"  name="cookFoods[0].name" class="input-xlarge"></td><td> <input type="text"  name="cookFoods[0].number" class="input-xlarge"></td></tr>
                   	<tr><td> <input type="text"  name="cookFoods[1].name" class="input-xlarge"></td><td> <input type="text"  name="cookFoods[1].number" class="input-xlarge"></td></tr>
                   	<tr><td> <input type="text"  name="cookFoods[2].name" class="input-xlarge"></td><td> <input type="text"  name="cookFoods[2].number" class="input-xlarge"></td></tr>
					</table>
                  </div>
                </div>
              </fieldset>
            </div>
            
            <h3 class="heading3">步骤</h3>
            <div class="registerbox">
              <fieldset>
                <div class="control-group">
                  <label class="control-label"> 第一步:</label>
                  <div class="controls">
                    <textarea rows="4" name='cookSteps[0].name' class='input-xlarge'></textarea>
                     <input type="file" name="stepImg" class="input-xlarge">
                  </div>
                </div>
               <div class="control-group">
                  <label class="control-label"> 第二步:</label>
                  <div class="controls">
                    <textarea rows="4" name='cookSteps[1].name' class='input-xlarge'></textarea>
                     <input type="file" name="stepImg" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"> 第三步:</label>
                  <div class="controls">
                   <textarea rows="4" name='cookSteps[2].name' class='input-xlarge'></textarea>
                     <input type="file" name="stepImg" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"> 第四步:</label>
                  <div class="controls">
                     <textarea rows="4" name='cookSteps[3].name' class='input-xlarge'></textarea>
                     <input type="file" name="stepImg" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"> 第五步:</label>
                  <div class="controls">
                     <textarea rows="4" name='cookSteps[4].name' class='input-xlarge'></textarea>
                     <input type="file" name="stepImg" class="input-xlarge">
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label"></label>
                  <div class="controls">
                    <input type="Submit" class="btn btn-orange" value="提交">
                  </div>
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
<script type="text/javascript">
function changeCategory(){
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath}/admin/cookbook/querySubCategory?id="+$("#category").val(),
		dataType : "json",
		success : function(json) {
			if(json.resultMap.state=='success'){
				$("#categorySub").html("");
				for (var i = 0; i < json.resultMap.object.length; i++) {
					$("#categorySub").append("<option value='" +json.resultMap.object[i].id + "'>" + json.resultMap.object[i].name + "</option>");
				}
			}
		}
	});
}

</script>
</body></html>