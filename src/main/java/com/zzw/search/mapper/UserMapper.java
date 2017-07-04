package com.zzw.search.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zzw.search.entity.User;

public interface UserMapper extends BaseMapper<User> {

	/**
	 * 根据用户名和密码查找
	 */
	User findByUsernameAndPassword(@Param("username")String username, @Param("password")String password);
	
	/**
	 * 分页查找
	 */
	List<User> getByPage(@Param("start")int start, @Param("size")int size);
	
	/**
	 * 获取总数
	 */
	int count();
	
}
