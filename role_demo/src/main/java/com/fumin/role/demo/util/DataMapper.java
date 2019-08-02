package com.fumin.role.demo.util;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import tk.mybatis.mapper.annotation.RegisterMapper;
import tk.mybatis.mapper.common.BaseMapper;

@RegisterMapper
public interface DataMapper<T> extends BaseMapper<T> {

	@SelectProvider(type=DataProvider.class, method="dynamicSQL")
	public List<T> getListAndOrder(T entity,String sortName,String sortType);
	
	@SelectProvider(type=DataProvider.class, method="dynamicSQL")
	public List<Map<String, Object>> getListToMap(@Param("params") Map<String,Object> params);
	
	@SelectProvider(type=DataProvider.class, method="dynamicSQL")
	public T getForUpdate(Object id);
}
