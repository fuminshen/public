package com.fumin.distribution.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fumin.distribution.dao.RulePayDao;
import com.fumin.distribution.service.RulePayService;
import com.fumin.distribution.vo.RulePay;

@Service
@Transactional
public class RulePayServiceImpl extends ServiceImpl<RulePay>implements RulePayService {

	@Override
	public RulePay getCurrentByCount(int count) {
		return ((RulePayDao)dao).getCurrentByCount(count);
	}

}
