package com.fumin.distribution.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.distribution.ExceptionsHandler;

@Controller
public class NotFoundController implements ErrorController {
 
    @RequestMapping(value = {"/error"})
    @ResponseBody
    public Object error(HttpServletRequest request) {
    	if (ExceptionsHandler.isAjax(request)) {
            return "{'state':'1','msg':'不存在的页面'}";
        }else {
        	ModelAndView modelAndView = new ModelAndView("error");
            modelAndView.addObject("code", "404");
            modelAndView.addObject("message", "不存在的页面");
            return modelAndView;
        }
    }

	@Override
	public String getErrorPath() {
		return "/error";
	}
}
