<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js fixed-layout">
<head>
	<title>搜吧-后台管理</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<!-- 公共头部 -->
<jsp:include page="../header.jsp" />

<div class="am-cf admin-main">
  	<!-- 侧边栏 -->
  	<jsp:include page="../sidebar-list.jsp">
  		<jsp:param name="nav" value="system-nav"/>
  	</jsp:include>

  	<!-- content start -->
  	<div class="admin-content">
    	<div class="admin-content-body">
      	<div class="am-cf am-padding">
        		<div class="am-fl am-cf">
        			<strong class="am-text-primary am-text-lg">系统管理</strong> /
        			<strong class="am-text-primary am-text-lg">
        				<a href="${pageContext.request.contextPath}/admin/user/list.do">用户列表</a>
        			</strong> /  
        			<small>新增</small>
        		</div>
      	</div>
      	
			<form class="am-form" method="post" action="${pageContext.request.contextPath}/admin/user/add.do">
	      	<div class="am-g am-margin-top">
	     			<div class="am-u-sm-4 am-u-md-2 am-text-right">用户名</div>
	            <div class="am-u-sm-8 am-u-md-4">
	            	<input type="text" class="am-input-sm" name="username">
	           	</div>
	           	<div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
				</div>

		  		<div class="am-margin">
		      	<input type="submit" class="am-btn am-btn-primary am-btn-xs" value="提交" />
		    	</div>
	  		</form>
    	</div>

    	<footer class="admin-content-footer">
      	<hr>
      	<p class="am-padding-left">© 2017 ZOUZHIWEI, Inc. Licensed under MIT license.</p>
    	</footer>
  	</div>
  	<!-- content end -->
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.4.4.min.js"></script>
</body>
</html>