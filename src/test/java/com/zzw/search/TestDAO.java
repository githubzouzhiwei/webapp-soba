package com.zzw.search;

import org.apache.commons.codec.digest.DigestUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zzw.search.entity.Article;
import com.zzw.search.entity.User;
import com.zzw.search.mapper.ArticleMapper;
import com.zzw.search.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration({"classpath:applicationContext.xml"})
public class TestDAO {
	
	@Autowired
	ArticleMapper articleMapper;
	
	@Autowired
	UserMapper userMapper;

	@Ignore
	@Test
	public void test() throws Exception {
		Document doc = Jsoup.connect("http://mp.weixin.qq.com/s/Zh4NntkuAzJNSAasVajJpg").get();
		Element js_content = doc.getElementById("js_content");
		Elements fieldsets = js_content.getElementsByTag("fieldset");
		if (fieldsets != null && fieldsets.size() > 0) {
			fieldsets.get(fieldsets.size() - 1).remove();
		}
		Article article = new Article();
		article.setTitle("人参");
		article.setContent(js_content.text());
		articleMapper.add(article);
	}
	
	@Test
	public void testUser() {
		User user = new User();
		user.setUsername("admin");
		user.setPassword(DigestUtils.md5Hex("123456"));
		userMapper.add(user);
	}
	
}
