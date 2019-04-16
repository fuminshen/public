package com.fumin.distribution.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import com.fumin.distribution.util.SQLTable;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_products")
public class Product implements Serializable {

	private Integer id;
	
	//产品名称
	private String name;
	
	//单价
	private BigDecimal price;
	
	//销售佣金
	private Double payCommission;
	
	//推广佣金
	private Double adCommission;
	
	//产品介绍
	private String descript;
	
	//是否上架，1表示上架，0表示下架
	private Integer show;
}
