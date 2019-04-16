package com.fumin.food.feign.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import com.fumin.food.entity.Items;
import com.fumin.food.feign.FoodFeignService;

@Component
public class HystrixFallbackForFeign implements FoodFeignService {
	private final static Logger logger = LoggerFactory.getLogger(HystrixFallbackForFeign.class);

	@Override
	public Items getItems(Integer id) {
		logger.error("错误"+FoodFeignService.class);
		return null;
	}



}
