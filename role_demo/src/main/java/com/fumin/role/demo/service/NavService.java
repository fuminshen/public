package com.fumin.role.demo.service;

import java.util.List;

import com.fumin.role.demo.bean.Nav;

public interface NavService extends BaseService<Nav> {

	public List<Nav> getAll();
	
	public List<Nav> getByRole(Integer roleId);
	
	public void setForRole(Integer roleId,Integer navId);
	
	public void delForRole(Integer roleId,Integer navId);
}
