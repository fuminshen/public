package com.fumin.distribution.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("serial")
public class Menu implements Serializable {

	public final static Map<String, String> menu;
	static {
		menu = new HashMap<String, String>();
		menu.put("index", "列表");
		menu.put("new", "新增");
		menu.put("info", "详细信息");
		menu.put("add", "新增");
		menu.put("error", "错误");
		
		menu.put("admin", "管理员");
		menu.put("client", "代理商");
		menu.put("pay", "返额");
		menu.put("order", "订单");
		menu.put("company", "分公司");
		menu.put("deposit", "完成");
		
		menu.put("product", "产品");
		menu.put("rulepay", "激励佣金规则");
	}
}
