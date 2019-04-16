package com.fumin.foodview;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

import com.fumin.food.feign.impl.HystrixFallbackForFeign;
import com.netflix.hystrix.contrib.metrics.eventstream.HystrixMetricsStreamServlet;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients(basePackages = { "com.fumin.food" })
public class FoodViewApplication {

	public static void main(String[] args) {
		SpringApplication.run(FoodViewApplication.class, args);
	}

	@Bean
	public HystrixFallbackForFeign getHystrixFallbackForFeign() {
		return new HystrixFallbackForFeign();
	}

	// 增加HystrixDashboard监控路径映射
	@SuppressWarnings({"rawtypes","unchecked"})
	@Bean
	public ServletRegistrationBean getServlet() {
		HystrixMetricsStreamServlet hmss = new HystrixMetricsStreamServlet();
		ServletRegistrationBean srb = new ServletRegistrationBean(hmss);
		srb.setLoadOnStartup(1);
		srb.addUrlMappings("/hystrix.stream");
		// srb.addUrlMappings("/turbine.stream");
		srb.setName("HystrixMetricsStreamServlet");
		return srb;
	}
}
