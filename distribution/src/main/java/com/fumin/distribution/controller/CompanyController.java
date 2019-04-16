package com.fumin.distribution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.service.impl.AdminServiceImpl;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Admin;
import com.fumin.distribution.vo.Company;

@Controller
@RequestMapping("/company")
public class CompanyController extends PageController<Company> {

	@Override
	public boolean valid(Company t) {
		if(t.getName()==null || t.getName().trim().length()==0) {
			throw new IpcException("公司名不能为空");
		}
		return true;
	}
	
	
	@Override
	public String update(Company t) {
		if(t==null) {
			throw new IpcException("数据为空");
		}
		if(!valid(t)) {
			throw new IpcException("数据验证失败"); 
		}
		if(service.update(t)) {
			Admin admin = AdminServiceImpl.getCurrentUser();
			if(admin.getCompanyId()!=null && admin.getCompanyId()>1) {
				return "redirect:/company/get/"+t.getId()+"?companyUpdate=1";
			}else {
				return "redirect:/company/index";
			}
		}else {
			throw new IpcException("编辑失败");
		}
	}
}
