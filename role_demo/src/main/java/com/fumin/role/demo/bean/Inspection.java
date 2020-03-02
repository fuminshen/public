package com.fumin.role.demo.bean;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "g_inspection")
public class Inspection{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer clientId;
	private Integer terminalId;       //pos机id
	private Integer userId;           //维护人id
	private Integer companyId;        //所属分公司
	private BigDecimal longitude;     //经度
	private BigDecimal latitude;      //纬度
	private Integer type;        //巡查类型 1已巡检，2新安装，3已维修
	
	@OrderBy(value="DESC")
	private Timestamp time;      //巡查时间
	
	//@TableField(exist = false)
	private List<Integer> terminals;
}
