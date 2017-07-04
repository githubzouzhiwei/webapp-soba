package com.zzw.search.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zzw.search.entity.User;
import com.zzw.search.mapper.UserMapper;
import com.zzw.search.utils.Page;

@Controller
@RequestMapping("/admin/user")
public class UserAdminController {

	@Autowired
	private UserMapper userMapper;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		int pageIndex = 1;
		String strPageIndex = req.getParameter("pageIndex");
		if (strPageIndex != null) {
			try {
				pageIndex = Integer.parseInt(strPageIndex);
			} catch (NumberFormatException e) {
			}
			if (pageIndex <= 0) {
				pageIndex = 1;
			}
		}
		List<User> list = userMapper.getByPage((pageIndex - 1) * 10, 10);
		int total = userMapper.count();
		Page<User> page = new Page<User>();
		page.setList(list);
		page.setCurPage(pageIndex);
		page.setPageSize(10);
		page.setTotal(total);
		req.setAttribute("page", page);
		return "admin/user/list";
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.GET)
	private String toAdd(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return "admin/user/add";
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	private String add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = req.getParameter("username");
		if (username == null || "".equals(username.trim())) {
			return null;
		}
		User user = new User();
		user.setUsername(username);
		user.setPassword(DigestUtils.md5Hex("123456"));
		userMapper.add(user);
		return "redirect:list.do";
	}
	
	/**
	 * 重置密码
	 */
	@RequestMapping(value = "/resetPassword.do", method = RequestMethod.GET)
	public String resetPassword(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		long id = 0;
		String strId = req.getParameter("id");
		try {
			id = Long.parseLong(strId);
		} catch (NumberFormatException e) {
		}
		if (id <= 0) {
			return null;
		}
		User user = userMapper.getById(id);
		if (user == null || "admin".equals(user.getUsername())) {
			return null;
		}
		user.setPassword(DigestUtils.md5Hex("123456"));
		userMapper.update(user);
		return "redirect:list.do";
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		long id = 0;
		String strId = req.getParameter("id");
		try {
			id = Long.parseLong(strId);
		} catch (NumberFormatException e) {
		}
		if (id <= 0) {
			return null;
		}
		User user = userMapper.getById(id);
		if (user == null || "admin".equals(user.getUsername())) {
			return null;
		}
		userMapper.delete(id);
		return "redirect:list.do";
	}

}
