package com.fumin.role.demo.util;

import java.util.Set;

import org.apache.ibatis.mapping.MappedStatement;

import tk.mybatis.mapper.entity.EntityColumn;
import tk.mybatis.mapper.mapperhelper.EntityHelper;
import tk.mybatis.mapper.mapperhelper.MapperHelper;
import tk.mybatis.mapper.mapperhelper.MapperTemplate;
import tk.mybatis.mapper.mapperhelper.SqlHelper;

public class DataProvider extends MapperTemplate {
	
	Class<?> entity;
	String tableName;
	
	private void init(MappedStatement mstmt) {
		entity = getEntityClass(mstmt);
		tableName = tableName(entity);
	}
	
	public DataProvider(Class<?> mapperClass, MapperHelper mapperHelper) {
		super(mapperClass, mapperHelper);
	}
	
	public String getForUpdate(MappedStatement mstmt) {
		init(mstmt);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append(
				SqlHelper.selectAllColumns(entity)
		);
		sb.append(
				SqlHelper.fromTable(entity, tableName)
		);
		sb.append(
				SqlHelper.wherePKColumns(entity)
		);
		sb.append(
				" FOR UPDATE"
		);
		return sb.toString();
	}
	
	public String getListAndOrder(MappedStatement mstmt){
		init(mstmt);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append(
				SqlHelper.selectAllColumns(entity)
		);
		sb.append(
				SqlHelper.fromTable(entity, tableName)
		);
		sb.append("<if test=\"param1 != null\">");
		sb.append(
				getWhere(entity)
		);
		sb.append("</if>");
		sb.append(" ORDER BY ${param2} ${param3}");
		return sb.toString();
	}
	
	public String getListToMap(MappedStatement mstmt) {
		init(mstmt);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT * ");
		sb.append(
				SqlHelper.fromTable(entity, tableName)
		);
		sb.append("<if test=\"params != null\">");
		sb.append("<where>");
		sb.append("<foreach collection=\"params.keys\" item=\"key\" separator=\" AND \">");
		sb.append("<if test='key != \"ORDER_BY\"'>");
		sb.append("<choose><when test='params[key].toString().lastIndexOf(\"%\") == (params[key].toString().length()-1)'>");
		sb.append(" ${key} like #{params[${key}]}");
		sb.append("</when><otherwise>");
		sb.append(" ${key} = #{params[${key}]}");
		sb.append("</otherwise></choose>");
		sb.append("</if>");
		sb.append("</foreach>");
		sb.append("</where>");
		sb.append("<if test='params.ORDER_BY != null'>");
		sb.append(" ORDER BY ${params.ORDER_BY}");
		sb.append("</if>");
		sb.append("</if>");
		sb.append("<if test=\"params == null\">");
		sb.append(SqlHelper.orderByDefault(entity));
		sb.append("</if>");
		return sb.toString();
	}
	
	private String getWhere(Class<?> entityClass) {
		StringBuilder sql = new StringBuilder();

        sql.append("<where>");
        
        //获取全部列
        Set<EntityColumn> columnSet = EntityHelper.getColumns(entityClass);
        for (EntityColumn column : columnSet) {
            sql.append(SqlHelper.getIfNotNull("param1",column, " AND " + column.getColumnEqualsHolder(), false));
        }

        sql.append("</where>");
        return sql.toString();
	}
}
