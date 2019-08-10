package com.fumin.role.demo.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.BaseService;
import com.fumin.role.demo.service.impl.TerminalServiceImpl;
import com.fumin.role.demo.util.FmException;

@RequiresPermissions("5")
@Controller
@RequestMapping("/client")
public class ClientController extends PageController<Client> {

	@Override
	public boolean valid(Client t) {
		if(StringUtils.isEmpty(t.getName())) {
			throw new FmException("名称不能为空");
		}
		return true;
	}
	
	@Override
	public String add(Client t) {
		String tnumber=request.getParameter("tnumber");
		String tStr = request.getParameter("t");
		if( StringUtils.isEmpty(tnumber) && StringUtils.isEmpty(tStr) ) {
			throw new FmException("添加终端时，终端编号不能为空");
		}
		
		super.add(t);
		if( !StringUtils.isEmpty(tnumber) ) {
			BaseService<Terminal> service2 = getService(TerminalServiceImpl.class);
			Terminal ter = new Terminal();
			ter.setClientId(t.getId());
			ter.setNumber(tnumber);
			service2.add(ter);
		}
		if( !StringUtils.isEmpty(tStr) ) {
			return "redirect:/terminal/index";
		}else {
			return "redirect:/client/index";
		}
	}
	
	@GetMapping("/modal")
	public String modalList() {
		return "client_modal";
	}
}
