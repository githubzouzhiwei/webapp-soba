<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>${article.title}</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	${article.content}
</body>
</html>