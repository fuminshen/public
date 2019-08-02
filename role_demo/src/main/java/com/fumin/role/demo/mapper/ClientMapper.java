package com.fumin.role.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.util.DataMapper;

@Mapper
public interface ClientMapper extends DataMapper<Client> {

}
