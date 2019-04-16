package com.fumin.food.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionsHandler {
	private final static Logger logger = LoggerFactory.getLogger(ExceptionsHandler.class); 

	@ExceptionHandler(Exception.class)//可以直接写@ExceptionHandler,不指明异常类，会自动映射
    public ModelAndView customExceptionHnadler(Exception exception,HttpServletRequest reqest,HttpServletResponse response) throws IOException{ //还可以声明接收其他任意参数
		String msg;
		if(exception instanceof org.springframework.dao.DuplicateKeyException) {
			msg = "存在重复的数据";
		}else {
			msg = exception.getMessage();
			logger.error("HelloLog4jException", exception);
		}
		if (isAjax(reqest)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            //具体操作
            writer.write("{'state':'1','msg':'"+msg.replaceAll("'", "\\\\'")+"'}");
            writer.flush();
            writer.close();
            return null;
        }else {
	        ModelAndView modelAndView = new ModelAndView("error");
	        modelAndView.addObject("message",msg);
	        return modelAndView;
        }
    }
    
    public static boolean isAjax(HttpServletRequest httpRequest) {
        return (httpRequest.getHeader("X-Requested-With") != null
                && "XMLHttpRequest"
                .equals(httpRequest.getHeader("X-Requested-With").toString()));
    }
}