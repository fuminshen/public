package com.fumin.role.demo.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.transaction.annotation.Transactional;

import com.fumin.role.demo.service.BaseService;
import com.fumin.role.demo.util.DataMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Transactional
public abstract class BaseServiceImpl<T> implements BaseService<T>,ApplicationContextAware {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	protected SqlSessionFactory sqlSessionFactory;
	@Autowired
	protected DataMapper<T> dao;
	
	@Autowired
	protected HttpSession session;
	
	private ApplicationContext ctx;

	@Override
	public T get(Object id) {
		return dao.selectByPrimaryKey(id);
	}
	
	@Override
	public T getForUpdate(Object id) {
		return dao.getForUpdate(id);
	}
	
	@Override
	public T getOneByEntity(T entity) {
		return dao.selectOne(entity);
	}

	@Override
	public List<T> getByEntity(T entity) {
		return dao.select(entity);
	}

	@Override
	public void update(T entity) {
		dao.updateByPrimaryKeySelective(entity);
	}

	@Override
	public void delete(Object id) {
		dao.deleteByPrimaryKey(id);
	}

	@Override
	public void add(T entity) {
		dao.insertSelective(entity);
	}

	@Override
	public PageInfo<T> getPage(T entity, int currentPage, int pageSize) {
		PageHelper.startPage(currentPage, pageSize);
		try {
			List<T> list = dao.select(entity);
			PageInfo<T> page = new PageInfo<>(list);
			return page;
		}finally {
			PageHelper.clearPage();
		}
	}
	
	public PageInfo<?> getPage(T entity, Integer currentPage, Integer pageSize, String sortName, String sortType){
		PageHelper.startPage(currentPage, pageSize);
		try {
			List<T> list = dao.getListAndOrder(entity, sortName, sortType);
			PageInfo<T> page = new PageInfo<>(list);
			return page;
		}finally {
			PageHelper.clearPage();
		}
	}
	
	public PageInfo<?> getPageToMap(Map<String, Object> map,Integer currentPage, Integer pageSize){
		PageHelper.startPage(currentPage, pageSize);
		try {
			List<Map<String,Object>> list = dao.getListToMap(map);
			PageInfo<Map<String,Object>> page = new PageInfo<>(list);
			return page;
		}finally {
			PageHelper.clearPage();
		}
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.ctx=applicationContext;
	}

	public <SV>SV getService(Class<SV> cls) {
		return ctx.getBean(cls);
	}
	
	public Object getService(String name) {
		return ctx.getBean(name);
	}
	
	public <D>D getDAO(Class<D> cls){
		return getService(cls);
	}
	
	public Object getDAO(String name) {
		return getService(name);
	}
}
