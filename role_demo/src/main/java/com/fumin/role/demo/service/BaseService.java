package com.fumin.role.demo.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;

public interface BaseService<T> {

	public T getForUpdate(Object id);
	
	public T get(Object id);
	
	public T getOneByEntity(T entity);
	
	public List<T> getByEntity(T entity);
	
	public void update(T entity);
	
	public void delete(Object id);
	
	public void add(T entity);
	
	public PageInfo<T> getPage(T entity,int currentPage,int pageSize);

	public PageInfo<?> getPage(T entity, Integer currePage, Integer pageSize, String sortName, String sortType);
	
	public PageInfo<?> getPageToMap(Map<String, Object> params,Integer currentPage, Integer pageSize);
}
