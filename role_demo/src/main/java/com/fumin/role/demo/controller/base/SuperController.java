package com.fumin.role.demo.controller.base;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.service.BaseService;
import com.fumin.role.demo.service.NavService;
import com.fumin.role.demo.service.impl.NavServiceImpl;
import com.fumin.role.demo.util.FmException;

public abstract class SuperController<T> extends BaseController implements ApplicationContextAware {
	private ApplicationContext ctx;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.ctx = applicationContext;
	}

	@Autowired
	protected BaseService<T> service;
	
	public <S extends BaseService<?>>S getService(Class<S> cls){
		return ctx.getBean(cls);
	}
	
	@ModelAttribute
	public void setNav(){
		NavService nav = getService(NavServiceImpl.class);
		request.setAttribute("navs", nav.getAllForNav());
	}
	
	public Admin getLoginUser() {
		Object user = SecurityUtils.getSubject().getPrincipal();
		if(user==null) {
			throw new FmException("用户未登陆或登陆超时");
		}
		return (Admin) user;
	}
}
