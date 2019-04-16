package com.fumin.distribution.service.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import com.fumin.distribution.service.Service;
import com.fumin.distribution.util.BaseDAO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

public abstract class ServiceImpl<T> implements Service<T>, ApplicationContextAware {
	
	@Autowired
	protected SqlSessionFactory sqlSessionFactory;
	@Autowired
	protected BaseDAO<T> dao;
	
	@Autowired
	protected HttpSession session;
	
	private ApplicationContext ctx;
	
	public T get(T vo) {
		vo = dao.getById(vo);
		return vo;
	}
	
	public boolean add(T vo) {
		return dao.add(vo)>0;
	}
	
	public boolean update(T vo) {
		return dao.update(vo)>0;
	}
	
	public boolean delete(T vo) {
		return dao.delete(vo)>0;
	}
	
	public List<?> getByEntity(Map<String,Object> map){
		return dao.getByEntity(map,newEntity());
	}
	
	public List<Map<String,Object>> getByEntityLimit(T vo,int length){
		return dao.getByEntityLimit(vo, length);
	}
	
	public List<T> getByEntityLimitToEntity(T vo,int length){
		return dao.getByEntityLimitToEntity(vo, length);
		
	}

	public SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}

	@Override
	public PageInfo<?> getPager(Map<String,Object> map, Integer currePage, Integer pageSize) {
		PageHelper.startPage(currePage, pageSize);
		List<?> appsList = dao.getByEntity(map,newEntity());
		PageInfo<?> appsPageInfo = new PageInfo<>(appsList);
		return appsPageInfo;
	}
	
	public <DAO>DAO getDAO(Class<DAO> clazz) {
		return getSession().getMapper(clazz);
	}

	public <SV>SV getService(Class<SV> clazz) {
		return ctx.getBean(clazz);
	}

	@Override
	public void setApplicationContext(ApplicationContext ctx) throws BeansException {
		this.ctx=ctx;
	}

	private T newEntity() {
		try {
			Type genType = getClass().getGenericSuperclass();  
	        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();  
	        String className=params[0].getTypeName();
			@SuppressWarnings("unchecked")
			Class<T> c=(Class<T>) Class.forName(className);
			return c.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
