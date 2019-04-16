package com.fumin.distribution;

import javax.sql.DataSource;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

import com.alibaba.druid.pool.DruidDataSource;

@SpringBootApplication
@MapperScan("com.fumin.distribution.dao") 
public class DistributionApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(DistributionApplication.class, args);
	}
	
	@Bean("dataSource")
    @ConfigurationProperties(prefix="spring.datasource")
    public DataSource druidDataSource() { return new DruidDataSource(); }
}

