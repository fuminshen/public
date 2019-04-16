package com.fumin.food.entity;

import java.io.Serializable;

import com.fumin.food.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@SQLTable(name = "f_nav_bar")
@Data
public class NavBar implements Serializable {

	private Integer id;
	private String name;
	private Integer navId;
}
