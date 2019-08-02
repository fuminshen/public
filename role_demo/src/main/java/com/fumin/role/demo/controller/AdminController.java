package com.fumin.role.demo.controller;

import java.io.Serializable;
import java.util.List;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Role;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.impl.RoleServiceImpl;
import com.fumin.role.demo.util.FmException;
import com.fumin.role.demo.util.ShiroRealm;
import com.github.pagehelper.util.StringUtil;

@Controller
@RequestMapping("/admin")
public class AdminController extends PageController<Admin> {

	@Override
	public boolean valid(Admin t) {
		
		if(StringUtil.isEmpty(t.getUsername())) {
			throw new FmException("用户名不能为空");
		}
		if(t.getRole()==null || t.getRole().intValue()<=0) {
			throw new FmException("角色权限未设置");
		}
		
		return true;
	}
	
	@RequiresAuthentication
	@GetMapping("/self")
	public ModelAndView self() {
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		return super.get(admin.getId());
	}
	
	@RequiresPermissions(value="4")
	@Override
	public String add(Admin t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(StringUtil.isEmpty(t.getPassword())) {
			throw new FmException("密码不能为空");
		}
		String repass = request.getParameter("repassword");
		if(!t.getPassword().equals(repass)) {
			throw new FmException("两次输入的密码不一致");
		}
		return super.add(t);
	}
	
	@RequiresPermissions(value="4")
	@Override
	public String index() {
		return super.index();
	}
	
	@RequiresPermissions(value="4")
	@Override
	public String del(Serializable id) {
		return super.del(id);
	}
	
	@Override
	public String update(Admin t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(!StringUtil.isEmpty(t.getPassword())) {
			String repass = request.getParameter("repassword");
			if(!t.getPassword().equals(repass)) {
				throw new FmException("两次输入的密码不一致");
			}
		}
		
		service.update(t);
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		if(t.getId().intValue()==admin.getId().intValue()) {
			admin = service.get(t.getId());
			if(admin!=null) {
				admin.setPassword(null);
				session.setAttribute(ShiroRealm.ADMIN_SESSION_KEY, admin);
			}
		}
		request.setAttribute("msg", "资料修改成功");
		return "public/success";
	}
	
	@RequiresPermissions(value="4")
	@GetMapping("/get/{id}")
	@Override
	public ModelAndView get(@PathVariable("id") Serializable id) {
		RoleServiceImpl roleService = getService(RoleServiceImpl.class);
		List<Role> roles = roleService.getByEntity(null);
		request.setAttribute("roles", roles);
		
		Object o = service.get(id);
		if(o==null) {
			throw new FmException("数据不存在");
		}
		ModelAndView model=new ModelAndView("admin_info");
		model.addObject("vo",o);
		return model;
	}
	
	@RequiresPermissions(value="4")
	@Override
	public String news() {
		RoleServiceImpl roleService = getService(RoleServiceImpl.class);
		List<Role> roles = roleService.getByEntity(null);
		request.setAttribute("roles", roles);
		return super.news();
	}
}
