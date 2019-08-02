package com.fumin.role.demo.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.service.AdminService;
import com.fumin.role.demo.util.ShiroRealm;

@Service
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService {

	@Override
	public void add(Admin entity) {
		entity.setPassword(ShiroRealm.getPassword(entity.getUsername(),entity.getPassword()));
		super.add(entity);
	}
	
	//@Cacheable(cacheNames= {"adminForId"})
	@Override
	public Admin get(Object id) {
		return super.get(id);
	}
	
	//@CacheEvict(cacheNames= {"adminForId"})
	@Override
	public void delete(Object id) {
		super.delete(id);
	}
	
	//@CachePut(cacheNames= {"adminForId"},key="#entity.id")
	@Override
	public void update(Admin entity) {
		if(!StringUtils.isEmpty( entity.getPassword())) {
			entity.setPassword(ShiroRealm.getPassword(entity.getUsername(),entity.getPassword()));
		}else {
			entity.setPassword(null);
		}
		super.update(entity);
	}
}
