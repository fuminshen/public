package com.fumin.distribution.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fumin.distribution.service.AdminService;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Admin;

@Service
@Transactional
public class AdminServiceImpl extends ServiceImpl<Admin> implements AdminService {
	public static final String LOGIN_KEY="admin";
	public static Admin getCurrentUser(){
	      HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	      Admin user = (Admin)request.getSession().getAttribute(LOGIN_KEY);
	      return user;
	   }
	
	public void login(Admin admin) {
		if(admin==null) {
			throw new IpcException("非法登录");
		}
		if(admin.getUsername()==null || admin.getUsername().trim().length()==0) {
			throw new IpcException("用户名不能为空");
		}
		if(admin.getPassword()==null || admin.getPassword().trim().length()==0) {
			throw new IpcException("密码不能为空");
		}
		List<Admin> list = getByEntityLimitToEntity(admin, 1);
		if(list == null || list.isEmpty()) {
			throw new IpcException("用户名和密码不匹配");
		}
		Admin admin1 = list.get(0);
		admin1.setPassword(null);
		session.setAttribute(LOGIN_KEY, admin1);
	}
	
	public void logout() {
		session.removeAttribute(LOGIN_KEY);
	}
}
