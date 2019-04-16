package com.fumin.distribution;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fumin.distribution.util.IpcInterceptor;
import com.fumin.distribution.util.JsonStringToListPayConvert;
import com.fumin.distribution.util.JsonStringToMapConvert;
import com.fumin.distribution.util.WebFilter;

@Configuration
public class WebConfiguration implements WebMvcConfigurer {
	@Value("${config.uploadpath}")
	private String uploadPath;
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration interceptor = registry.addInterceptor(new IpcInterceptor());
        /**
         * 添加拦截的路径
         * /为根路径
         * /*为一级路径
         * /** 为所有路径包括多级
         */
        interceptor.addPathPatterns("/**");
        WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addConverter(new JsonStringToMapConvert());
		registry.addConverter(new JsonStringToListPayConvert());
		WebMvcConfigurer.super.addFormatters(registry);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Bean
    public FilterRegistrationBean registFilter() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new WebFilter());
        registration.addUrlPatterns("/*");
        registration.setName("UrlFilter");
        registration.setOrder(1);
        return registration;
    }
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		if(!uploadPath.equals("/")) {
			String staticMapping="/upload/**";
	        String localDirectory = "file:"+uploadPath+"/upload/";
	        registry.addResourceHandler(staticMapping).addResourceLocations(localDirectory);
		}
        
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }
}
