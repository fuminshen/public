package com.fumin.food.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import com.fumin.food.util.SQLTable;

import lombok.Data;
import lombok.experimental.Accessors;

@SuppressWarnings("serial")
@SQLTable(name = "f_items")
@Data
@Accessors(chain=true)
public class Items implements Serializable {

	private Long id;
	private Integer navId;
	private String name;
	private Double price;
	private String img;
	private String descript;
	private Integer state;
	private Timestamp addTime;
}
