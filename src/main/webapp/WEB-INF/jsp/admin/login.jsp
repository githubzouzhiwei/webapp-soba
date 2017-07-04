<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head lang="en">
  	<meta charset="UTF-8">
  	<title>搜吧-后台管理登录</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
	<style>
		.header {
	    	text-align: center;
	  	}
	  	.header h1 {
	    	font-size: 200%;
	    	color: #333;
	    	margin-top: 30px;
	  	}
	  	.header p {
	    	font-size: 14px;
		}
	</style>
</head>
<body>
<div class="header">
  	<div class="am-g">
    	<h1>搜吧-后台管理登录</h1>
  	</div>
</div>
<div class="am-g">
  	<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    	<form method="post" class="am-form" action="${pageContext.request.contextPath}/admin/login.do">
      	<label for="username">用户名:</label>
     		<input type="text" name="username" id="username" value="">
     		<br>
     		<label for="password">密码:</label>
     		<input type="password" name="password" id="password" value="">
     		<br>
     		<label for="remember-me">
	       	<input id="remember-me" type="checkbox">
	        	记住密码
      	</label>
      	<br />
      	<div class="am-cf">
        		<input type="submit" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
        		<input type="submit" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
      	</div>
      	<c:if test="${!empty msg}">
	      	<div class="am-alert am-alert-danger" data-am-alert>
	  				<button type="button" class="am-close">&times;</button>
	  				<p>${msg}</p>
				</div>
      	</c:if>
    	</form>
    	<hr>
    	<p>© 2017 ZOUZHIWEI, Inc. Licensed under MIT license.</p>
  </div>
</div>
</body>
</html>
