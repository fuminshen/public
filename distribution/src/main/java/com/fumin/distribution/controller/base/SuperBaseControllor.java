package com.fumin.distribution.controller.base;

import org.springframework.beans.factory.annotation.Autowired;

import com.fumin.distribution.service.Service;

public class SuperBaseControllor<T> extends BaseController {
	@Autowired
	protected Service<T> service;

}
