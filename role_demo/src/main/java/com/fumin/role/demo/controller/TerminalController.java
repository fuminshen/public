package com.fumin.role.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.util.FmException;

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
	
	@GetMapping("/new/{id}")
	public String news(@PathVariable("id") String id) {
		request.setAttribute("clientId", id);
		return super.news();
	}
	
	@GetMapping("/new")
	@Override
	public String news() {
		return "terminal_new";
	}
}
