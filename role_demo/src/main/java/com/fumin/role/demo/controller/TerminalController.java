package com.fumin.role.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.InspectionService;
import com.fumin.role.demo.service.impl.InspectionServiceImpl;
import com.fumin.role.demo.util.FmException;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/terminal")
public class TerminalController extends PageController<Terminal> {

	@Override
	public boolean valid(Terminal t) {
		if(t.getNumber()==null || t.getNumber().trim().length()==0) {
			throw new FmException("终端编号不能为空");
		}
		if(t.getClientId()==null || t.getClientId().intValue()<=0) {
			throw new FmException("商铺信息错误，请退出重新再试");
		}
		return true;
	}
	
	@GetMapping(value= { "/new/{id}","/new/terminal/{id}"})
	public String news(@PathVariable("id") String id) {
		request.setAttribute("clientId", id);
		return super.news();
	}
	
	@GetMapping("/new")
	@Override
	public String news() {
		return "terminal_new";
	}
	
	@Override
	public String add(Terminal t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(!valid(t)) {
			throw new FmException("数据验证失败"); 
		}
		
		t.setUserId(getLoginUser().getId());
		
		if( request.getHeader("Referer").lastIndexOf("new/terminal")>0 ) {
			InspectionService service2 = getService(InspectionServiceImpl.class);
			service2.terminalAdd(t);
			return "redirect:/client/inspection/"+t.getClientId();
		}else {
			service.add(t);
			return "redirect:/terminal/index";
		}
	}
	
	@Override
	public PageInfo<?> page(Map<String, Object> entity, Integer currePage, Integer pageSize, String sortName, String sortType) {
		if(currePage==null) {
			currePage=0;
		}
		if(pageSize==null) {
			pageSize=50;
		}
		if( !StringUtils.isEmpty(sortName) ) {
			if(entity==null) {
				entity = new HashMap<>();
			}
			entity.put("ORDER_BY", sortName+" "+sortType);
		}
		Admin admin = getLoginUser();
        if(admin.getCompanyId()>1) {
        	if(entity==null) {
				entity = new HashMap<>();
			}
        	entity.put("companyId", admin.getCompanyId());
        }
		return service.getPageToMap(entity, currePage, pageSize);
	}
}
