package com.zzw.search.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zzw.search.entity.Article;
import com.zzw.search.mapper.ArticleMapper;
import com.zzw.search.utils.Page;

@Controller
@RequestMapping("/admin/article")
public class ArticleAdminController {

	@Autowired
	private ArticleMapper articleMapper;

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
		List<Article> list = articleMapper.getByPage(1, (pageIndex - 1) * 10, 10);
		int total = articleMapper.count(1);
		Page<Article> page = new Page<Article>();
		page.setList(list);
		page.setCurPage(pageIndex);
		page.setPageSize(10);
		page.setTotal(total);
		req.setAttribute("page", page);
		return "admin/article/list";
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.GET)
	public String toAdd(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return "admin/article/add";
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public String add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		if (title == null || "".equals(title.trim()) || content == null || "".equals(content.trim())) {
			return null;
		}

		Article article = new Article();
		article.setTitle(title);
		article.setContent(content);
		article.setContentText(content.replaceAll("<[^>]*>|\\s", ""));
		article.setStatus(1);
		Timestamp timestamp = new Timestamp(new Date().getTime());
		article.setCreateAt(timestamp);
		article.setUpdateAt(timestamp);
		articleMapper.add(article);
		return "redirect:list.do";
	}

	@RequestMapping(value = "/edit.do", method = RequestMethod.GET)
	public String toEdit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		long id = 0;
		String strId = req.getParameter("id");
		try {
			id = Long.parseLong(strId);
		} catch (NumberFormatException e) {
		}
		if (id <= 0) {
			return null;
		}
		Article article = articleMapper.getById(id);
		if (article == null) {
			return null;
		}
		req.setAttribute("article", article);
		return "admin/article/edit";
	}

	@RequestMapping(value = "/edit.do", method = RequestMethod.POST)
	public String edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		long id = 0;
		String strId = req.getParameter("id");
		try {
			id = Long.parseLong(strId);
		} catch (NumberFormatException e) {
		}
		if (id <= 0) {
			return null;
		}
		Article article = articleMapper.getById(id);
		if (article == null) {
			return null;
		}
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		if (title == null || "".equals(title.trim()) || content == null || "".equals(content.trim())) {
			return null;
		}
		// 更新
		article.setTitle(title);
		article.setContent(content);
		article.setContentText(content.replaceAll("<[^>]*>|\\s", ""));
		article.setStatus(1);
		Timestamp timestamp = new Timestamp(new Date().getTime());
		article.setUpdateAt(timestamp);
		articleMapper.update(article);

		return "redirect:list.do";
	}

	@RequestMapping(value = "/fetch.do", method = RequestMethod.GET)
	public void fetch(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String linkUrl = req.getParameter("linkUrl");
		if (linkUrl != null && !"".equals(linkUrl)) {
			Document doc = null;
			String data = null;
			try {
				doc = Jsoup.connect(linkUrl).get();
			} catch (Exception e) {
				data = "请求链接出错";
				e.printStackTrace();
			}
			if (doc != null) {
				// 去掉script标签
				data = doc.body().toString().replaceAll("<script[^>]*?>[\\s\\S]*?<\\/script>", "");
			}
			resp.getWriter().write(data);
		}
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
		Article article = articleMapper.getById(id);
		if (article == null) {
			return null;
		}
		article.setStatus(-1);
		article.setUpdateAt(new Timestamp(new Date().getTime()));
		articleMapper.update(article);
		return "redirect:list.do";
	}

}
