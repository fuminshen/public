package com.fumin.distribution.service;

import java.util.List;

import com.fumin.distribution.vo.Pay;

public interface PayService extends Service<Pay>{
	public boolean add(List<Pay> pays);
}
