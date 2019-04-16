package com.fumin.distribution.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.fumin.distribution.util.BaseDAO;
import com.fumin.distribution.vo.Order;

@Mapper
public interface OrderDao extends BaseDAO<Order> {
	
	
	@Override
	@Select(value = { "<script>",
			"select a.*,b.username as clientName,b.phone as clientPhone,c.name as productName from g_orders a left join g_client b on b.id=a.clientId",
			" left join g_products c on c.id=a.productId where 1=1",
			"<when test='map!=null'>",
				"<foreach collection='map' index='key' item='value'>", 
				"<choose>",
					"<when test='key.split(\"_\").length == 2'>",
						"<choose>",
							"<when test='key.split(\"_\")[1] == \"start\"'>",
								" and a.${key.split('_')[0]}&gt;=#{map.${key}} ", 
							"</when>",
							"<otherwise>",
								" and a.${key.split('_')[0]}&lt;=#{map.${key}} ", 
							"</otherwise>",
						"</choose>",
					"</when>",
					"<otherwise>",
					" and a.${key}=#{map.${key}} ", 
					"</otherwise>",
				"</choose>",
				"</foreach>",
			"</when>",
			" order by id desc",
		"</script>"})
	public List<Map<String, Object>> getByEntity(@Param("map")Map<String, Object> map, Order t);
}