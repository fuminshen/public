package com.fumin.distribution.util;

import java.util.*;
import org.springframework.core.convert.converter.Converter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fumin.distribution.vo.Pay;

public class JsonStringToListPayConvert implements Converter<String, List<Pay>> {

	@SuppressWarnings("unchecked")
	@Override
	public List<Pay> convert(String source) {
		if(source==null || source.trim().length()==0) {
			return null;
		}
		ObjectMapper mapper = new ObjectMapper();
		try {
			List<Pay> map=mapper.readValue(source, List.class);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
}
