package com.fumin.role.demo.controller;

import java.io.Serializable;
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
import org.springframework.web.servlet.ModelAndView;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.AdminService;
import com.fumin.role.demo.service.BaseService;
import com.fumin.role.demo.service.ClientService;
import com.fumin.role.demo.service.impl.TerminalServiceImpl;
import com.fumin.role.demo.util.FmException;
import com.fumin.role.demo.util.ShiroRealm;
import com.github.pagehelper.PageInfo;

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
	
	@RequiresPermissions("5")
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
	
	@RequiresPermissions("5")
	@GetMapping("/modal")
	public String modalList() {
		return "client_modal";
	}
	
	@GetMapping("/distribute")
	public String clientAdminDistribute() {
		return "client_admin_distribute";
	}
	
	@GetMapping("/distribute/clear")
	public String clearDistribute() {
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		Integer companyId=null;
		if(admin.getCompanyId()!=null && admin.getCompanyId()>0) {
			companyId=admin.getCompanyId();
		}
		((ClientService)service).clearDistribute(companyId);
		request.setAttribute("msg", "已分配的客户全部清空");
		return "public/success";
	}
	
	@GetMapping("/distribute/asc")
	public String setDistributeAsc() {
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		Integer companyId=null;
		if(admin.getCompanyId()!=null && admin.getCompanyId()>0) {
			companyId=admin.getCompanyId();
		}
		((ClientService)service).setDistributeAsc(companyId);
		request.setAttribute("msg", "客户已按顺序平均分配完毕");
		return "public/success";
	}
	@GetMapping("/distribute/rand")
	public String setDistributeRand() {
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		Integer companyId=null;
		if(admin.getCompanyId()!=null && admin.getCompanyId()>0) {
			companyId=admin.getCompanyId();
		}
		((ClientService)service).setDistributeRand(companyId);
		request.setAttribute("msg", "客户已随机平均分配完毕");
		return "public/success";
	}
	
	@GetMapping("/distribute/list")
	public String distributeManualList() {
		AdminService adminService = getService(AdminService.class);
		Admin self = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		Admin admin = new Admin();
		admin.setRole(3);
		if(self.getCompanyId()!=null && self.getCompanyId()>0) {
			admin.setCompanyId(self.getCompanyId());
		}
		List<Admin> admins = adminService.getByEntity(admin);
		request.setAttribute("admins", admins);
		return "client_distribute_index";
	}
	
	@PostMapping("/distribute/manual")
	@ResponseBody
	public String distributeManual(@RequestParam("userId")Integer userId,@RequestParam(value = "client[]") String[] clientId) {
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		Integer companyId=null;
		if(admin.getCompanyId()!=null && admin.getCompanyId()>0) {
			companyId=admin.getCompanyId();
		}
		
		((ClientService)service).setDistributeManual(companyId,userId,clientId);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("/inspection")
	public PageInfo<?> inspectionPage(
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
		entity.put("userId", admin.getId());
		if(sortName!=null && sortName.trim().length()>0) {
			entity.put("ORDER_BY", sortName+" "+sortType);
		}
		return service.getPageToMap(entity, currePage, pageSize);
	}
	
	@GetMapping("/inspectionlist")
	public String inspection() {
		return "client_inspection_index";
	}
	
	@GetMapping("/inspection/{id}")
	public ModelAndView inspectionGetOne(@PathVariable("id")Serializable id) {
		ModelAndView m = super.get(id);
		m.setViewName("client_inspection_info");
		return m;
	}
}
