package com.fumin.role.demo.bean;

import java.sql.Timestamp;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * POS设备终端
 * @author fumin
 *
 */
@Data
@Table(name = "g_terminal")
public class Terminal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String number;            //终端编码
	private String posNumber;         //POS号
	private Integer clientId;         //商铺id
	private Timestamp addTime;        //安装时间
	
	private Integer userId;           //维护人id
	
	private Integer changeId;         //换机时用于替换的前一个设备id
	private Integer type;             //1:新装。2:拆机。3:换机
}
