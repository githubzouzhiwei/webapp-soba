package com.zzw.search.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zzw.search.entity.Article;

public interface ArticleMapper extends BaseMapper<Article> {

	/**
	 * 分页查找
	 */
	List<Article> getByPage(@Param("status")int status, @Param("start")int start, @Param("size")int size);
	
	/**
	 * 获取总数
	 */
	int count(int status);
	
}
