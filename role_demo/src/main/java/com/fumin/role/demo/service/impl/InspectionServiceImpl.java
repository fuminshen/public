package com.fumin.role.demo.service.impl;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.thymeleaf.util.StringUtils;

import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.bean.Inspection;
import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.bean.TerminalOld;
import com.fumin.role.demo.mapper.InspectionMapper;
import com.fumin.role.demo.service.ClientService;
import com.fumin.role.demo.service.InspectionService;
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
		List<Integer> terminals = entity.getTerminals();
		if(terminals!=null && terminals.size()>1) {
			for(Integer tid:terminals) {
				entity.setId(null);
				entity.setTerminalId(tid);
				dao.insertSelective(entity);
			}
		}else {
			if(entity.getTerminalId()==null) {
				throw new FmException("终端id错误");
			}
			dao.insertSelective(entity);
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
		
		//写入操作记录
		Inspection inspection = new Inspection();
		inspection.setClientId(terminal.getClientId());
		inspection.setTerminalId(terminal.getId());
		inspection.setType(type);
		inspection.setUserId(terminal.getUserId());
		add(inspection);
	}
}
