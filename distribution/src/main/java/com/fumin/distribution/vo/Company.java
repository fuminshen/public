package com.fumin.distribution.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_company")
public class Company implements Serializable {

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
