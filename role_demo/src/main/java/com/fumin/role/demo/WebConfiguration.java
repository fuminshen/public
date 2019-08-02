package com.fumin.role.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fumin.role.demo.util.JsonStringToMapConvert;

@Configuration
public class WebConfiguration implements WebMvcConfigurer {
	
	/**
	 * 添加接收参数的转换方法
	 */
	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addConverter(new JsonStringToMapConvert());
		//registry.addConverter(new JsonStringToListPayConvert());
		WebMvcConfigurer.super.addFormatters(registry);
	}
	
}
