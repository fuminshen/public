package com.fumin.distribution.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_orders")
public class Order implements Serializable {

	private Long id;
	
	//订单号
	private String number;
	
	//下单管理员id
	private Integer adminId;
	
	//订单所属分公司
	private Integer companyId;
	
	//购买客户id
	private Integer clientId;
	
	//单价
	private BigDecimal price;
	
	//实付总金额
	private BigDecimal money;
	
	//预订时间
	private Timestamp addTime;
	
	//购买数量
	private Integer productId;
	
	private Integer count;
	
	public static String createOrderNumber() {
		int i = (int)(Math.random()*900 + 100);
		String number=(new java.text.SimpleDateFormat("yyyyMMddhhmmssSSS")).format(new Date())+""+i;
		return number;
	}
}
