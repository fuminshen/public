package com.fumin.distribution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Product;

@Controller
@RequestMapping("/product")
public class ProductController extends PageController<Product> {

	@Override
	public boolean valid(Product t) {
		if(t.getName()==null || t.getName().trim().length()==0) {
			throw new IpcException("产品名不能为空");
		}
		if(t.getPrice()==null || t.getPrice().doubleValue()<=0) {
			throw new IpcException("产品单价不能为空");
		}
		if(t.getAdCommission()==null || t.getAdCommission()<=0) {
			throw new IpcException("推广佣金不能为空");
		}
		if(t.getPayCommission()==null || t.getPayCommission()<=0) {
			throw new IpcException("销售佣金不能为空");
		}
		return true;
	}
	
}
