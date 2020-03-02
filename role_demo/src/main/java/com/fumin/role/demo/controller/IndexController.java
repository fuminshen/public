package com.fumin.role.demo.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.controller.base.SuperController;
import com.fumin.role.demo.util.FmException;
import com.fumin.role.demo.util.ShiroRealm;

@Controller
@RequestMapping("/")
public class IndexController extends SuperController<Admin> {

	@GetMapping("/login")
	public String index() {
		return "public/login";
	}
	
	@GetMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		subject.getSession().removeAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		return "redirect:/login";
	}
	
	@PostMapping("/loginAction")
	public String login(@RequestParam(name="username") String username,
			            @RequestParam(name="password") String password) {
		if(StringUtils.isEmpty(username)) {
			throw new FmException("请输入用户名");
		}
		if(StringUtils.isEmpty(password)) {
			throw new FmException("请输入密码");
		}
		
		Subject currenUser = SecurityUtils.getSubject();
		if(!currenUser.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(username,password);
			token.setRememberMe(false);
			try {
				currenUser.login(token);
				Object user = currenUser.getPrincipal();
				((Admin)user).setPassword(null);
				currenUser.getSession().setAttribute(ShiroRealm.ADMIN_SESSION_KEY, user);
				logger.debug("登录账户="+ user.toString());
			}catch(Exception e) {
				String msg;
				if(e instanceof IncorrectCredentialsException) {
					msg = "用户名和密码不匹配";
				}else {
					msg = e.getMessage();
				}
				throw new FmException(msg);
			}
		}
		return "redirect:/";
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
