package com.fumin.foodview.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.fumin.food.entity.Items;
import com.fumin.food.feign.FoodFeignService;

@RestController
public class ItemsController {
	@Autowired
	private LoadBalancerClient loadBalancerClient;
	@Autowired
	private FoodFeignService foodFeignService;
	
	private static Logger logger =  LoggerFactory.getLogger(ItemsController.class);
	
	@GetMapping("/item/{id}")
	public Items getItems(@PathVariable(name="id") Integer id) {
		//logger.debug("port="+loadBalancerClient.choose("eureka-food").getPort());
		return foodFeignService.getItems(id);
	}
}
