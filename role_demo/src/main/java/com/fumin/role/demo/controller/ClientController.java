package com.fumin.role.demo.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.controller.base.PageController;
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
	
}
