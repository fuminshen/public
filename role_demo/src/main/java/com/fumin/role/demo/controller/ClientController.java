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
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/client")
public class ClientController extends PageController<Client> {

	@Override
	public boolean valid(Client t) {
		Admin admin = getLoginUser();
		if(admin.getCompanyId()<=1) {
			throw new FmException("总地区的账号只能用于查看数据，不能用于编辑数据");
		}
		t.setCompanyId(admin.getCompanyId());
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
		String posNumber = request.getParameter("tposNumber");
		if( !StringUtils.isEmpty(tStr) ) {
			if( StringUtils.isEmpty(tnumber) || StringUtils.isEmpty(posNumber) ) {
				throw new FmException("添加终端时，终端编号不能为空");
			}
		}
		
		super.add(t);
		if( !StringUtils.isEmpty(tnumber) ) {
			BaseService<Terminal> service2 = getService(TerminalServiceImpl.class);
			Terminal ter = new Terminal();
			ter.setClientId(t.getId());
			ter.setNumber(tnumber);
			ter.setPosNumber(posNumber);
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
		Admin admin = getLoginUser();
		if(admin.getCompanyId()==null || admin.getCompanyId()<=1) {
			throw new FmException("总地区的账号不能分配任务，请用具体地区的账号分配任务");
		}
		((ClientService)service).clearDistribute(admin.getCompanyId());
		request.setAttribute("msg", "已分配的客户全部清空");
		return "public/success";
	}
	
	@GetMapping("/distribute/asc")
	public String setDistributeAsc() {
		Admin admin = getLoginUser();
		if(admin.getCompanyId()==null || admin.getCompanyId()<=1) {
			throw new FmException("总地区的账号不能分配任务，请用具体地区的账号分配任务");
		}
		((ClientService)service).setDistributeAsc(admin.getCompanyId());
		request.setAttribute("msg", "客户已按顺序平均分配完毕");
		return "public/success";
	}
	@GetMapping("/distribute/rand")
	public String setDistributeRand() {
		Admin admin = getLoginUser();
		if(admin.getCompanyId()==null || admin.getCompanyId()<=1) {
			throw new FmException("总地区的账号不能分配任务，请用具体地区的账号分配任务");
		}
		((ClientService)service).setDistributeRand(admin.getCompanyId());
		request.setAttribute("msg", "客户已随机平均分配完毕");
		return "public/success";
	}
	@GetMapping("/inspection/clear")
	public String clearInspection() {
		Admin admin = getLoginUser();
		if(admin.getCompanyId()==null || admin.getCompanyId()<=1) {
			throw new FmException("总地区的账号不能分配任务，请用具体地区的账号分配任务");
		}
		((ClientService)service).clearInspection(admin.getCompanyId());
		request.setAttribute("msg", "巡检状态已全部归零");
		return "public/success";
	}
	
	@GetMapping("/distribute/list")
	public String distributeManualList() {
		AdminService adminService = getService(AdminService.class);
		Admin self = getLoginUser();
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
		Admin admin = getLoginUser();
		if(admin.getCompanyId()==null || admin.getCompanyId()<=1) {
			throw new FmException("总地区的账号不能分配任务，请用具体地区的账号分配任务");
		}
		
		((ClientService)service).setDistributeManual(admin.getCompanyId(),userId,clientId);
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
		Admin admin = getLoginUser();
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
		BaseService<Terminal> tSer = getService(TerminalServiceImpl.class);
		Terminal t= new Terminal();
		t.setClientId(Integer.parseInt(id.toString()));
		List<Terminal> tList = tSer.getByEntity(t);
		m.addObject("terminals", tList);
		return m;
	}
}
