package com.zzw.search.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zzw.search.entity.User;
import com.zzw.search.mapper.UserMapper;

@Controller
@RequestMapping("/admin")
public class CommonAdminController {
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 跳转到登录页
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String toLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return "admin/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		if (username == null || "".equals(username.trim()) || password == null || "".equals(password.trim())) {
			req.setAttribute("msg", "请输入帐号或密码");
			return "admin/login";
		}
		User user = userMapper.findByUsernameAndPassword(username, DigestUtils.md5Hex(password));
		if (user == null) {
			req.setAttribute("msg", "帐号或密码错误");
			return "admin/login";
		}
		req.getSession().setAttribute("user", user);
		return "redirect:index.do";
	}
	
	/**
	 * 后台管理首页
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return "admin/index";
	}
	
	/**
	 * 退出
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.getSession().invalidate();
		return "redirect:login.do";
	}

}
