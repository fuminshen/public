package com.fumin.role.demo.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.util.Strings;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.util.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Company;
import com.fumin.role.demo.bean.Inspection;
import com.fumin.role.demo.controller.base.PageController;
import com.fumin.role.demo.service.AdminService;
import com.fumin.role.demo.service.InspectionService;
import com.fumin.role.demo.service.impl.CompanyServiceImpl;
import com.fumin.role.demo.util.FmException;
import com.fumin.role.demo.util.ShiroRealm;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/inspection")
public class InspectionController extends PageController<Inspection> {

	@Override
	public boolean valid(Inspection data) {
		if(data.getClientId()==null || data.getClientId().intValue()<=0) {
			throw new FmException("没有选择巡检客户");
		}
		if(data.getType()==null || data.getType().intValue()<=0) {
			throw new FmException("没有设定正确的巡检类型");
		}
		return true;
	}

	@Override
	public String add(Inspection t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(!valid(t)) {
			throw new FmException("数据验证失败"); 
		}
		
		Admin admin = (Admin) session.getAttribute(ShiroRealm.ADMIN_SESSION_KEY);
		t.setUserId(admin.getId());
		t.setCompanyId(admin.getCompanyId());
		
		service.add(t);
		
		return "redirect:/client/inspection/"+t.getClientId();
	}
	
	@Override
	public PageInfo<?> page(
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
		if(admin.getRole().intValue()==3) {
			entity.put("userId", admin.getId());
		}
		if( entity.get("username")!=null && !StringUtils.isEmpty(entity.get("username")) ) {
			entity.put("username", entity.get("username").toString()+"%");
		}
		
		if(sortName!=null && sortName.trim().length()>0) {
			entity.put("ORDER_BY", sortName+" "+sortType);
		}
		return service.getPageToMap(entity, currePage, pageSize);
	}
	
	@GetMapping("/totals")
	public String inspectionTotals() {
		CompanyServiceImpl service2 = getService(CompanyServiceImpl.class);
		Company c = new Company();
		List<Company> companys = service2.getByEntity(c);
		request.setAttribute("companys", companys);
		
		AdminService service3 = getService(AdminService.class);
		Admin a = new Admin();
		a.setRole(3);
		Admin admin = getLoginUser();
		if(admin.getCompanyId()>1) {
			a.setCompanyId(admin.getCompanyId());
		}
		List<Admin> admins = service3.getByEntity(a);
		request.setAttribute("admins", admins);
		
		return "inspection_totals";
	}
	
	@PostMapping("/totals/download")
	@ResponseBody
	public String inspectionTotalsDownload(@RequestParam Map<String, Object> entity) throws IOException {
		if(entity!=null) {
			Collection<Object> values = entity.values();
			Iterator<Object> iterator = values.iterator();
			while(iterator.hasNext()) {
				Object next = iterator.next();
				if(next==null || Strings.isEmpty(next.toString())) {
					iterator.remove();
				}
			}
		}
		Workbook book = ((InspectionService)service).getPageToMapTotalsDownload(entity);
		if(book==null) {
			throw new FmException("Excel文件生成失败");
		}
		response.setHeader("Content-Disposition", new String(("attachment;filename=excel.xlsx").getBytes(), "UTF8"));
		IOUtils.writeAndClose(book, response.getOutputStream());
		return null;
	}
	
	@PostMapping("/totalslist")
	@ResponseBody
	public PageInfo<?> pageTotals(
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
		
		if(sortName!=null && sortName.trim().length()>0) {
			entity.put("ORDER_BY", sortName+" "+sortType);
		}
		return ((InspectionService)service).getPageToMapTotals(entity, currePage, pageSize);
	}
	
	@PostMapping("/totalsterminallist")
	@ResponseBody
	public PageInfo<?> pageTotalsTerminal(
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
		
		if(sortName!=null && sortName.trim().length()>0) {
			entity.put("ORDER_BY", sortName+" "+sortType);
		}
		return ((InspectionService)service).getInspectionTerminalGroupToMap(entity, currePage, pageSize);
	}
	
	@Override
	public String index() {
		CompanyServiceImpl service2 = getService(CompanyServiceImpl.class);
		List<Company> byEntity = service2.getByEntity(null);
		request.setAttribute("company", byEntity);
		return super.index();
	}
}
