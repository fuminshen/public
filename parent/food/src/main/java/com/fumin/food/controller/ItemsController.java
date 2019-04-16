package com.fumin.food.controller;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.client.ServiceInstance;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.fumin.food.controller.base.SuperBaseControllor;
import com.fumin.food.entity.Items;

@RestController
@RequestMapping("/items")
public class ItemsController extends SuperBaseControllor<Items> {
	
	@GetMapping("/get/{id}")
	public Items getItems(@PathVariable("id") Long id) {
		Items items=new Items();
		items.setId(id);
		items=service.get(items);
		return items;
	}
	
	
	@GetMapping("/discovery")
	public String discovery() {
		List<String> list = client.getServices();
		String json="";
		for(String service:list) {
			List<ServiceInstance> si = client.getInstances(service);
			for(ServiceInstance s:si) {
				json+=s.getUri();
				for (Map.Entry<String, String> entry : s.getMetadata().entrySet()) {
					json += "{"+entry.getKey()+"="+entry.getValue()+"}";
				}
				json+="<br>";
			}
		}
		return json;
	}
}
