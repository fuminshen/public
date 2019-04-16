package com.fumin.food.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.fumin.food.entity.Items;
import com.fumin.food.feign.impl.HystrixFallbackForFeign;

@FeignClient(value="EUREKA-FOOD",fallbackFactory=HystrixFallbackForFeign.class)
public interface FoodFeignService {

	@GetMapping("/items/get/{id}")
	public Items getItems(@PathVariable(name="id") Integer id);
}
