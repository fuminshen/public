package com.fumin.distribution.vo;

import java.io.Serializable;
import com.fumin.distribution.util.SQLTable;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_rule_pay")
public class RulePay implements Serializable {

	private Integer id;
	
	//销售达到的指标
	private Integer count;
	
	//提成金额
	private Double money;
	
	//产品介绍
	private String descript;
	
	//操作人管理员
	private Integer adminId;
}
