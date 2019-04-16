package com.fumin.distribution.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_contract")
public class Contract implements Serializable {

	private Long id;
	
	private Long orderId;
	
	private String name;
	
	private String number;
	
	private String photo;
	
	private Timestamp dateTime;
	
	public static String createContractNumber() {
		int i = (int)(Math.random()*900 + 100);
		String number=(new java.text.SimpleDateFormat("yyyyMMddhhmmssSSS")).format(new Date())+""+i;
		return number;
	}
}
