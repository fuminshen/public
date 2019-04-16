package com.fumin.distribution.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fumin.distribution.service.impl.AdminServiceImpl;
import com.fumin.distribution.vo.Admin;

public class WebFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
        String path=httpRequest.getRequestURI();
        if(!path.matches("(/assets/|/js/|/img/).*|/login"))
        {
        	Admin admin = AdminServiceImpl.getCurrentUser();
        	if(admin==null) {
        		((HttpServletResponse) response).sendRedirect("/login");
        		return;
        	}
        	if(path.matches("/company/.*")) {
        		if (admin.getCompanyId()!=null && admin.getCompanyId()>1) {
        			if(!path.matches("/company/(get/"+admin.getCompanyId()+"|update)")) {
        				throw new IpcException("非法的页面");
        			}
            	}
        	}
        }
        chain.doFilter(request, response);
	}



}
