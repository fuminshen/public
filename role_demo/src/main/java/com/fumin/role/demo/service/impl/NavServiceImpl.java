package com.fumin.role.demo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.fumin.role.demo.bean.Nav;
import com.fumin.role.demo.mapper.NavMapper;
import com.fumin.role.demo.service.NavService;

@Service
public class NavServiceImpl extends BaseServiceImpl<Nav> implements NavService {
	
	@CacheEvict(cacheNames= {"navigation"},key="caches[0].name")
	@Override
	public void add(Nav entity) {
		super.add(entity);
	}
	
	//@Cacheable(cacheNames= {"navigation"},key="#id", unless="#result == null")
	@Override
	public Nav get(Object id) {
		NavService ns = getService(NavServiceImpl.class);
		List<Nav> all = ns.getAll();
		int idi = Integer.parseInt(id.toString());
		for(Nav nav:all) {
			if(nav.getId().equals(idi)) {
				return nav;
			}
		}
		return null;
	}
	
	@CacheEvict(cacheNames= {"navigation"},key="caches[0].name")
	@Override
	public void delete(Object id) {
		super.delete(id);
	}
	
	@CacheEvict(cacheNames= {"navigation"},key="caches[0].name")
	@Override
	public void update(Nav entity) {
		super.update(entity);
	}

	@Override
	public List<Nav> getByEntity(Nav entity) {
		NavService ns = getService(NavServiceImpl.class);
		List<Nav> navs = ns.getAll();
		List<Nav> newNav = new ArrayList<>();
		for(Nav nav:navs) {
			if(entity.getId()!=null && entity.getId().intValue()!=nav.getId().intValue()) {
				continue;
			}
			if(entity.getParent()!=null && entity.getParent().intValue()!=nav.getParent().intValue()) {
				continue;
			}
			if(entity.getHide()!=null && entity.getHide().intValue()!=nav.getHide().intValue()) {
				continue;
			}
			if(entity.getName()!=null && entity.getName().equals(nav.getName()) ) {
				continue;
			}
			if(entity.getUrl() !=null && entity.getUrl().equals(nav.getUrl()) ) {
				continue;
			}
			newNav.add(nav);
		}
		return newNav;
	}
	
	@Cacheable(cacheNames= {"navigation"},key="caches[0].name")
	@Override
	public List<Nav> getAll() {
		return dao.selectAll();
	}

	@Override
	public List<Nav> getByRole(Integer roleId) {
		return ((NavMapper)dao).getByRole(roleId);
	}
	
	public void setForRole(Integer roleId,Integer navId) {
		((NavMapper)dao).setForRole(roleId,navId);
	}
	
	public void delForRole(Integer roleId,Integer navId) {
		((NavMapper)dao).delForRole(roleId,navId);
	}
	
	public List<Nav> getAllForNav() {
		Nav nav = new Nav();
		nav.setHide(0);
		return dao.select(nav);
	}
	
}
