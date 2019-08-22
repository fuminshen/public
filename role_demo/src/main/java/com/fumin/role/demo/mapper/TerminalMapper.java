package com.fumin.role.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fumin.role.demo.bean.Terminal;
import com.fumin.role.demo.util.DataMapper;

@Mapper
public interface TerminalMapper extends DataMapper<Terminal> {

	public List<Map<String, Object>> getListToMapRewrite(@Param("params") Map<String,Object> params);
}
