package com.fumin.distribution.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_client")
public class Client implements Serializable {

	private Integer id;
	
	//上一级id
	private Integer parentId;
	
	//姓名
	private String username;
	
	private String userIdCard;
	
	//微信号
	private String weixin;
	
	private String phone;
	
	private String address;
	
	private String bankNumber;
	
	private String bankName;
	
	private String bankUser;
	
	private String friends;
	
	private Integer companyId;
	
	//累积销售数量
	private Integer sellCount;
	
	//客户首次进入系统时间
	private Timestamp addTime;
	
	public Integer getSellCount() {
		if(sellCount==null) {
			this.sellCount=0;
		}
		return sellCount;
	}
}
