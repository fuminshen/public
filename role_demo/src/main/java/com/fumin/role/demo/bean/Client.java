package com.fumin.role.demo.bean;

import java.math.BigDecimal;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import lombok.Data;

@Data
@Table(name = "g_client")
public class Client{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@OrderBy(value="DESC")
	private Integer id;
	private String number;            //商铺编码
	private String name;              //商铺名称
	private String address;           //商铺地址
	private Integer companyId;        //所属分公司
	private String phone;             //商铺电话
	private String manager;           //商铺联系人
	private BigDecimal longitude;     //经度
	private BigDecimal latitude;      //纬度
	
	private Integer userId;           //维护人id
	private Integer isChecked;        //是否已维护，0表示未维护，1表示已维护
}
