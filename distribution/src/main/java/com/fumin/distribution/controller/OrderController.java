package com.fumin.distribution.controller;

import java.io.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.service.*;
import com.fumin.distribution.service.impl.*;
import com.fumin.distribution.util.*;
import com.fumin.distribution.vo.*;

@Controller
@RequestMapping("/order")
public class OrderController extends PageController<Order> {
	
	@SuppressWarnings("unchecked")
	@Override
	@GetMapping("/get/{id}")
	public ModelAndView get(@PathVariable("id")Serializable id) {
		Order order = new Order();
		order.setId(Long.valueOf(id.toString()));
		order = service.get(order);
		if(order == null) {
			throw new IpcException("找不到相应订单");
		}
		
		Client client=new Client();
		if(order.getClientId()!=null) {
			Service<Client> clientSer = (Service<Client>) getBean("clientServiceImpl");
			client.setId(order.getClientId());
			client = clientSer.get(client);
			if(client==null) {
				throw new IpcException("客户信息错误，未找到相应客户");
			}
		}
		
		
		ModelAndView model = new ModelAndView("order_info");
		model.addObject("order", order);
		model.addObject("client", client);
		return model;
	}
	
	
	@PostMapping("/deposit")
	public String add(Order order,ModelAndView model) {
		if(session.getAttribute("add_order_token")!=null) {
			if(request.getParameter("add_order_token").equals(session.getAttribute("add_order_token"))) {
				throw new IpcException("重复提交");
			}
		}
		
		valid(order);
		
		order.setAdminId(AdminServiceImpl.getCurrentUser().getId());
		
		if( service.add(order) ) {
			session.setAttribute("add_order_token",request.getParameter("add_order_token"));
			return "order_success";
		}
		throw new IpcException("下单失败请稍后再试");
	}
	
	@InitBinder("order")
    public void orderBinder(WebDataBinder webDataBinder){
        webDataBinder.setFieldDefaultPrefix("order.");
    }
	
	@GetMapping("/new")
	public String news() {
		if(request.getParameter("orderType")==null || request.getParameter("orderType").trim().length()==0) {
			session.removeAttribute("chooseClient");
		}
		ProductService productSev = getBean(ProductService.class);
		request.setAttribute("products", productSev.getByEntityLimitToEntity(new Product(), 9999) );
		return "order_add";
	}
	

	@Override
	public boolean valid(Order order) {
		String action=request.getServletPath();
		action=action.substring(action.lastIndexOf("/")+1);
		if(action.equals("deposit")) {
			if(order.getCount()==null) {
				throw new IpcException("购买数量不能为空");
			}
			if(order.getProductId()==null) {
				throw new IpcException("没有选择购买的产品");
			}
			if(order.getClientId()==null) {
				throw new IpcException("没有选择业务员");
			}
		}else {
			if(order.getId()==null) {
				throw new IpcException("数据错误");
			}
		}
		return true;
	}
	
}

