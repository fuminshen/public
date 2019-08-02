package com.fumin.role.demo.aop;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
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

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.util.FmException;
import com.fumin.role.demo.util.ShiroRealm;

/**
 * 不同分公司区分显示各自数据的注入
 * @author fm
 *
 */
@Aspect
@Configuration
public class CompanyValidAop {

	@Pointcut("execution(public com.github.pagehelper.PageInfo com.ipc.gold.free.service..*.*(..)) || execution(public java.util.List com.ipc.gold.free.service..*.*(..))")
    public void serviceAop(){}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Around("serviceAop()")
	public Object before(ProceedingJoinPoint joinPoint) throws Throwable{
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpSession session = attributes.getRequest().getSession();
        
        Integer companyId;
        
        Admin admin1 = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
        if(admin1==null) {
        	throw new FmException("登录信息错误");
        }else {
        	companyId = admin1.getCompanyId();
        }
        
        Object[] obj = joinPoint.getArgs();
        if(companyId>1) {
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
                    		map.put("companyId", companyId);
                    		obj[0]=map;
                		}else if(paramNames[0].equals("entity")){
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
	                				f1.set(vo, companyId);
	                			}
                			}
                			obj[0]=vo;
                		}else if(obj[0] instanceof Map) {
                			Map<String,Object> map = (Map<String, Object>) obj[0];
                    		if(map==null) {
                    			map = new HashMap<String,Object>();
                    		}
                    		map.put("companyId", companyId);
                    		obj[0]=map;
                		}
                		break;
                	}
                }
    		}
        }
		return joinPoint.proceed(obj);
	}
}
