package com.fumin.distribution.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.distribution.vo.Menu;

public class IpcInterceptor implements HandlerInterceptor {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(modelAndView!=null ) {
			modelAndView.addObject("nav", Menu.menu);
			String viewName=modelAndView.getViewName();
			if(viewName!=null && !viewName.matches("(public/.*)|error")
					&& !viewName.startsWith("redirect:/")) {
				modelAndView.addObject("viewName", viewName);
				if(modelAndView.getModelMap().get("isModal")!=null) {
					modelAndView.setViewName("public/modal");
				}else {
					modelAndView.setViewName("public/iframe");
				}
			}
		}
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
