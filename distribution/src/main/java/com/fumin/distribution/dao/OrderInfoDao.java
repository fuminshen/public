package com.fumin.distribution.dao;

import org.apache.ibatis.annotations.Mapper;

import com.fumin.distribution.util.BaseDAO;
import com.fumin.distribution.vo.OrderInfo;

@Mapper
public interface OrderInfoDao extends BaseDAO<OrderInfo> {
}