package com.fumin.food.controller.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class BaseController implements ApplicationContextAware {

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	private ApplicationContext ctx;

	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
	}

	public void setApplicationContext(ApplicationContext ctx) throws BeansException {
		this.ctx = ctx;
	}

	public Object getBean(String name) {
		return ctx.getBean(name);
	}

	public <T> T getBean(Class<T> clazz) {
		return ctx.getBean(clazz);
	}
}
