package com.fumin.role.demo.bean;

import java.math.BigDecimal;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Data
@Table(name = "g_client")
public class Client{

	
	@Id
	private Integer id;
	private String name;
	private String address;
	private Integer companyId;
	private String phone;
	private BigDecimal longitude;
	private BigDecimal latitude;
}
