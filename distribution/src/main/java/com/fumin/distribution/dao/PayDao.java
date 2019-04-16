package com.fumin.distribution.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.jdbc.SQL;

import com.fumin.distribution.util.BaseDAO;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Pay;

@Mapper
public interface PayDao extends BaseDAO<Pay> {

	/*@Select(value = { "<script>select a.*,b.number as number,b.weight as weight,b.price as price,c.username as clientName,c.phone as phone",
			" from g_pay a left join g_orders b on b.id=a.orderId left join g_client c on c.id=a.clientId where 1=1 ",
			"<if test='map!=null'>",
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
					" and a.${key}=#{map.${key}}",
				"</otherwise>",
			"</choose>",
			"</foreach>",
			"</if>",
			"</script>"})*/
	@SelectProvider(method = "listSQL", type = PayDaoProvider.class)
	public List<Map<String, Object>> getByEntity(@Param("map")Map<String, Object> map, Pay t);
	
	class PayDaoProvider{
		
		@SuppressWarnings("unchecked")
		public String listSQL(final Map<String, Object> map) {
			final Map<String, Object> data=(Map<String, Object>) map.get("map");
			
			return new SQL(){{
				boolean isSort=false;
				SELECT("a.*,b.number as number,b.price as price,c.username as clientName,c.phone as phone,c.weixin as weixn,b.addTime as addTime");
				FROM("g_pay a left join g_orders b on b.id=a.orderId left join g_client c on c.id=a.clientId");
				if(data!=null) {
					for(Map.Entry<String, Object> key:data.entrySet()) {
						if(key.getKey().equals("orderByName")) {
							String v=key.getValue().toString();
							if( !v.matches("[a-zA-Z]+ [a-zA-Z]+") ) {
								throw new IpcException("检测到sql注入攻击。");
							}
							ORDER_BY(v.split(" ")[0]+" "+v.split(" ")[1]);
							isSort=true;
							continue;
						}
						Object value=key.getValue();
						if(value!=null && value.toString().trim().length()>0) {
							String[] ks=key.getKey().split("_");
							if(ks.length==2 && (ks[1].equals("start") || ks[1].equals("end")) ) {
								if(ks[1].equals("start")) {
									WHERE("b."+ks[0]+">=#{map."+key.getKey()+"}");
								}else {
									WHERE("b."+ks[0]+"<=#{map."+key.getKey()+"}");
								}
							}else {
								if(value.toString().charAt(0)=='%' && value.toString().charAt(value.toString().length()-1)=='%') {
									WHERE("a."+key.getKey()+" like #{map."+key.getKey()+"}");
								}else {
									WHERE("a."+key.getKey()+"=#{map."+key.getKey()+"}");
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
	}
}