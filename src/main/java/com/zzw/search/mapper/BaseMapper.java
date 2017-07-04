package com.zzw.search.mapper;

import java.util.List;

public interface BaseMapper<T> {

	int add(T t);

	int update(T t);

	int delete(Long id);

	T getById(Long id);

	List<T> getByIds(Long[] ids);

	List<T> findAll();

}
