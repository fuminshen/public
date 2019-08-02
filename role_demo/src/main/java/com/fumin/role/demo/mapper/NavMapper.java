package com.fumin.role.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fumin.role.demo.bean.Nav;
import com.fumin.role.demo.util.DataMapper;

@Mapper
public interface NavMapper extends DataMapper<Nav> {

	public List<Nav> getByRole(@Param("id")Integer roleId);
	
	public void setForRole(@Param("roleId") Integer roleId,@Param("navId") Integer navId);
	
	public void delForRole(@Param("roleId") Integer roleId,@Param("navId") Integer navId);
}
