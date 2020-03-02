package com.fumin.role.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fumin.role.demo.bean.Nav;
import com.fumin.role.demo.bean.Role;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.NavService;
import com.fumin.role.demo.service.impl.NavServiceImpl;
import com.fumin.role.demo.util.FmException;

@RequiresPermissions("3")
@Controller
@RequestMapping("/role")
public class RoleController extends PageController<Role> {

	@Override
	public boolean valid(Role t) {
		if(StringUtils.isEmpty(t.getName())) {
			throw new FmException("名称不能为空");
		}
		return true;
	}
	
	@GetMapping("/seturl/{id}")
	public String setRole(@PathVariable("id")Integer id) {
		Role role = service.get(id);
		if(role==null) {
			throw new FmException("没有找到相应的角色");
		}
		NavService navService = getService(NavServiceImpl.class);
		List<Nav> byRole = navService.getByRole(id);
		request.setAttribute("rolenavs", byRole);
		request.setAttribute("role", role);
		return "role_nav";
	}
	
	@ResponseBody
	@PostMapping("/addnav")
	public String addNav(@RequestParam("roleId")Integer roleId,@RequestParam("navId")Integer navId) {
		NavServiceImpl navService = getService(NavServiceImpl.class);
		navService.setForRole(roleId, navId);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/removenav")
	public String removeNav(@RequestParam("roleId")Integer roleId,@RequestParam("navId")Integer navId) {
		NavServiceImpl navService = getService(NavServiceImpl.class);
		navService.delForRole(roleId, navId);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/navlist")
	public Object page() {
		Map<String,Object> map = new HashMap<String, Object>();
		NavServiceImpl navService = getService(NavServiceImpl.class);
		map.put("data",navService.getAll());
		return map;
	}
}
