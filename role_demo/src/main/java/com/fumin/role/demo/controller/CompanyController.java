package com.fumin.role.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Company;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.util.FmException;
import com.fumin.role.demo.util.ShiroRealm;

@Controller
@RequestMapping("/company")
public class CompanyController extends PageController<Company> {

	@Override
	public boolean valid(Company t) {
		if(t.getName()==null || t.getName().trim().length()==0) {
			throw new FmException("地区名不能为空");
		}
		return true;
	}
	
	
	@Override
	public String update(Company t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(!valid(t)) {
			throw new FmException("数据验证失败"); 
		}
		service.update(t);
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		if(admin.getCompanyId()!=null && admin.getCompanyId()>1) {
			return "redirect:/company/get/"+t.getId()+"?companyUpdate=1";
		}else {
			return "redirect:/company/index";
		}
	}
}
