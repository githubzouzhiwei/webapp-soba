package com.zzw.search.controller.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zzw.search.entity.Article;
import com.zzw.search.mapper.ArticleMapper;

@Controller
@RequestMapping("/article")
public class ArticleWebController {

	@Autowired
	private ArticleMapper articleMapper;

	/**
	 * 终端页
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String toArticleIndex(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		long id = 0;
		String strId = req.getParameter("id");
		try {
			id = Long.parseLong(strId);
		} catch (NumberFormatException e) {
			return "500";
		}
		if (id <= 0) {
			return "404";
		}
		Article article = articleMapper.getById(id);
		req.setAttribute("article", article);
		return "web/article/index";
	}

}
