package com.fumin.role.demo.bean;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Data
@Table(name = "g_nav")
public class Nav implements Serializable{

	private static final long serialVersionUID = 2620772041482668020L;
	
	@Id
	private Integer id;
	private String name;
	private String url;
	private Integer hide;
	private Integer parent;
	private String icon;
}
