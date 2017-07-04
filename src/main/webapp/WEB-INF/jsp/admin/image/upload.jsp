<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>上传图片</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <form method="post" action="${pageContext.request.contextPath}/admin/image/upload.do" enctype="multipart/form-data">
    	<input type="file" name="imageFile" /><br/><br/>
    	<input type="button" value="提交"  onclick="upload()"/>
    	<input type="button" value="取消" onclick="unloadme()" />
    </form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xheditor-1.1.14-zh-cn.min.js"></script>
<script type="text/javascript">
	// 上传
	function upload() {
		var form = $("form");
		var imageFile = form.find('input[name="imageFile"]').val();
		// 获取文件后缀
		var suffix = imageFile.substring(imageFile.lastIndexOf('.'));
		if (suffix != '.gif' && suffix != '.jpg' && suffix != '.jpeg' && suffix != '.png') {
			alert('请选择图片文件');
			return;
		}
		var iframe = $('<iframe name="uploadFile" style="display:none;" onload="uploadCallback(this)"></iframe>');
		$(document.body).append(iframe);
		form.attr('target', 'uploadFile');
		form.submit();
		// 重置表单
		form[0].reset();
	}
	
	// 上传文件回调方法
	function uploadCallback(obj) {
		var text = $(obj).contents().find('body').text();
		if (text == '') {
			return;
		}
		// 移除iframe
		$(obj).remove();
		var data = eval('(' + text + ')');
		if (data.status == 0) {
			// 调用xheditor提供的回调方法
			callback(data.fileUrl);
		}
	}
</script>
</html>