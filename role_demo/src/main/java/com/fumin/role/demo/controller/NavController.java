package com.fumin.role.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fumin.role.demo.bean.Nav;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.NavService;
import com.fumin.role.demo.util.FmException;
import com.github.pagehelper.PageInfo;

@RequiresPermissions("2")
@Controller
@RequestMapping("/nav")
public class NavController extends PageController<Nav> {

	@Override
	public boolean valid(Nav t) {
		if(StringUtils.isEmpty(t.getName())) {
			throw new FmException("菜单名不能为空");
		}
		return true;
	}
	
	@RequestMapping("/list1")
	@Override
	public PageInfo<?> page(Map<String, Object> entity, Integer currePage, Integer pageSize, String sortName,
			String sortType) {
		return null;
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public Object page() {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("data",((NavService)service).getAll());
		return map;
	}
}
