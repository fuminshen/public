package com.fumin.distribution.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Client;

@Controller
@RequestMapping("/client")
public class ClientController extends PageController<Client> {

	@Override
	public boolean valid(Client t) {
		if(t.getUsername()==null || t.getUsername().trim().length()==0) {
			throw new IpcException("客户名称不能为空");
		}
		return true;
	}
	
	@Override
	public String add(Client t) {
		String result = super.add(t);
		if(request.getParameter("orderType")!=null && request.getParameter("orderType").trim().length()>0) {
			session.setAttribute("chooseClient", t);
			return "redirect:/order/new?orderType="+request.getParameter("orderType");
		}
		else {
			return result;
		}
	}
	
	@Override
	@GetMapping("/get/{id}")
	public ModelAndView get(@PathVariable("id") Serializable id) {
		Client client = new Client();
		client.setId(Integer.valueOf( id.toString() ));
		client = service.get(client);
		
		
		ModelAndView model=new ModelAndView("client_info");
		model.addObject("vo",client);
		
		//读取上级业务员
		if(client.getParentId()!=null && client.getParentId()>0) {
			Client parent = new Client();
			parent.setId(client.getParentId());
			parent = service.get(parent);
			model.addObject("parent",parent);
		}
		
		//读取下级业务员
		Client child = new Client();
		child.setParentId(client.getId());
		List<Client> children = service.getByEntityLimitToEntity(child, 9999);
		model.addObject("children",children);
		
		return model;
	}
	
	@GetMapping("/new/{parentId}")
	public String newByParent(@PathVariable("parentId") Integer parentId) {
		if(parentId!=null &&parentId>0) {
			Client client = new Client();
			client.setId(parentId);
			client = service.get(client);
			request.setAttribute("parent", client);
		}
		return "client_info";
	}
	
	@Override
	public String news() {
		return "client_add";
	}
}
