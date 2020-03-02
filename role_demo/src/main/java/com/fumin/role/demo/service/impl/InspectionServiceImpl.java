package com.fumin.role.demo.service.impl;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.thymeleaf.util.StringUtils;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.bean.Inspection;
import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.bean.TerminalOld;
import com.fumin.role.demo.mapper.InspectionMapper;
import com.fumin.role.demo.service.AdminService;
import com.fumin.role.demo.service.ClientService;
import com.fumin.role.demo.service.InspectionService;
import com.fumin.role.demo.util.ExcelUtils;
import com.fumin.role.demo.util.FmException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class InspectionServiceImpl extends BaseServiceImpl<Inspection> implements InspectionService {
	
	@Override
	public PageInfo<?> getPageToMap(Map<String, Object> map, Integer currentPage, Integer pageSize) {
		PageHelper.startPage(currentPage, pageSize);
		try {
			List<Map<String,Object>> list = ((InspectionMapper)dao).getInspectionToMap(map);
			PageInfo<Map<String,Object>> page = new PageInfo<>(list);
			return page;
		}finally {
			PageHelper.clearPage();
		}
	}
	
	public PageInfo<?> getPageToMapTotals(Map<String, Object> map, Integer currentPage, Integer pageSize) {
		PageHelper.startPage(currentPage, pageSize);
		try {
			List<Map<String,Object>> list = ((InspectionMapper)dao).getInspectionGroupToMap(map);
			PageInfo<Map<String,Object>> page = new PageInfo<>(list);
			return page;
		}finally {
			PageHelper.clearPage();
		}
	}
	
	public Workbook getPageToMapTotalsDownload(Map<String, Object> map) {
		List<Map<String,Object>> list = ((InspectionMapper)dao).getInspectionTerminalGroupToMap(map);
		if(list!=null && !list.isEmpty()) {
			Workbook workbook = ExcelUtils.newWorkbook();
			Sheet sheet = workbook.createSheet();
			Row row0 = sheet.createRow(0);
			Cell cell0 = row0.createCell(0);
			cell0.setCellValue("地区");
			cell0 = row0.createCell(1);
			cell0.setCellValue("客户名称");
			cell0 = row0.createCell(2);
			cell0.setCellValue("客户编号");
			cell0 = row0.createCell(3);
			cell0.setCellValue("终端编号");
			cell0 = row0.createCell(4);
			cell0.setCellValue("pos编号");
			cell0 = row0.createCell(5);
			cell0.setCellValue("联系人");
			cell0 = row0.createCell(6);
			cell0.setCellValue("联系电话");
			cell0 = row0.createCell(7);
			cell0.setCellValue("地址");
			cell0 = row0.createCell(8);
			cell0.setCellValue("巡检");
			cell0 = row0.createCell(9);
			cell0.setCellValue("新增");
			cell0 = row0.createCell(10);
			cell0.setCellValue("维修");
			cell0 = row0.createCell(11);
			cell0.setCellValue("更换");
			
			for(Map<String,Object> data:list) {
				Row row = sheet.createRow(sheet.getLastRowNum()+1);
				Cell cell = row.createCell(0);
				cell.setCellValue(data.get("diqu").toString());
				cell = row.createCell(1);
				cell.setCellValue(getObjectString(data.get("name")));
				cell = row.createCell(2);
				cell.setCellValue(getObjectString(data.get("clientNumber")));
				cell = row.createCell(3);
				cell.setCellValue(getObjectString(data.get("number")));
				cell = row.createCell(4);
				cell.setCellValue(getObjectString(data.get("posNumber")));
				cell = row.createCell(5);
				cell.setCellValue(getObjectString(data.get("manager")));
				cell = row.createCell(6);
				cell.setCellValue(getObjectString(data.get("phone")));
				cell = row.createCell(7);
				cell.setCellValue(getObjectString(data.get("address")));
				cell = row.createCell(8);
				cell.setCellValue(getObjectString(data.get("xj")));
				cell = row.createCell(9);
				cell.setCellValue(getObjectString(data.get("xz")));
				cell = row.createCell(10);
				cell.setCellValue(getObjectString(data.get("wx")));
				cell = row.createCell(11);
				cell.setCellValue(getObjectString(data.get("gh")));
			}
			return workbook;
		}
		return null;
	}
	
	private String getObjectString(Object obj) {
		if(obj==null) {
			return "";
		}else {
			return obj.toString();
		}
	}
	
	public PageInfo<?> getInspectionTerminalGroupToMap(Map<String, Object> map, Integer currentPage, Integer pageSize) {
		PageHelper.startPage(currentPage, pageSize);
		try {
			List<Map<String,Object>> list = ((InspectionMapper)dao).getInspectionTerminalGroupToMap(map);
			PageInfo<Map<String,Object>> page = new PageInfo<>(list);
			return page;
		}finally {
			PageHelper.clearPage();
		}
	}
	
	@Override
	public void add(Inspection entity) {
		TerminalServiceImpl service = null;
		if( entity.getType()==4 ) {
			service = getService(TerminalServiceImpl.class);
		}
		List<Integer> terminals = entity.getTerminals();
		if(terminals!=null && terminals.size()>0) {
			for(Integer tid:terminals) {
				entity.setId(null);
				entity.setTerminalId(tid);
				dao.insertSelective(entity);
				
				//如果是换机则还需在终端设备上修改换机状态
				if( entity.getType()==4 ) {
					Terminal terminal = service.get(tid);
					terminal.setType(3);
					service.update(terminal);
				}
			}
		}else {
			if(entity.getTerminalId()==null) {
				throw new FmException("终端id错误");
			}
			dao.insertSelective(entity);
			
			//如果是换机则还需在终端设备上修改换机状态
			if( entity.getType()==4 ) {
				Terminal terminal = service.get(entity.getTerminalId());
				terminal.setType(3);
				service.update(terminal);
			}
		}
		
		Client client = new Client();
		client.setId(entity.getClientId());
		client.setIsChecked(1);
		ClientService service2 = getService(ClientService.class);
		service2.update(client);
	}

	@Override
	public void terminalAdd(Terminal terminal) {
		int type;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		TerminalServiceImpl tservice = getService(TerminalServiceImpl.class);
		
		//如果包含要删除的设备id，则为换机。
		//并先删除旧设备
		if( !StringUtils.isEmpty( request.getParameter("cid")) ) {
			Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
			int cid;
			if(pattern.matcher( request.getParameter("cid") ).matches()) {
				cid = Integer.parseInt(request.getParameter("cid"));
			}else {
				throw new FmException("换机的设备信息错误");
			}
			type=4; //换机，状态为4
			terminal.setChangeId(cid);
			
			//将换下的设备保存到设备回收站
			Terminal terminal2 = tservice.get(cid);     //取出要删除的数据
			TerminalOld to = new TerminalOld();         //新建一个回收站数据并复制数据内容
			to.setId(terminal2.getId());
			to.setAddTime(terminal2.getAddTime());
			to.setChangeId(terminal2.getChangeId());
			to.setClientId(terminal2.getClientId());
			to.setNumber(terminal2.getNumber());
			to.setPosNumber(terminal2.getPosNumber());;
			to.setType(terminal2.getType());
			to.setUserId(terminal2.getUserId());         //回收站数据复制完毕
			
			TerminalOldServiceImpl terminalOldServiceImpl = getService(TerminalOldServiceImpl.class);
			terminalOldServiceImpl.add(to);   //将换下的设备保存到设备回收站
			tservice.delete(cid);             //直接删除换机设备
		}else {
			type=2; //新增，状态为2
		}
		
		//新增设备
		tservice.add(terminal);
		
		Integer userId = terminal.getUserId();
		AdminService service = getService(AdminService.class);
		Admin admin = service.get(userId);
		if(admin.getRole() == 3) {
			//如果是业务员，则写入操作记录
			Inspection inspection = new Inspection();
			inspection.setClientId(terminal.getClientId());
			inspection.setTerminalId(terminal.getId());
			inspection.setType(type);
			inspection.setUserId(terminal.getUserId());
			add(inspection);
		}
		
	}
}
