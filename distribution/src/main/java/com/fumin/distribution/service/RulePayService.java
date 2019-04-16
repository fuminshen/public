package com.fumin.distribution.service;

import com.fumin.distribution.vo.RulePay;

public interface RulePayService extends Service<RulePay>{
	public RulePay getCurrentByCount(int count);
}
