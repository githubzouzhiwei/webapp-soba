<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      	<div class="am-cf am-padding am-padding-bottom-0">
        		<div class="am-fl am-cf">
        			<strong class="am-text-primary am-text-lg">内容管理</strong> / <small>文章列表</small>
        		</div>
      	</div>
      	<hr>
     		<div class="am-g">
	        	<div class="am-u-sm-12 am-u-md-6">
	          	<div class="am-btn-toolbar">
	            	<div class="am-btn-group am-btn-group-xs">
	              		<a type="button" class="am-btn am-btn-default" href="${pageContext.request.contextPath}/admin/article/add.do">
	              			<span class="am-icon-plus"></span> 新增
	              		</a>
	              		<button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
	              		<a type="button" class="am-btn am-btn-default" href="#" onclick="return confirm('是否确定删除？')">
	              			<span class="am-icon-trash-o"></span> 删除
	              		</a>
	            	</div>
	          	</div>
	        	</div>
	        	<div class="am-u-sm-12 am-u-md-3">
	          	<div class="am-input-group am-input-group-sm">
	            	<input type="text" class="am-form-field">
	          		<span class="am-input-group-btn">
	            		<button class="am-btn am-btn-default" type="button">搜索</button>
	          		</span>
	          	</div>
	        	</div>
	      </div>
			<div class="am-g">
        		<div class="am-u-sm-12">
          		<form class="am-form">
            		<table class="am-table am-table-striped am-table-hover table-main">
              			<thead>
              				<tr>
                				<th class="table-check"><input type="checkbox" onclick="selectGroup(this)" /></th>
                				<th class="table-id">ID</th>
                				<th class="table-title">标题</th>
                				<th class="table-date">创建日期</th>
                				<th class="table-date">修改日期</th>
                				<th class="table-set">操作</th>
              				</tr>
              			</thead>
              			<tbody>
              				<c:forEach items="${page.list}" var="item">
	              				<tr>
	                				<td><input type="checkbox" name="ids" value="${item.id}" /></td>
	                				<td>${item.id}</td>
	                				<td><a href="${pageContext.request.contextPath}/article/index.do?id=${item.id}">${item.title}</a></td>
	                				<td class="am-hide-sm-only">
	                					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.createAt}"/></td>
	                				<td class="am-hide-sm-only">
	                					<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.updateAt}"/>
	                				</td>
	                				<td>
				                  	<div class="am-btn-toolbar">
				                    		<div class="am-btn-group am-btn-group-xs">
				                      		<a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="${pageContext.request.contextPath}/admin/article/edit.do?id=${item.id}">
				                      			<span class="am-icon-pencil-square-o"></span> 编辑
				                      		</a>
				                      		<a class="am-btn am-btn-default am-btn-xs am-text-danger" href="javascript:void()" onclick="deleteById(this, ${item.id})">
				                      			<span class="am-icon-trash-o"></span> 删除
				                      		</a>
				                    		</div>
				                  	</div>
				                	</td>
	              				</tr>
              				</c:forEach>
              			</tbody>
            		</table>
            		<div class="am-cf">
              				共 ${page.total} 条记录
              			<div class="am-fr">
	                		<ul class="am-pagination">
	                			<c:if test="${page.curPage > 1}">
			               		<li><a href="${pageContext.request.contextPath}/admin/article/list.do?pageIndex=${page.curPage - 1}">«</a></li>
	                			</c:if>
		               		<c:forEach var="index" begin="1" end="${page.pageCount}" step="1">
               					<c:if test="${page.curPage == index}">
					                  <li class="am-active"><a href="#">${index}</a></li>
               					</c:if>
               					<c:if test="${page.curPage != index}">
					                  <li><a href="${pageContext.request.contextPath}/admin/article/list.do?pageIndex=${index}">${index}</a></li>
               					</c:if>
		               		</c:forEach>
		               		<c:if test="${page.curPage < page.pageCount}">
				                  <li><a href="${pageContext.request.contextPath}/admin/article/list.do?pageIndex=${page.curPage + 1}">»</a></li>
		               		</c:if>
			          		</ul>
              			</div>
            		</div>
          		</form>
        		</div>
      	</div>
	      
    	</div>

    	<footer class="admin-content-footer">
      	<hr>
      	<p class="am-padding-left">© 2017 ZOUZHIWEI, Inc. Licensed under MIT license.</p>
    	</footer>
  	</div>
  	<!-- content end -->
</div>
<!-- 删除文章确认框 -->
<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  	<div class="am-modal-dialog">
    	<div class="am-modal-hd">确认框</div>
    	<div class="am-modal-bd">
      		是否确定删除该文章？
    	</div>
    	<div class="am-modal-footer">
      	<span class="am-modal-btn" data-am-modal-cancel>取消</span>
      	<span class="am-modal-btn" data-am-modal-confirm>确定</span>
    	</div>
  	</div>
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
<script type="text/javascript">

	// 复选框全选或取消全选
	function selectGroup(obj) {
		var checked = $(obj).is(':checked');
		if (checked) {
			$('input[name="ids"]').each(function() {
				$(this).prop('checked', true);
			});
		} else {
			$('input[name="ids"]').each(function() {
				$(this).prop('checked', false);
			});
		}
	}
	
	// 删除文章
	function deleteById(obj, id) {
		$('#my-confirm').modal({relatedTarget : obj, 
			onConfirm : function(options) {
				var link = '${pageContext.request.contextPath}/admin/article/delete.do?id=' + id;
				window.location = link;
	     	}
		});
	}
</script>
</body>
</html>