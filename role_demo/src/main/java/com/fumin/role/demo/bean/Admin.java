package com.fumin.role.demo.bean;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Id;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "g_admins")
public class Admin implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@OrderBy(value="DESC")
	private Integer id;
	private String username;
	private String password;
	private String phone;
	private String name;
	private Integer sex;
	private String idcard;
	private Integer companyId;
	private Integer role;
	private Timestamp addTime;
}
