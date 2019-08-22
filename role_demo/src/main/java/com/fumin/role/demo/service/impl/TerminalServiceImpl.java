package com.fumin.role.demo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.mapper.TerminalMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class TerminalServiceImpl extends BaseServiceImpl<Terminal> {

	@Override
	public PageInfo<?> getPageToMap(Map<String, Object> map, Integer currentPage, Integer pageSize) {
		PageHelper.startPage(currentPage, pageSize);
		try {
			List<Map<String,Object>> list = ((TerminalMapper)dao).getListToMapRewrite(map);
			PageInfo<Map<String,Object>> page = new PageInfo<>(list);
			return page;
		}finally {
			PageHelper.clearPage();
		}
	}
}
