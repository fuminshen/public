package com.fumin.distribution.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.regex.Pattern;

import com.fumin.distribution.util.MD5;
import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_admins")
public class Admin implements Serializable{

	private Integer id;
	private String username;
	private String password;
	private Integer companyId;
	private Integer role;
	private Timestamp addTime;
	private Timestamp lastLogin;
	private String phone;
	private String name;
	private String weixin;
	private String email;
	
	public void setPassword(String password) {
		if(password!=null && password.trim().length()>0) {
			String pattern="`~[0-9,a-f,A-F]{32}`~";
			boolean b=Pattern.matches(pattern, password);
			if(!b) {
				password="`~"+MD5.getEncode(password)+"`~";
			}
		}
		this.password=password;
	}
}
