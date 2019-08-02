package com.fumin.role.demo.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Table(name = "g_company")
public class Company implements Serializable {

	@Id
	private Integer id;
	
	//上级公司
	private Integer parentId;
	
	//公司名
	private String name;
	
	private String phone;
	
	private String address;
	
	private Timestamp addTime;
	
	//公司开户行
	private String bankName;
	
	//公司银行帐号
	private String bankNumber;
	
	//公司开户名
	private String bankUser;
	
	//公司传真号码
	private String fax;
}
