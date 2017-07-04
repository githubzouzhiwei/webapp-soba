<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>${keyword}_搜吧搜索</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css"/>
	<style type="text/css">
		form {padding: 10px 0 10px 10px; position: fixed; background-color: #fff; width: 100%; box-shadow: 0 2px 1px #ccc;}
		#list{padding: 65px 10px 0 10px; width: 600px;}
		#list>a{text-decoration: underline;}
		#list>div{margin-bottom: 10px;}
	</style>
</head>
<body>
	<form class="am-form-inline" method="post" action="${pageContext.request.contextPath}/search/query.do">
		<div class="am-form-group">
    		<input type="text" class="am-form-field" placeholder="关键词"  name="keyword" value="${keyword}" style="width: 600px;"/>
  		</div>
		<button type="submit" class="am-btn am-btn-primary">搜 吧</button>
	</form>
	<div id="list">
		<c:if test="${empty page.list}">
			无搜索结果
		</c:if>
		<c:forEach items="${page.list}" var="item">
			<a href="${pageContext.request.contextPath}/article/index.do?id=${item.id}">${item.title}</a>
			<div>${item.digest}...</div>
		</c:forEach>
		<ul class="am-pagination">
	  		<c:if test="${page.curPage > 1}">
	   		<li><a href="${pageContext.request.contextPath}/search/query.do?keyword=${keyword}&pageIndex=${page.curPage - 1}">&lt;&lt;</a></li>
	  		</c:if>
	  		<c:forEach var="index" begin="1" end="${page.pageCount}" step="1">
				<c:if test="${page.curPage == index}">
	       		<li class="am-active"><a href="#">${index}</a></li>
				</c:if>
				<c:if test="${page.curPage != index}">
	        		<li><a href="${pageContext.request.contextPath}/search/query.do?keyword=${keyword}&pageIndex=${index}">${index}</a></li>
				</c:if>
	  		</c:forEach>
	  		<c:if test="${page.curPage < page.pageCount}">
	      	<li><a href="${pageContext.request.contextPath}/search/query.do?keyword=${keyword}&pageIndex=${page.curPage + 1}">&gt;&gt;</a></li>
	  		</c:if>
		</ul>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.12.4.min.js"></script>
</html>