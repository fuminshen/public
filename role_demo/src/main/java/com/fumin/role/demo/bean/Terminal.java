package com.fumin.role.demo.bean;

import java.sql.Timestamp;
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
	private Integer id;
	private String number;            //终端编码
	private Integer clientId;         //商铺id
	private Integer userId;           //安装人员
	
	private Timestamp addTime;        //安装时间
}
