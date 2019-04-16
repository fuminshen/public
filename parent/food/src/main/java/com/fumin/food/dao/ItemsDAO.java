package com.fumin.food.dao;


import org.apache.ibatis.annotations.Mapper;

import com.fumin.food.entity.Items;
import com.fumin.food.util.BaseDAO;

@Mapper
public interface ItemsDAO extends BaseDAO<Items> {
}