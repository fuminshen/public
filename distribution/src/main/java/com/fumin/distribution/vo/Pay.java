package com.fumin.distribution.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_pay")
public class Pay implements Serializable {

	private Long id;
	
	private Long orderId;
	
	private Integer clientId;
	
	//返点季度数序号，如：1=一季度，2=二季度，3=三季度，4=四季度
	private Integer orders;
	
	//应返点金额
	private Double money;
	
	//支付状态，0=未支付，1=已支付
	private Integer state;
	
	private Integer adminId;
	
	private Integer companyId;
	
	//到期应支付时间
	private Timestamp dueTime;
	
	//实际支付时间
	private Timestamp payTime;
}
