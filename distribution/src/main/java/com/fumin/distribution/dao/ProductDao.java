package com.fumin.distribution.dao;

import org.apache.ibatis.annotations.Mapper;
import com.fumin.distribution.util.BaseDAO;
import com.fumin.distribution.vo.Product;

@Mapper
public interface ProductDao extends BaseDAO<Product> {
}