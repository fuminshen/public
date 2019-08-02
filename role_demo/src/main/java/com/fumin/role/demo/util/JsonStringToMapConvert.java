package com.fumin.role.demo.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import org.springframework.core.convert.converter.Converter;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonStringToMapConvert implements Converter<String, Map<String, Object>> {

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> convert(String source) {
		if(source==null || source.trim().length()==0) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			Map<String, Object> map=mapper.readValue(source, Map.class);
			Set<String> keys = map.keySet();
			for(String key:keys) {
				if(key.matches("(.*)((?i)t)ime_start") ){
					map.put(key, convertTime(map.get(key).toString()+" 00:00:00"));
				}
				else if(key.matches("(.*)((?i)t)ime_end") ){
					map.put(key, convertTime(map.get(key).toString()+" 23:59:59"));
				}
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	private Timestamp convertTime(String dateText) {
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return new Timestamp( simpleDateFormat.parse(dateText).getTime() );
        } catch(Exception px) {
            px.printStackTrace();
            throw new RuntimeException(px);
        }
	}


}
