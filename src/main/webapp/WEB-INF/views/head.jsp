<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<header>

  <div class="headerstrip">
    <div class="container">
      <div class="row">
      	<div class='span2'>
          <a href="index-2.html" ><img src="img/xcf_logo_106x35.png" alt="SimpleOne" title="SimpleOne"></a>
         </div> 
          <!-- Top Nav Start -->
          <div class="span5">
            <div class="navbar" id="topnav">
              <div class="navbar-inner">
                <ul class="nav">
                  <li><a class="home active" href="${pageContext.request.contextPath}/index">首页</a>
                  </li>
                  <li><a class="myaccount" href="${pageContext.request.contextPath}/gocategory">菜谱分类</a>
                  </li>
                  <li><a class="checkout" href="${pageContext.request.contextPath}/center">个人中心</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="span3">
            <form class="form-search top-search" action="search" method="post">
              <input type="text" name='key' class="input-medium search-query" placeholder="搜索菜谱">
            </form>
          </div>
          
          <div class="dropdown span1" >
	          <c:if test="${sessionScope.user==null}">
	          <a href="${pageContext.request.contextPath}/login" style="color: #fff;" >登陆</a>|
	          <a href="${pageContext.request.contextPath}/register" style="color: #fff;" >注册</a>
	          </c:if>
	          <c:if test="${sessionScope.user!=null}">
	           <a href="javascript:void(0)" style="color: #fff;" class="dropdown-toggle" data-toggle="dropdown">${sessionScope.user.nickname }<b class="caret"></b></a>
	               <ul class="dropdown-menu language" id='top_center'>
	                <li>
	                  <a href="${pageContext.request.contextPath}/center">个人中心</a>
	                </li>
	                 <li>
	                  <a href="${pageContext.request.contextPath}/loginout">退出</a>
	                </li>
	              </ul>
	          </c:if>
	      </div>
          
      </div>
    </div>
  </div>
</header>