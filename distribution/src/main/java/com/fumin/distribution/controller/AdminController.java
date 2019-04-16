package com.fumin.distribution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.util.MD5;
import com.fumin.distribution.vo.Admin;

@Controller
@RequestMapping("/admin")
public class AdminController extends PageController<Admin> {

	@Override
	public boolean valid(Admin admin) {
		if(admin.getUsername()==null || admin.getUsername().trim().length()==0) {
			throw new IpcException("用户名不能为空");
		}
		if(isAddAction()) {
			if(admin.getPassword()==null || admin.getPassword().trim().length()==0) {
				throw new IpcException("密码不能为空");
			}
			String password = request.getParameter("repassword");
			if(password==null || password.trim().length()==0) {
				throw new IpcException("校验密码不能为空");
			}
			password="`~"+MD5.getEncode(password)+"`~";
			if(!admin.getPassword().equals(password) ) {
				throw new IpcException("校验密码不一致");
			}
		}
		return true;
	}
}
