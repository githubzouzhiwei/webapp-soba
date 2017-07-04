<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>搜吧</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
	<style type="text/css">
		form {text-align: center; padding-top: 20px;}
	</style>
</head>
<body>
	<form class="am-form-inline" method="post" action="${pageContext.request.contextPath}/search/query.do">
		<div class="am-form-group">
    		<input type="text" class="am-form-field" placeholder="关键词"  name="keyword"/>
  		</div>
		<button type="submit" class="am-btn am-btn-primary">搜吧</button>
	</form>
</body>
</html>
