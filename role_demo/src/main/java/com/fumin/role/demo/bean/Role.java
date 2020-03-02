package com.fumin.role.demo.bean;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "g_role")
public class Role {

	@Id
	private Integer id;
	private String name;
}
