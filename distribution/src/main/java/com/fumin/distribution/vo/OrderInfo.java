package com.fumin.distribution.vo;

import java.io.Serializable;

import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_order_info")
public class OrderInfo implements Serializable {

	private Long id;
	
	//订单id
	private Long orderId;
	
	//黄金编号
	private String number;
	
	//下单管理员id
	private Double weight;
	
	
}
