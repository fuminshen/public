package com.fumin.role.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.util.DataMapper;

@Mapper
public interface ClientMapper extends DataMapper<Client> {
	
	public void clearInspection(@Param("companyId") Integer companyId);

	public void setDistributeClear(@Param("companyId") Integer companyId);
	
	public int selectClientCountForOneAdmin(@Param("companyId") Integer companyId);
	
	public void updateDistributeForAsc(
			@Param("companyId") Integer companyId,
			@Param("userId")Integer userId,
			@Param("start")Integer start,
			@Param("end")Integer end);
	
	public void updateDistributeForRand(
			@Param("companyId") Integer companyId,
			@Param("userId")Integer userId,
			@Param("end")Integer end);
	
	public void updateDistributeForManual(
			@Param("companyId") Integer companyId,
			@Param("userId")Integer userId,
			@Param("ids")List<?> ids);
	
	@Update("update g_client set isChecked=0")
	public void clearCheckedState();
}
