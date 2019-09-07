package com.fumin.role.demo.service;

import java.util.Map;

import com.fumin.role.demo.bean.Inspection;
import com.fumin.role.demo.bean.Terminal;
import com.github.pagehelper.PageInfo;

public interface InspectionService extends BaseService<Inspection> {

	public PageInfo<?> getPageToMapTotals(Map<String, Object> map, Integer currentPage, Integer pageSize);
	
	public PageInfo<?> getInspectionTerminalGroupToMap(Map<String, Object> map, Integer currentPage, Integer pageSize);
	
	public void terminalAdd(Terminal terminal);
}
