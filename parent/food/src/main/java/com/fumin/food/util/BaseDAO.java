package com.fumin.food.util;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.jdbc.SQL;

import com.fumin.food.util.SQLTable;

public interface BaseDAO<T> {

	@SelectProvider(type = ProviderData.class, method = "select")
	public T getById(T t);
	
	@UpdateProvider(type = ProviderData.class, method = "update")
	public int update(T t);
	
	@DeleteProvider(type = ProviderData.class, method = "delete")
	public int delete(T t);
	
	@InsertProvider(type = ProviderData.class, method = "add")
	@Options(useGeneratedKeys=true, keyProperty="id")
	public int add(T t);
	
	@SelectProvider(type = ProviderData.class, method = "getList")
	public List<Map<String,Object>> getByEntity(@Param("vo")Map<String,Object> map,@Param("t")T t);
	
	@SelectProvider(type = ProviderData.class, method = "getLimit")
	public List<Map<String,Object>> getByEntityLimit(@Param("vo")T t,@Param("length")int length);
	
	@SelectProvider(type = ProviderData.class, method = "getLimit")
	public List<T> getByEntityLimitToEntity(@Param("vo")T t,@Param("length")int length);
	
	class ProviderData{
		private String getTableName(Object o) {
			String tableName=null;
			try {
				Class<?> cls=Class.forName(o.getClass().getName());
				tableName = cls.getAnnotation(SQLTable.class).name();
				//tableName = cls.getField("TABLE_NAME").get(o).toString();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return tableName;
		}

		public String select(Object o) throws IllegalArgumentException, IllegalAccessException {
			final String tableName=getTableName(o);
			Field[] fields=o.getClass().getDeclaredFields();
			Object id=null;
			for(Field field:fields) {
				if(field.getName().equals("id")) {
					field.setAccessible(true);
					id=field.get(o);
					break;
				}
			}
			if(id==null) {
				throw new RuntimeException("参数不能为空");
			}
			String sql="select * from "+tableName+" where id=#{id}";
			return sql;
		}
		
		public String update(final Object o) throws IllegalArgumentException, IllegalAccessException {
			final String tableName=getTableName(o);
			final Field[] fields=o.getClass().getDeclaredFields();
			return new SQL() {{
				UPDATE(tableName);
				Object value=null;
				for(Field field:fields) {
					if(field.getName().equals("serialVersionUID")) {
						continue;
					}else if(field.getName().equals("id")) {
						field.setAccessible(true);
						value=field.get(o);
						if(value==null || value.toString().trim().length()==0) {
							throw new RuntimeException("参数不能为空");
						}
						WHERE("id=#{"+field.getName()+"}");
					}else {
						field.setAccessible(true);
						value=field.get(o);
						if(value!=null && value.toString().trim().length()>0) {
							SET(field.getName()+"=#{"+field.getName()+"}");
						}
					}
				}
			}}.toString();
		}
		
		public String add(final Object o) throws IllegalArgumentException, IllegalAccessException {
			final String tableName=getTableName(o);;
			final Field[] fields=o.getClass().getDeclaredFields();
			
			return new SQL() {{
				INSERT_INTO(tableName);
				Object value=null;
				for(Field field:fields) {
					if(field.getName().equals("serialVersionUID")) {
						continue;
					}else {
						field.setAccessible(true);
						value=field.get(o);
						if(value!=null && value.toString().trim().length()>0) {
							VALUES(field.getName(),"#{"+field.getName()+"}");
						}
					}
				}
			}}.toString();
		}
		
		public String delete(Object o) throws IllegalArgumentException, IllegalAccessException {
			final String tableName=getTableName(o);;
			Field[] fields=o.getClass().getDeclaredFields();
			Object id=null;
			for(Field field:fields) {
				if(field.getName().equals("id")) {
					field.setAccessible(true);
					id=field.get(o);
					break;
				}
			}
			if(id==null) {
				throw new RuntimeException("参数不能为空");
			}
			return new SQL() {{
				DELETE_FROM(tableName);
				WHERE("id=#{id}");
			}}.toString();
		}
		
		@SuppressWarnings("unchecked")
		public String getList(final Map<String, Object> map) throws IllegalAccessException{
			final String tableName=getTableName(map.get("t"));
			final Map<String, Object> data=(Map<String, Object>) map.get("vo");
			
			return new SQL() {{
				boolean isSort=false;
				SELECT("*");
				FROM(tableName);
				if(data!=null && !data.isEmpty()) {
					Set<String> keys=data.keySet();
					for(String key:keys) {
						if(key.equals("orderByName")) {
							String v=data.get(key).toString();
							if( !v.matches("[a-zA-Z]+ [a-zA-Z]+") ) {
								throw new RuntimeException("检测到sql注入攻击。");
							}
							ORDER_BY(v.split(" ")[0]+" "+v.split(" ")[1]);
							isSort=true;
							continue;
						}
						Object value=data.get(key);
						if(value!=null && value.toString().trim().length()>0) {
							String[] ks=key.split("_");
							if(ks.length==2 && (ks[1].equals("start") || ks[1].equals("end")) ) {
								if(ks[1].equals("start")) {
									WHERE(ks[0]+">=#{vo."+key+"}");
								}else {
									WHERE(ks[0]+"<=#{vo."+key+"}");
								}
							}else {
								if(value.toString().charAt(0)=='%' && value.toString().charAt(value.toString().length()-1)=='%') {
									WHERE(key+" like #{vo."+key+"}");
								}else {
									WHERE(key+"=#{vo."+key+"}");
								}
							}
							
						}
					}
				}
				if(!isSort) {
					ORDER_BY("ID DESC");
				}
			}}.toString();
		}
		
		public String getLimit(Map<String, Object> map) throws IllegalAccessException {
			final Object o=map.get("vo");
			final String tableName=getTableName(o);;
			final Field[] fields=o.getClass().getDeclaredFields();
			
			return new SQL() {{
				SELECT("*");
				FROM(tableName);
				Object value=null;
				for(Field field:fields) {
					if(field.getName().equals("serialVersionUID")) {
						continue;
					}else {
						field.setAccessible(true);
						value=field.get(o);
						if(value!=null && value.toString().trim().length()>0) {
							WHERE(field.getName()+"=#{vo."+field.getName()+"}");
						}
					}
				}
				
			}}.toString()+" limit #{length}";
		}
		
	}
}