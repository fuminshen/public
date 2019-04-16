package com.fumin.food.controller.base;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import com.fumin.food.service.ServiceBase;

public class SuperBaseControllor<T> extends BaseController {
	@Autowired
	protected ServiceBase<T> service;

	@Autowired
	protected DiscoveryClient client;

}
