package com.fumin.role.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.bean.Inspection;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.ClientService;
import com.fumin.role.demo.util.FmException;
import com.fumin.role.demo.util.ShiroRealm;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/inspection")
public class InspectionController extends PageController<Inspection> {

	@Override
	public boolean valid(Inspection data) {
		if(data.getClientId()==null || data.getClientId().intValue()<=0) {
			throw new FmException("没有选择巡检客户");
		}
		if(data.getType()==null || data.getType().intValue()<=0) {
			throw new FmException("没有设定正确的巡检类型");
		}
		return true;
	}

	@Override
	public String add(Inspection t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(!valid(t)) {
			throw new FmException("数据验证失败"); 
		}
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		t.setUserId(admin.getId());
		t.setCompanyId(admin.getCompanyId());
		
		service.add(t);
		
		Client client = new Client();
		client.setId(t.getClientId());
		client.setIsChecked(1);
		ClientService service2 = getService(ClientService.class);
		service2.update(client);
		return "redirect:/client/inspection/"+t.getClientId();
	}
	
	@Override
	public PageInfo<?> page(
			@RequestParam(value="map",required=false)Map<String, Object> entity,
			@RequestParam(value="page",required=false)Integer currePage,
			@RequestParam(value="rows",required=false)Integer pageSize,
			@RequestParam(value="sidx",required=false)String sortName,
			@RequestParam(value="sord",required=false)String sortType) {
		if(currePage==null) {
			currePage=0;
		}
		if(pageSize==null) {
			pageSize=50;
		}
		if(entity==null) {
			entity = new HashMap<>();
		}
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		if(admin.getRole().intValue()==3) {
			entity.put("userId", admin.getId());
		}
		
		if(sortName!=null && sortName.trim().length()>0) {
			entity.put("ORDER_BY", sortName+" "+sortType);
		}
		return service.getPageToMap(entity, currePage, pageSize);
	}
}
