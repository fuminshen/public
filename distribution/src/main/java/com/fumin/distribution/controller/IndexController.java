package com.fumin.distribution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fumin.distribution.controller.base.SuperBaseControllor;
import com.fumin.distribution.service.AdminService;
import com.fumin.distribution.vo.Admin;

@Controller
@RequestMapping("/")
public class IndexController extends SuperBaseControllor<Admin> {

	@GetMapping("/login")
	public String loginPage() {
		return "public/login";
	}
	
	@PostMapping("/login")
	public String login(Admin admin) {
		((AdminService)service).login(admin);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout() {
		((AdminService)service).logout();
		return "redirect:/login";
	}
	
	@GetMapping("/")
	public String index() {
		return "/index";
	}
	
	@GetMapping("/keep_alive")
	@ResponseBody
	public String keepSession() {
		return "<!DOCTYPE html>\r\n" + 
				"<html>" + 
				"<head>" + 
				"<meta http-equiv=\"refresh\" content=\"60; url=/keep_alive\">" + 
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n" + 
				"<title></title>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"</body>\r\n" + 
				"</html>";
	}
}
