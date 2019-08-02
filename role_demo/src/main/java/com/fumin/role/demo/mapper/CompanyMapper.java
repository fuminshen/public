package com.fumin.role.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fumin.role.demo.bean.Company;
import com.fumin.role.demo.util.DataMapper;

@Mapper
public interface CompanyMapper extends DataMapper<Company> {

}
