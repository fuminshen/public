package com.fumin.role.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fumin.role.demo.bean.Inspection;
import com.fumin.role.demo.util.DataMapper;

@Mapper
public interface InspectionMapper extends DataMapper<Inspection> {

	public List<Map<String, Object>> getInspectionToMap(@Param("params") Map<String, Object> params) ;
	
	public List<Map<String, Object>> getInspectionGroupToMap(@Param("params") Map<String, Object> params) ;
}
