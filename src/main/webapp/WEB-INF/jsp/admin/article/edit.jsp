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
  		<jsp:param name="nav" value="content-nav"/>
  	</jsp:include>

  	<!-- content start -->
  	<div class="admin-content">
    	<div class="admin-content-body">
      	<div class="am-cf am-padding">
        		<div class="am-fl am-cf">
        			<strong class="am-text-primary am-text-lg">内容管理</strong> /
        			<strong class="am-text-primary am-text-lg">
        				<a href="${pageContext.request.contextPath}/admin/article/list.do">文章列表</a>
        			</strong> /  
        			<small>修改</small>
        		</div>
      	</div>
      	
			<form class="am-form" method="post" action="${pageContext.request.contextPath}/admin/article/edit.do">
				<input type="hidden" name="id" value="${article.id}" />
	      	<div class="am-g am-margin-top">
	     			<div class="am-u-sm-4 am-u-md-2 am-text-right">标题</div>
	            <div class="am-u-sm-8 am-u-md-4">
	            	<input type="text" class="am-input-sm" name="title" value="${article.title}">
	           	</div>
	           	<div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
				</div>
				
            <div class="am-g am-margin-top-sm">
              	<div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">内容</div>
              	<div class="am-u-sm-12 am-u-md-10">
                	<textarea name="content" rows="20" placeholder="请输入内容">${article.content}</textarea>
              	</div>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript">
	// 配置xheditor
	var editor = $('textarea[name="content"]').xheditor({skin:'nostyle', upImgUrl:'!${pageContext.request.contextPath}/admin/image/upload.do'});
</script>
</body>
</html>