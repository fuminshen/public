package com.fumin.distribution;

import java.lang.reflect.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.CodeSignature;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fumin.distribution.service.impl.AdminServiceImpl;
import com.fumin.distribution.vo.Admin;

@Aspect
@Configuration
public class CompanyValidAop {

	@Pointcut("execution(public com.github.pagehelper.PageInfo com.ipc.gold.service..*.*(..)) || execution(public java.util.List com.ipc.gold.service..*.*(..))")
    public void serviceAop(){}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Around("serviceAop()")
	public Object before(ProceedingJoinPoint joinPoint) throws Throwable{
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpSession session = attributes.getRequest().getSession();
        Admin admin = (Admin) session.getAttribute(AdminServiceImpl.LOGIN_KEY);
        
        Object[] obj = joinPoint.getArgs();
        if(admin!=null && admin.getCompanyId()!=null && admin.getCompanyId()>1) {
        	Object target = joinPoint.getTarget();
            Class c = target.getClass();
    		Type t = c.getGenericSuperclass();
    		if (t instanceof ParameterizedType) {
                Type[] p = ((ParameterizedType) t).getActualTypeArguments();
                c=(Class) p[0];
                Field[] fields = c.getDeclaredFields();
                for(Field f:fields) {
                	if(f.getName().equals("companyId")) {
                		String[] paramNames = ((CodeSignature)joinPoint.getSignature()).getParameterNames();
                		if(paramNames[0].equals("map")) {
                			Map<String,Object> map = (Map<String, Object>) obj[0];
                    		if(map==null) {
                    			map = new HashMap<String,Object>();
                    		}
                    		map.put("companyId", admin.getCompanyId());
                    		obj[0]=map;
                		}else if(paramNames[0].equals("vo")){
                			Object vo = obj[0];
                			Class c1;
                			if(vo==null) {
                				c1=c;
                				vo = c1.newInstance();
                			}else {
                				c1 = vo.getClass();
                			}
                			
                			Field[] fields1 = c1.getDeclaredFields();
                			for(Field f1:fields1) {
	                			if(f1.getName().equals("companyId")) {
	                				f1.setAccessible(true);
	                				f1.set(vo, admin.getCompanyId());
	                			}
                			}
                			obj[0]=vo;
                		}
                		break;
                	}
                }
    		}
        }
		return joinPoint.proceed(obj);
	}
}
