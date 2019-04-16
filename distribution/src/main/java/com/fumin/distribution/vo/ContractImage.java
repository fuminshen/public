package com.fumin.distribution.vo;

import java.io.Serializable;

import com.fumin.distribution.util.SQLTable;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@SQLTable(name = "g_contract_img")
public class ContractImage implements Serializable {

	private Long id;
	
	private Long contractId;
	
	private String path;
}
