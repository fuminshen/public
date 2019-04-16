package com.fumin.distribution.service;

import com.fumin.distribution.vo.Admin;

public interface AdminService extends Service<Admin>{
	public void login(Admin admin);
	
	public void logout();
}
