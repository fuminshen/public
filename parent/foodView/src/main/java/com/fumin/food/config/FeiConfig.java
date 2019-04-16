package com.fumin.food.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RoundRobinRule;

import feign.Logger;

@Configuration
public class FeiConfig {

	@Bean
    Logger.Level feignLoggerLevel() {
        return Logger.Level.FULL;
    }
	
	@Bean
	public IRule getRule() {
		return new RoundRobinRule();
	}
}
