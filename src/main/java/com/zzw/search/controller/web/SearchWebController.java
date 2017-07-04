package com.zzw.search.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.ModifiableSolrParams;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzw.search.utils.Page;

@Controller
@RequestMapping("/search")
public class SearchWebController {

	@Value("#{solrConfig[url]}")
	private String solrUrl;
	// 每页记录数
	private long pageSize = 10;

	@RequestMapping(value = "/query.do")
	public String query(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 获取关键词
		String keyword = req.getParameter("keyword");
		// 若是GET请求，则转换编码
		if ("GET".equals(req.getMethod())) {
			keyword = new String(keyword.getBytes("ISO8859-1"), "UTF-8");
		}
		// 页号
		String strPageIndex = req.getParameter("pageIndex");
		long pageIndex = strPageIndex == null ? 1 : Long.parseLong(strPageIndex);
		HttpSolrClient httpSolrServer = new HttpSolrClient(solrUrl);
		ModifiableSolrParams params = new ModifiableSolrParams();
		// 返回数据格式
		params.set("wt", "json");
		// 查询参数
		params.set("q", keyword);
		// 从查询结果的第一个开始
		params.set("start", (pageIndex - 1) * pageSize + "");
		// 限制返回查询结果个数
		params.set("rows", pageSize + "");
		Page<Map<String, Object>> page = new Page<Map<String, Object>>();
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		try {
			QueryResponse queryResponse = httpSolrServer.query(params);
			// 查询结果
			SolrDocumentList results = queryResponse.getResults();
			// 高亮
			Map<String, Map<String, List<String>>> highlightings = queryResponse.getHighlighting();
			for (int i = 0; i < results.size(); ++i) {
				Map<String, Object> doc = results.get(i).getFieldValueMap();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", doc.get("id"));
				// 标题
				String title = null;
				// 摘要
				String digest = null;
				// 判断标题或内容是否有提到关键词的部分
				Map<String, List<String>> highlighting = highlightings.get(doc.get("id").toString());
				if (highlighting != null) {
					List<String> titleList = highlighting.get("title");
					if (titleList != null && titleList.size() > 0) {
						title = titleList.get(0);
					}
					List<String> contentTextList = highlighting.get("content_text");
					if (contentTextList != null && contentTextList.size() > 0) {
						digest = contentTextList.get(0);
					}
				} else {
					map.put("title", doc.get("title"));
				}
				if (title == null) {
					title = (String) doc.get("title");
				}
				if (digest == null) {
					// 获取内容摘要
					String contentText = (String) doc.get("content_text");
					contentText = contentText.length() > 100 ? contentText.substring(0, 100) + "..." : contentText;
					digest = contentText;
				}
				map.put("title", title);
				map.put("digest", digest);
				mapList.add(map);
			}
			page.setTotal(results.getNumFound());
			page.setList(mapList);
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		page.setCurPage(pageIndex);
		page.setPageSize(pageSize);
		req.setAttribute("page", page);
		req.setAttribute("keyword", keyword);
		return "web/search/list";
	}

}
