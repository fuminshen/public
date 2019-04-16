package com.fumin.distribution.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.fumin.distribution.util.BaseDAO;
import com.fumin.distribution.vo.RulePay;

@Mapper
public interface RulePayDao extends BaseDAO<RulePay> {
	
	@Select(value = {"select * from g_rule_pay where count>#{count} order by count asc limit 1"})
	public RulePay getCurrentByCount(@Param("count")int count);
}