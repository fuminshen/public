package com.fumin.role.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.role.demo.ExceptionsHandler;

@Controller
public class NotFoundController implements ErrorController {
 
    @RequestMapping(value = {"/error"})
    @ResponseBody
    public Object error(HttpServletRequest request,HttpServletResponse response) {
    	String msg;
    	if(response.getStatus() == 404) {
    		msg = "不存在的路径";
    	}else if(response.getStatus() == 500){
    		msg = "致命错误500";
    	}else {
    		msg = "致命错误"+String.valueOf(response.getStatus());
    	}
    	if (ExceptionsHandler.isAjax(request)) {
            return "{'state':'1','msg':'"+msg+"'}";
        }else {
        	ModelAndView modelAndView = new ModelAndView();
        	if(response.getStatus() == 404) {
        		modelAndView.setViewName("public/error");
        	}else {
        		modelAndView.setViewName("public/exception");
        	}
            modelAndView.addObject("message", msg);
            return modelAndView;
        }
    }

	@Override
	public String getErrorPath() {
		return "/error";
	}
}
