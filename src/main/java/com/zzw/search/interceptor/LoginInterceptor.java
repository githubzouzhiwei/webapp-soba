package com.zzw.search.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zzw.search.entity.User;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			// 重定向到登录页面
			response.sendRedirect(request.getContextPath() + "/admin/login.do");
			return false;
		} else {
			return true;
		}
	}
	
}
