<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 获取要展开面板
	String nav = request.getParameter("nav");
	if (nav != null) {
		request.setAttribute("nav", nav);	
	}
%>
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
	<div class="am-offcanvas-bar admin-offcanvas-bar">
		<ul class="am-list admin-sidebar-list" id="collapase-nav">
			<li><a href="${pageContext.request.contextPath}/admin/index.do"><span class="am-icon-home"></span> 首页</a></li>
			<li class="am-panel">
          	<a class="am-cf" data-am-collapse="{parent: '#collapase-nav', target: '#content-nav'}"><span class="am-icon-file"></span> 内容管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        		<ul class="am-list am-collapse admin-sidebar-sub ${nav == 'content-nav' ? 'am-in' : ''}" id="content-nav">
          		<li><a href="${pageContext.request.contextPath}/admin/article/list.do" class="am-cf"><span class="am-icon-table"></span> 文章列表</a></li>
         	</ul>
        	</li>
        	<li class="am-panel">
          	<a class="am-cf" data-am-collapse="{parent: '#collapase-nav', target: '#system-nav'}"><span class="am-icon-file"></span> 系统管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        		<ul class="am-list am-collapse admin-sidebar-sub ${nav == 'system-nav' ? 'am-in' : ''}" id="system-nav">
          		<li><a href="${pageContext.request.contextPath}/admin/user/list.do" class="am-cf"><span class="am-icon-table"></span> 用户列表</a></li>
         	</ul>
        	</li>
      </ul>
      	
      <div class="am-panel am-panel-default admin-sidebar-panel">
	   	<div class="am-panel-bd">
	      	<p><span class="am-icon-bookmark"></span> 公告</p>
	         <p>时光静好，与君语；细水流年，与君同。—— Amaze UI</p>
	     	</div>
		</div>
	
		<div class="am-panel am-panel-default admin-sidebar-panel">
			<div class="am-panel-bd">
				<p><span class="am-icon-tag"></span> wiki</p>
				<p>Welcome to the Amaze UI wiki!</p>
			</div>
		</div>
	</div>
</div>