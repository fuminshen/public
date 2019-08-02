package com.fumin.role.demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.role.demo.util.FmException;

@ControllerAdvice
public class ExceptionsHandler {
	Logger logger = LoggerFactory.getLogger(getClass());

	@ExceptionHandler(Exception.class)//可以直接写@ExceptionHandler,不指明异常类，会自动映射
    public ModelAndView customExceptionHnadler(Exception exception,HttpServletRequest reqest,HttpServletResponse response) throws IOException{ //还可以声明接收其他任意参数
		String errMsg = exception.getMessage();
		
		if(!(exception instanceof FmException)) {
			if( exception instanceof DataAccessException) {
				Throwable rootCause = ((DataAccessException) exception).getRootCause();
				if(rootCause instanceof SQLIntegrityConstraintViolationException) {
					errMsg = rootCause.getMessage()
							.replace("Duplicate entry", "数据")
							.replace("for key", "在");
					errMsg += "中存在重复";
				}else {
					errMsg = rootCause.getMessage();
					rootCause.printStackTrace();
				}
			}else if(exception instanceof UnauthorizedException){
				errMsg = "权限不足";
			}
			else{
				exception.printStackTrace();
			}
			
		}
		
		if (isAjax(reqest)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            //具体操作
            writer.write("{'state':'1','msg':'"+errMsg.replaceAll("'", "\\\\'")+"'}");
            writer.flush();
            writer.close();
            return null;
        }else {
        	logger.error(exception.getMessage());
	        ModelAndView modelAndView = new ModelAndView("error");
	        modelAndView.setViewName("public/error");
	        modelAndView.addObject("message",errMsg);
	        return modelAndView;
        }
    }
    
    public static boolean isAjax(HttpServletRequest httpRequest) {
        return (httpRequest.getHeader("X-Requested-With") != null
                && "XMLHttpRequest"
                .equals(httpRequest.getHeader("X-Requested-With").toString()));
    }
}