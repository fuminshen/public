package com.fumin.distribution.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.github.pagehelper.PageInfo;

public interface Service<T> {

	public T get(T vo);
	
	public boolean add(T vo);
	
	public boolean update(T vo);
	
	public boolean delete(T vo);
	
	/**
	 * 获取数据列表
	 * @param vo
	 * @return
	 */
	public List<?> getByEntity(Map<String,Object> vo);
	
	/**
	 * 获取数据库session
	 * @return
	 */
	public SqlSession getSession();
	
	/**
	 * 获取数据列表
	 * @param vo
	 * @param length
	 * @return
	 */
	public List<Map<String,Object>> getByEntityLimit(T vo,int length);
	
	public List<T> getByEntityLimitToEntity(T vo,int length);
	
	/**
	 * 获取分页数据
	 * @param vo
	 * @param currePage
	 * @param pageSize
	 * @return
	 */
	public PageInfo<?> getPager(Map<String,Object> vo,Integer currePage,Integer pageSize);
	
	/**
	 * 获取其他DAO类
	 * @param clazz
	 * @return
	 */
	public <DAO>Object getDAO(Class<DAO> clazz);
	
	/**
	 * 获取其他service类
	 * @param clazz
	 * @return
	 */
	public <SV>Object getService(Class<SV> clazz);
}
