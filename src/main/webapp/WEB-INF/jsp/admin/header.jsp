<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="am-topbar am-topbar-inverse admin-header">
	<div class="am-topbar-brand">
		<strong>搜吧</strong> <small>后台管理</small>
	</div>
	<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
		<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
			<li class="am-dropdown" data-am-dropdown>
				<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
					<span class="am-icon-users"></span> ${user.username} <span class="am-icon-caret-down"></span>
				</a>
        		<ul class="am-dropdown-content">
          		<li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          		<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          		<li><a href="${pageContext.request.contextPath}/admin/logout.do"><span class="am-icon-power-off"></span> 退出</a></li>
        		</ul>
      	</li>
    	</ul>
  	</div>
</header>