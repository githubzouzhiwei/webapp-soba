package com.zzw.search.jobs;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;

public class SolrJob {
	
	private final static Logger logger = Logger.getLogger(SolrJob.class);

	protected void execute(String solrUrl) {
		logger.info("==>solr增量索引 start");
		// 请求参数
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		nvps.add(new BasicNameValuePair("command", "delta-import"));
		nvps.add(new BasicNameValuePair("clean", "false"));
		nvps.add(new BasicNameValuePair("commit", "true"));
		// 创建POST请求
		HttpPost httpPost = new HttpPost(solrUrl);
		try {
			httpPost.setEntity(new UrlEncodedFormEntity(nvps, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
		try {
			CloseableHttpResponse resp = httpClientBuilder.build().execute(httpPost);
			logger.info(resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("==>solr增量索引 end");
	}

}
