package com.fumin.role.demo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fumin.role.demo.bean.Inspection;
import com.fumin.role.demo.mapper.InspectionMapper;
import com.fumin.role.demo.service.InspectionService;
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
}
